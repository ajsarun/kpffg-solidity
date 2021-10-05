// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.1;

contract MoneyExample {
    address public owner;
    bool public paused;
    uint public balanceReceived;
    constructor() {
        owner = msg.sender;
    }
    
    function setPaused(bool _paused) public ownerOnly {
        paused = _paused;
    }
    function receiveMoney() public payable ownerOnly {
         balanceReceived += msg.value;
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function transferAllMoney() ownerOnly notPaused public {
        address payable to = payable(msg.sender);
        to.transfer(getBalance());
    }
    
    function transferAllMoneyTo(address payable _to) ownerOnly notPaused  public {
        
        _to.transfer(getBalance());
    }
    modifier ownerOnly() {
        require(owner == msg.sender, "You are not the owner");
        _;
    }
    modifier notPaused() {
        require (paused == false, "The contract is paused");
        _;
    }
    function destroySmartContract(address payable _to) ownerOnly public {
        selfdestruct(_to);
    }
    
    
    
}