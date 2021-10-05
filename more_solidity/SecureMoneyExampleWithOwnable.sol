// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.1;
import "./Ownable.sol";

contract MoneyExample is Ownable {
    uint public balanceReceived;
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
    
    
}