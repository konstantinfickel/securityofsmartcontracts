// own work
pragma solidity ^0.4.24;

contract RockPaperScissors {
    enum Move {
        Rock,
        Paper,
        Scissors,
        NotInGame,
        NotRevealedYet
    }
    
    struct Player {
        bytes32 commitment;
        address paymentAddress;
        Move move;
    }
    
    Player playerOne = Player({
        move: Move.NotInGame,
        paymentAddress: address(0),
        commitment: bytes32(0)
    });
    Player playerTwo = Player({
        move: Move.NotInGame,
        paymentAddress: address(0),
        commitment: bytes32(0)
    });

    uint constant commitment = 1 ether;
    uint constant fee = 100 finney;
    uint constant deposit = 1 ether;

    uint lastChange;
    uint constant timeoutBlocks =  1 * 60 * 5; // 1 hour in blocks
    
    address owner;
    
    mapping(address => uint) public balances;
    
    modifier onlyAfterTimeout() {
        require(block.number >= lastChange + timeoutBlocks);
        _;
    }
    
    modifier resettingTimeout() {
        _;
        lastChange = block.number;
    }


    constructor () public {
        owner = msg.sender;
    }
    
    function commit(bytes32 inputCommitment) public payable resettingTimeout {
        uint senderAccountBalance = msg.value + balances[msg.sender];

        require(senderAccountBalance >= commitment + deposit);
        
        senderAccountBalance -= deposit + commitment;
        balances[msg.sender] = senderAccountBalance;
        
        // Select Player with smaller number, that is not in the game
        Player storage currentPlayer = playerTwo;
        if (playerOne.move == Move.NotInGame) {
            currentPlayer = playerOne;
        } else if(playerTwo.move != Move.NotInGame
            || playerOne.paymentAddress == msg.sender) {
            revert();
        }
        
        currentPlayer.move = Move.NotRevealedYet;
        currentPlayer.paymentAddress = msg.sender;
        currentPlayer.commitment = inputCommitment;
    }
    
    function hasPlayerWon(Move player, Move opponent) internal pure returns (bool) {
        return (player == Move.Scissors && opponent == Move.Paper) ||
            (player == Move.Paper && opponent == Move.Rock) ||
            (player == Move.Rock && opponent == Move.Scissors);
    }    

    // [Entry condition] Both players have revealed,
    // or both players have committed and time has run out.
    function resolve() internal {
        uint newPlayerOneBalance = balances[playerOne.paymentAddress];
        uint newPlayerTwoBalance = balances[playerTwo.paymentAddress];
        uint newOwnerBalance = balances[owner];
        
        if(playerOne.move >= Move.NotInGame && playerTwo.move >= Move.NotInGame) {
            // If both players didn't reveal, keep all the deposits and commitments
            newOwnerBalance += 2 * commitment + 2 * deposit;
        } else if(playerOne.move >= Move.NotInGame) {
            // If one player didn't reveal, treat other player as if he had won,
            // and keep deposit
            newPlayerTwoBalance += 2 * commitment + deposit - fee;
            newOwnerBalance += fee + deposit;
        } else if(playerTwo.move >= Move.NotInGame) {
            newPlayerOneBalance += 2 * commitment + deposit - fee;
            newOwnerBalance += fee + deposit;
        } else if(hasPlayerWon(playerOne.move, playerTwo.move)) {
            newPlayerOneBalance += 2 * commitment + deposit - fee;
            newPlayerTwoBalance += deposit;
            newOwnerBalance += fee;
        } else if (hasPlayerWon(playerTwo.move, playerOne.move)) {
            newPlayerTwoBalance += 2 * commitment + deposit - fee;
            newPlayerOneBalance += deposit;
            newOwnerBalance += fee;
        } else {
            newPlayerTwoBalance += commitment + deposit;
            newPlayerOneBalance += commitment + deposit;
        }
        
        balances[playerOne.paymentAddress] = newPlayerOneBalance;
        balances[playerTwo.paymentAddress] = newPlayerTwoBalance;
        balances[owner] = newOwnerBalance;

        playerOne.move = Move.NotInGame;
        playerTwo.move = Move.NotInGame;
    }
    
    function hasRevealed(Move move) internal pure returns(bool) {
        return move < Move.NotInGame;
    }
    
    function isCorrectMove(Move move) internal pure returns(bool) {
        return move == Move.Rock || move == Move.Scissors || move == Move.Paper;
    }

    // Player can reveal if other player has not committed yet,
    // but only makes himself vulnerable by doing that
    function reveal(Move move, string salt) public resettingTimeout() {
        Player storage currentPlayer = playerTwo;
        
        if(playerOne.paymentAddress == msg.sender && playerOne.move == Move.NotRevealedYet) {
            currentPlayer = playerOne;
        } else if(!(playerTwo.paymentAddress == msg.sender && playerTwo.move == Move.NotRevealedYet)) {
            revert();
        }
        
        require(keccak256(abi.encodePacked(move, salt)) == currentPlayer.commitment);
        require(isCorrectMove(move));
        currentPlayer.move = move;
        
        if(hasRevealed(playerOne.move) && hasRevealed(playerTwo.move)) {
            resolve();
        }
    }
    
    function calculateCommitment(Move move, string salt) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(move, salt));
    }
    
    function kickUnrevealed() onlyAfterTimeout resettingTimeout public {
        require(playerOne.move != Move.NotInGame && playerTwo.move != Move.NotInGame);
        
        resolve();
    }
    
    function withdraw () public {
        uint withdrawerBalance = balances[msg.sender];
        
        require(withdrawerBalance > 0);
        
        balances[msg.sender] = 0;
        msg.sender.transfer(withdrawerBalance);
    }
}
