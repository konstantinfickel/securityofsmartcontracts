// own work
pragma solidity ^0.4.23;

contract Reentrancy {
    mapping(address => uint) balance;
    
    function deposit() public payable {
        balance[msg.sender] += msg.value;
    }
    
    function withdraw() public {
        uint senderBalance = balance[msg.sender];
        require(senderBalance > 0);
        balance[msg.sender] = 0;
        msg.sender.transfer(senderBalance);
    }
}
