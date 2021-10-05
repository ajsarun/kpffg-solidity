// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;
import "./Called.sol";
contract Caller {
    function setX(Called _called, uint _x) public {
         _called.setX(_x);
    }


    function setXandSendEther(Called _called, uint _x) public payable {
        _called.setXandSendEther{value: msg.value}(_x);
    }
    function getCalleeXandBalance(Called _called) public view returns(uint _x, uint _balance) {
        return (_called.x(), _called.getContractBalance());
    }
    
}
