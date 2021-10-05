//SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;
contract GlobalVarAndEventDemo {
    uint public value; 
    address public owner;
    uint public sum;
    event TestEvent(uint result, uint gasUSed, uint gasPrice);
    
    constructor() {
        owner = msg.sender;
    }
    
    function getSender() public view returns(address, uint, uint) {
        uint startGas = gasleft();
        return (msg.sender, startGas - gasleft(), tx.gasprice);
    }
    
    function setValue() public payable  {
        value = msg.value;
        
    }
    
    function doMath() public returns (uint, uint, uint) {
        uint result;
        uint startGas = gasleft();
        for(uint8 i = 0; i < 100; i++) {
            result += uint(100 * 3 - 400 / 5 + 6000);
        }
        sum = result;
        emit TestEvent(result,startGas - gasleft(),  tx.gasprice);
        return (result,startGas - gasleft(),  tx.gasprice);
    }
    function getSenderBalance() public view returns (uint) {
        return msg.sender.balance;
    }
    function getContractBalance() public view returns (uint) {
        return address(this).balance;
    }

}