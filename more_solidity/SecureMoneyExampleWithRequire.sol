// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.1;

contract MoneyExample {
    address public owner;
    uint public balanceReceived;
    constructor() {
        owner = msg.sender;
    }
    function receiveMoney() public payable {
        require(owner == msg.sender, "You are not the owner");
        balanceReceived += msg.value;
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function transferAllMoney() public {
        require(owner == msg.sender, "You are not the owner");
        address payable to = payable(msg.sender);
        to.transfer(getBalance());
    }
    
    function transferAllMoneyTo(address payable _to) public {
        require(owner == msg.sender, "You are not the owner");         
        _to.transfer(getBalance());
    }
}