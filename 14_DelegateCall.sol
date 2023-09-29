// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Target {
    uint256 public value;

    function setValue(uint256 _newValue) public {
        value = _newValue;
    }
}

contract Caller {
    address public targetAddress;
    uint256 public callerValue;

    constructor(address _targetAddress) {
        targetAddress = _targetAddress;
    }

    function setValue(uint256 _newValue) public {
        (bool success, ) = targetAddress.delegatecall(abi.encodeWithSignature("setValue(uint256)", _newValue));
        require(success, "Delegate call failed");
        callerValue = _newValue;
    }
}