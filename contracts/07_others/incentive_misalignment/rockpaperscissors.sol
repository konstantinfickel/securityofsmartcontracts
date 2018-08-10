// own work
pragma solidity ^0.4.23;

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

    address owner;
    
    mapping(address => uint) public balances;
    
    constructor () public {
        owner = msg.sender;
    }
    
    function commit(bytes32 inputCommitment) public payable {
        uint senderAccountBalance = msg.value + balances[msg.sender];

        require(senderAccountBalance >= commitment);
        
        senderAccountBalance -= commitment;
        balances[msg.sender] = senderAccountBalance;
        
        // Select Player with smaller number, that is not in the game
        Player storage currentPlayer = playerTwo;
        if (playerOne.move == Move.NotInGame) {
            currentPlayer = playerOne;
        } else if(playerTwo.move != Move.NotInGame || playerOne.paymentAddress == msg.sender) {
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

    // entry condition: Both players have revealed. Or both players have commited and time has run out.
    function resolve() internal {
        uint newPlayerOneBalance = balances[playerOne.paymentAddress];
        uint newPlayerTwoBalance = balances[playerTwo.paymentAddress];
        uint newOwnerBalance = balances[owner];
        
        if(hasPlayerWon(playerOne.move, playerTwo.move)) {
            newPlayerOneBalance += 2 * commitment - fee;
            newOwnerBalance += fee;
        } else if (hasPlayerWon(playerTwo.move, playerOne.move)) {
            newPlayerTwoBalance += 2 * commitment - fee;
            newOwnerBalance += fee;
        } else {
            newPlayerTwoBalance += commitment;
            newPlayerOneBalance += commitment;
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
    
    function getMoveFromNonce(uint nonce) internal pure returns(Move) {
        return Move(nonce % 3);
    }
    
    // Player can reveal if other player has not commited yet, but only makes himself vulnerable by doing that
    function reveal(uint nonce) public {
        Player storage currentPlayer = playerTwo;
        
        if(playerOne.paymentAddress == msg.sender && playerOne.move == Move.NotRevealedYet) {
            currentPlayer = playerOne;
        } else if(!(playerTwo.paymentAddress == msg.sender && playerTwo.move == Move.NotRevealedYet)) {
            revert();
        }
        
        require(keccak256(nonce) == currentPlayer.commitment);
        currentPlayer.move = getMoveFromNonce(nonce);
        
        if(hasRevealed(playerOne.move) && hasRevealed(playerTwo.move)) {
            resolve();
        }
    }
    
    function withdraw () public {
        uint withdrawerBalance = balances[msg.sender];
        
        require(withdrawerBalance > 0);
        
        balances[msg.sender] = 0;
        msg.sender.transfer(withdrawerBalance);
    }
}
