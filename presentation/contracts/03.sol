pragma solidity ^0.4.23;

contract CrowdFunding {
    enum State {
        FUNDING,
        FAILED,
        SUCCEEDED
    }
    State state;

    bytes32 private passwordHash;

    uint minimal = 10 ether;
    uint endOfFundingPeriod = block.timestamp + 2 days;

    mapping(address => uint) deposit;
    
    function () public payable {
        deposit[msg.sender] += msg.value;
    }

    function CrowdFunding(bytes32 _passwordHash) public {
        passwordHash = _passwordHash;
    }
    
    function updateState() public {
        require(state == State.FUNDING);
        require(block.timestamp >= endOfFundingPeriod);
        
        state = address(this).balance >= minimal
            ? State.SUCCEEDED
            : State.FAILED;
    }
    
    function finishFunding(uint _password) public {
        require(state == State.SUCCEEDED);
        require(passwordHash == keccak256(abi.encodePacked(_password)));
        
        selfdestruct(msg.sender);
    }
    
    function withdrawDeposit() public {
        require(state == State.FAILED);
        require(deposit[msg.sender] != 0);
        
        uint amount = deposit[msg.sender];
        deposit[msg.sender] = 0;
        msg.sender.call.value(amount)();
    }
}
