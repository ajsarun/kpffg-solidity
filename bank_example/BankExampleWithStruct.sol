//SPDX-License-Identifier: MIT

pragma solidity ^0.8.1;

contract BankExample {
    struct Deposit {
        uint amount;
        uint timestamp;
    }
    struct Balance {
        uint totalBalance;
        uint numDeposits;
        mapping(uint => Deposit) deposits;
    }
    mapping(address => Balance) public balanceInAccount;

    function getBankBalance() public view returns(uint) {
        return address(this).balance;
    }

    function depositMoney() public payable {
        balanceInAccount[msg.sender].totalBalance += msg.value;
        Deposit memory deposit = Deposit({amount: msg.value, timestamp: block.timestamp});
        balanceInAccount[msg.sender].deposits[balanceInAccount[msg.sender].numDeposits] = deposit;
        balanceInAccount[msg.sender].numDeposits++; 
        
    }

    function withdrawAllMoney() public {
        uint balanceToWithDraw = balanceInAccount[msg.sender].totalBalance;
        balanceInAccount[msg.sender].totalBalance = 0;
        payable(msg.sender).transfer(balanceToWithDraw);
    }
    
    function withdrawMoney(uint _amount) public enoughMoney(_amount) {
        balanceInAccount[msg.sender].totalBalance -=  _amount;
        payable(msg.sender).transfer(_amount);
    }
    
    function getDepositByIndex(uint _index) public view returns(uint, uint) {
        return (balanceInAccount[msg.sender].deposits[_index].
        amount,balanceInAccount[msg.sender].deposits[_index].timestamp);
    }
    
    function transferAllMoney(address payable _to) public {
        uint balanceToTransfer = balanceInAccount[msg.sender].totalBalance;
        balanceInAccount[msg.sender].totalBalance = 0;
        _to.transfer(balanceToTransfer);
    }
    function transferMoney(address payable _to, uint _amount) public enoughMoney(_amount) {
        balanceInAccount[msg.sender].totalBalance -= _amount;
        _to.transfer(_amount);
    }
    modifier enoughMoney(uint _amount) {
        require (balanceInAccount[msg.sender].totalBalance >= _amount, "You do not have enough money in your account");
        _;
    }
}