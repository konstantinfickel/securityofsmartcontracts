// own work
pragma solidity ^0.4.23;

contract FairPonzi {
    struct Investor {
        bool wasPaidFirstTime;
        uint isOwner;
        address player;
    }
    
    uint public iterator = 0;
    Investor[] public investors;
    
    constructor() public {
        // as a fee I only want the 1 ether from the first player.
        investors.push(Investor({
            wasPaidFirstTime: true,
            isOwner: 1,
            player: msg.sender
        }));
    }

    function invest() public payable {
        require(msg.value == 1 ether);
        
        if(investors[iterator].wasPaidFirstTime) {
            iterator++;
        } else {
            investors[iterator].wasPaidFirstTime = true;
        }
        
        Investor storage newInvestor;
        newInvestor.wasPaidFirstTime = false;
        newInvestor.player = msg.sender;
        investors.push(newInvestor);
        
        investors[iterator].player.transfer(1 ether);
    }
}
