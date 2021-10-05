// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;

contract Ownable {
    address owner;
    constructor() {
        owner = msg.sender;
    }
    modifier ownerOnly() {
        require(owner == msg.sender, "You are not the owner");
        _;
    }
    
}