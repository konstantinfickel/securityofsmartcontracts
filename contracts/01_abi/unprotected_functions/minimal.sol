// own work
pragma solidity ^0.4.23;

contract WalletABI {
    function refundOwner() public;
    function () public payable;
}

contract WalletLibrary { 
    address owner;

    function refundOwner() public {
        require(msg.sender == owner);
        owner.transfer(address(this).balance);
    }
    
    function initWallet(address _owner) public {
        owner = _owner;
    }
}

contract Wallet {
    address owner;
    address walletLibrary;

    function() public payable {
        if(!(msg.value > 0))
            walletLibrary.delegatecall(msg.data);
    }

    constructor (address owner, address _walletLibrary) public {
        walletLibrary = _walletLibrary;
        walletLibrary.delegatecall(bytes4(sha3("initWallet(address)")), owner);
    }
}
