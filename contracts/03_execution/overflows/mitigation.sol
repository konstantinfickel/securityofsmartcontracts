// own work
pragma solidity ^0.4.23;

contract MinimalToken {
    mapping(address => uint) public balances;
    
    constructor() public {
        balances[msg.sender] = 10**6;
    }
    
    function transfer(address to, uint amount, uint fee) public {
        require(balances[msg.sender] >= amount + fee);
        require(amount + fee >= amount);
        balances[msg.sender] -= amount + fee;
        balances[to] += amount;
    }
}
