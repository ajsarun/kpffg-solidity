// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.1;

contract MoneyExample {

    uint public balanceReceived;
    uint public lockedUntil;

    function receiveMoney() public payable {
        balanceReceived += msg.value;
        lockedUntil = block.timestamp + 1 minutes;
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function transferAllMoney() public {
        require(lockedUntil < block.timestamp, "you are under timelock");
        address payable to = payable(msg.sender);
        to.transfer(getBalance());
        
    }
    
    function transferAllMoneyTo(address payable _to) public {
        require(lockedUntil < block.timestamp, "you are under timelock");
        _to.transfer(getBalance());
        
    }
    
}