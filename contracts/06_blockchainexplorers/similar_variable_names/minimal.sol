// own work
pragma solidity ^0.4.23;

contract MeanPonzi {
    struct Investor {
        uint refund;
        address player;
    }

    Investor[] investors;
    uint p1ayerIterator = 0;
    function invest() public payable {
        investors.push(Investor({
            refund: msg.value * 2,
            player: msg.sender
        }));
        for(uint playerIterator = 0; playerIterator < investors.length; playerIterator++) {
            uint amount = investors[playerIterator].refund;
            if(amount == 0) continue;
            if(amount > address(this).balance) break;
            investors[playerIterator].refund = 0;
            address refundAdress = investors[p1ayerIterator].player;
            refundAdress.transfer(amount);
        }
    }
}

