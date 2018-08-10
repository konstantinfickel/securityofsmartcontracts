// own work
pragma solidity ^0.4.23;

contract MinimalToken {
    mapping(address => uint32) public balances;
    
    constructor() public {
        balances[msg.sender] = 10 ** 6;
    }
    
    function transfer(address to, uint32 amount, uint32 fee) public {
        require(balances[msg.sender] >= amount + fee);
        balances[msg.sender] -= amount + fee;
        balances[to] += amount;
    }
}
