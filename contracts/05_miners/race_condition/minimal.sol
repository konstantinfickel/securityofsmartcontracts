// own work
pragma solidity ^0.4.23;

contract Token {
    address owner = msg.sender;
    mapping(address => uint) public balance;
    uint price = 1 ether;
    
    function buy() public payable {
        require(msg.value > 0);
        require(msg.value % price == 0);
        
        balance[msg.sender] += msg.value / price;
    }
    
    function setPrice(uint _price) public {
        require(msg.sender == owner);
        price = _price;
    }
}
