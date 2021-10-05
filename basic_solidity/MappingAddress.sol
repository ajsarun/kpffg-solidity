// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;

contract MappingAddress {
    mapping(address=>uint) private addressNumber;
    function setNumberToAddress(address _addr, uint _num) public {
        addressNumber[_addr] = _num;
    }
    function getNumberFromAddress(address _addr) public view returns (uint) {
        return addressNumber[_addr];        
    }
    function resetNumberOfAddress(address _addr) public {
        delete addressNumber[_addr];
    }
}