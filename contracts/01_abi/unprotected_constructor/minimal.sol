// own work
pragma solidity ^0.4.23;

contract NewContract {
    address owner;
    
    function OldContract() public {
        owner = msg.sender;
    }
    
    // ...
}
