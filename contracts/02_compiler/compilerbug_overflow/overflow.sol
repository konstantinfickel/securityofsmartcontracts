// own work
pragma solidity ^0.4.3;

contract Overflow {
    uint32 a = 0xffffffff;
    uint32 b = 0;

    function run() public returns (uint32) {
        a++;
        return b;
    }
}
