// own work
pragma solidity ^0.4.23;

contract NewContract {
    address owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    // ...
}
