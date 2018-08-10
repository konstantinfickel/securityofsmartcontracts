// won work
pragma solidity ^0.4.23;

contract Government {
    address[] creditors;
    uint lastBlock = block.number;
    
    constructor() public payable {
        creditors.push(msg.sender);
    }

    function lendGovernmentMoney() public payable {
        require(msg.value > 0);
        
        if(block.number - lastBlock > 6 * 60 * 6) {
            creditors[creditors.length - 1].transfer(address(this).balance - msg.value);
            creditors = new address[](0);
        }
        
        creditors.push(msg.sender);
        lastBlock = block.number;
    }
}
