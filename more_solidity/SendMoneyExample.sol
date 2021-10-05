// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.1;

contract MoneyExample {

    uint public balanceReceived;

    function receiveMoney() public payable {
        balanceReceived += msg.value;
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function transferAllMoney() public {
        address payable to = payable(msg.sender);
        to.transfer(getBalance());
        //(bool success,) = to.call{value:getBalance()}("");
        //require(success, "transfer fail");
    }
    
    function transferAllMoneyTo(address payable _to) public {
        _to.transfer(getBalance());
        //(bool success,) = _to.call{value:getBalance()}("");
        //require(success, "transfer fail");
    }
    
}