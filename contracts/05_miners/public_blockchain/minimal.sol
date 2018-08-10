// own work
pragma solidity ^0.4.23;

contract RockPaperScissors {
    enum Move {
        Rock,
        Paper,
        Scissors,
        NotInGame
    }
    
    struct Player {
        address paymentAddress;
        Move move;
    }
    
    Player playerOne = Player({
        move: Move.NotInGame,
        paymentAddress: address(0)
    });
    Player playerTwo = Player({
        move: Move.NotInGame,
        paymentAddress: address(0)
    });

    uint constant commitment = 1 ether;
    uint constant fee = 100 finney;

    address owner;
    
    mapping(address => uint) public balances;

    constructor () public {
        owner = msg.sender;
    }
    
    function hasPlayerWon(Move player, Move opponent) internal pure returns (bool) {
        return (player == Move.Scissors && opponent == Move.Paper) || 
            (player == Move.Paper && opponent == Move.Rock) ||
            (player == Move.Rock && opponent == Move.Scissors);
    }    

    // entry condition: Both players have played.
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
    

    function play(Move move) public payable {
        require(move != Move.NotInGame);
        
        uint senderAccountBalance = msg.value + balances[msg.sender];

        require(senderAccountBalance >= commitment);
        
        senderAccountBalance -= commitment;
        balances[msg.sender] = senderAccountBalance;
        
        if (playerOne.move == Move.NotInGame) {
            playerOne.move = move;
            playerOne.paymentAddress = msg.sender;
        } else if(playerTwo.move == Move.NotInGame && playerOne.paymentAddress != msg.sender) {
            playerTwo.move = move;
            playerTwo.paymentAddress = msg.sender;

            resolve();
        } else {
            revert();
        }
    }
    
    function withdraw () public {
        uint withdrawerBalance = balances[msg.sender];
        
        require(withdrawerBalance > 0);
        
        balances[msg.sender] = 0;
        msg.sender.transfer(withdrawerBalance);
    }
}
