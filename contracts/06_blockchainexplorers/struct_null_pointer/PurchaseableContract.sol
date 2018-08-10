// Own development
pragma solidity ^0.4.23;

contract PurchaseableContract {
    struct OwnerHistoryEntry {
        address ethereumAddress;
        uint ownershipEnd;
    }
    
    address owner = msg.sender;
    uint ownershipStart = block.number;
    OwnerHistoryEntry[] ownerHistory;
    
    constructor () payable public {}
    
    function purchase() public payable {
        require(msg.value >= 1 ether);
		
        // Set new owner
        address oldOwner = owner;
        owner = msg.sender;

		// Save old owner in owner history
        OwnerHistoryEntry storage entry;
        entry.ethereumAddress = oldOwner;
        entry.ownershipEnd = block.number - ownershipStart;
        ownerHistory.push(entry);
    
        ownershipStart = block.number;
    }
    
    function withdraw() public {
        require(msg.sender == owner);
        owner.transfer(address(this).balance);
    }
}