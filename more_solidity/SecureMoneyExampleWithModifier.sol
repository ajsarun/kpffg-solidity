// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.1;

contract MoneyExample {
    address public owner;
    uint public balanceReceived;
    constructor() {
        owner = msg.sender;
    }
    function receiveMoney() public payable ownerOnly {
        balanceReceived += msg.value;
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function transferAllMoney() ownerOnly public {
        address payable to = payable(msg.sender);
        to.transfer(getBalance());
    }
    
    function transferAllMoneyTo(address payable _to) ownerOnly public {
        
        _to.transfer(getBalance());
    }
    modifier ownerOnly() {
        require(owner == msg.sender, "You are not the owner");
        _;
    }
    
}