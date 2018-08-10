// own work
pragma solidity ^0.4.23;

contract HorribleLottery {
    function play() public payable {
        require(msg.value == 1 ether);

        if(uint256(keccak256(block.timestamp)) % 2 == 0) {
            msg.sender.transfer(address(this).balance);
        }     
    }
}
