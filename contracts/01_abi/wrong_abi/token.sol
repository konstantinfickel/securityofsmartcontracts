// own work
pragma solidity ^0.4.23;

// Colission found! hash(sendThoseBucksToTheAccountThanks(uint256,bool,address)) = hash(compareParametersAndRecieveCryptoInstantaneously(int256[])) = 8b8e2ec9

contract BountyContract {
    function () public payable {}
    function compareParametersAndRecieveCryptoInstantaneously(int256[] attempt) public {
        require(attempt.length == 1);
        require(attempt[0] == 1154414090619811796818182302139415280051214250812);
        
        require(address(this).balance > 0);
        msg.sender.transfer(1 ether);
    }
}

contract BuckToken {
    mapping(address => uint176) public balance;
    
    event Transaction(address from, address to, uint176 amount);
    
    constructor() public {
        balance[msg.sender] = 1000;
    }
    
    function sendThoseBucksToTheAccountThanks(uint176 amount, bool createLog, address to) public {
        require(amount <= balance[msg.sender]);
        balance[msg.sender] -= amount;
        balance[to] += amount;
        
        if(createLog) {
            emit Transaction(msg.sender, to, amount);   
        }
    }
}
