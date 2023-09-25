// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AddressCodeChecker {

    //  this function will accept an address and check whether that address is a contract address or EOA 
    // contract address has code associate with it so this function will return true in that case 
    // for EOA ther is no code present so this function will return false in that case
    function hasCode(address _target) public view returns (bool) {
        uint32 size;
        assembly {
            size := extcodesize(_target)
        }
        return (size > 0);
    }
}