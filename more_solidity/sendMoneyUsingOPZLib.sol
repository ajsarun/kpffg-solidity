// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.1;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract MoneyExample is Ownable {
    uint public balanceReceived;
    function receiveMoney() public payable onlyOwner {
        balanceReceived += msg.value;
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function transferAllMoney() onlyOwner public {
        address payable to = payable(msg.sender);
        to.transfer(getBalance());
    }
    
    function transferAllMoneyTo(address payable _to) onlyOwner public {
        _to.transfer(getBalance());
    }
    
    
}