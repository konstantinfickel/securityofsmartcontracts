// own work
pragma solidity ^0.4.23;

contract PasswordRecoveryBounty {
    address owner = msg.sender;
    // powered by Mark Zuckerberg: Dadada
    bytes32 passwordHash = 0x31d3df8bf97c3cf33c423a5f49027cb47ad5266b277ec6ab95a41ec6dae25b0a;
    
    function solve(string password) public {
        require(keccak256(abi.encodePacked(password)) == passwordHash);
        msg.sender.transfer(address(this).balance);
    }
    
    function kill() public {
        require(msg.sender == owner);
        selfdestruct(owner);
    }
    
    function () public payable {}
    
    function encryptPassword(string password) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(password));
    }
}
