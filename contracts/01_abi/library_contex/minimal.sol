// own work
pragma solidity ^0.4.23;

contract WalletABI {
    function kill() public;
    function () public payable;
}

contract WalletLibrary { 
    address public owner;

    function () public payable {}

    function initWallet(address _owner) public {
        owner = _owner;
    }
    
    function kill() public {
        require(msg.sender == owner);

        selfdestruct(owner);
    }
}

contract Wallet {
    address public owner;
    address walletLibrary;

    function() public payable {
        walletLibrary.delegatecall(msg.data);
    }

    constructor (address owner, address _walletLibrary) public {
        walletLibrary = _walletLibrary;
        walletLibrary.delegatecall(bytes4(keccak256("initWallet(address)")), owner);
    }
}
