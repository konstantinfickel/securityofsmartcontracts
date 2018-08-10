// own work
pragma solidity ^0.4.24;

contract Caution {
    address public tenant;
    address public landlord;
    bool public landlordAllowsWithdrawal = false;

    constructor(address _landlord) public payable {
        landlord = _landlord;
        tenant = msg.sender;
    }

    function allowWithdrawal(bool _newDecision) public {
        require(msg.sender == landlord);
        landlordAllowsWithdrawal = _newDecision;
    }
    
    function withdraw() public {
        require(msg.sender == tenant && landlordAllowsWithdrawal);
        selfdestruct(tenant);
    }
}
