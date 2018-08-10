// own work
pragma solidity ^0.4.11;

contract GiveAway {
    address owner = msg.sender;
    event Given(bytes32 message, address target, address giver);
    
    function GiveAway() public payable {}

    function claim() public payable {
        if(msg.value < 1 ether) throw;
        this.releaseEther("", msg.sender, owner);
    }
    
    function releaseEther(bytes32 message, address winner, address _giver) {
        require(msg.sender == address(this));
        require(_winner.send(address(this).balance));
        Given(bytes32(message), _winner, _giver);
    }
}
