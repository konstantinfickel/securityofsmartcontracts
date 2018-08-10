pragma solidity ^0.4.23;

contract CrowdFunding {
    enum State {
        FUNDING,
        FAILED,
        SUCCEEDED
    }
    State state;

    uint private password;

    uint minimal = 10 ether;
    uint endOfFundingPeriod = block.timestamp + 1 hours;

    mapping(address => uint) deposit;
    
    function () public payable {
        deposit[msg.sender] += msg.value;
    }

    function CrowdFunding(uint _password) public {
        password = _password;
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
        require(password == _password);
        
        selfdestruct(msg.sender);
    }
    
    function withdrawDeposit() public {
        require(state == State.FAILED);
        require(deposit[msg.sender] != 0);
        
        msg.sender.call.value(deposit[msg.sender])();
        deposit[msg.sender] = 0;
    }
}
