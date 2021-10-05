// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;

contract Called {
    uint public x;
    function setX(uint _x) public returns (uint) {
        x = _x;
        return x;
    }

    function setXandSendEther(uint _x) public payable returns (uint) {
        x = _x;
        return x;
    }
    function getContractBalance() public view returns(uint) {
        return address (this).balance;
    }
}