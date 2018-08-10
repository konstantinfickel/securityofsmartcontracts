// own work
pragma solidity ^0.4.24;

contract WrongTypeDeduction {
    address[] ownerList;
    
    function fillOwnerList(address startAddress, uint length) public {
        for(uint i = 0; i < length; i++) {
            ownerList.push(address(uint(startAddress) + i));
        }
    }
    
    function addOwner(address newOwner) public {
        ownerList.push(newOwner);
    }
    
    function isOwner(address toBeChecked) public view returns (bool) {
        for(var i = 0; i < ownerList.length; i++) {
            if(ownerList[i] == toBeChecked) {
                return true;
            }
        }
        return false;
    }
}
