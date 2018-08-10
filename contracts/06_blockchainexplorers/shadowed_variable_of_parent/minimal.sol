// own work
pragma solidity ^0.4.23;

contract Ownable {
    address public owner;
    
    constructor () public {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
}

contract PurchaseableContract is Ownable {
    address public owner;

    function purchase() public payable {
        require(msg.value >= 1 ether);
        owner = msg.sender;
    }

    function withdraw() public onlyOwner {
        msg.sender.transfer(this.balance);
    }
}
