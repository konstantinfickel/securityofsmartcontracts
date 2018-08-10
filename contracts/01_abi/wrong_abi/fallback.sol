// own work

pragma solidity ^0.4.23;

contract Bank {
    address owner = msg.sender;
    mapping(address => uint) balance;
    
    // tip to owner
    function () public payable {
        deposit(owner);
    }
    
    function deposit(address user) public payable {
        balance[user] += msg.value;
    }
    
    function withdraw() public {
        uint userBalance = balance[msg.sender];
        balance[msg.sender] = 0;
        msg.sender.transfer(userBalance);
    }
}

contract BankABI {
    function deopsit(address StupidUser) public payable;
    function withdarw() public;
}

contract StupidUser {
    function useWallet(BankABI w) public payable {
        w.deopsit.value(address(this).balance)(msg.sender);
    }
}
