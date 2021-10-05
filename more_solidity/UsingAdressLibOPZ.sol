// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Address.sol";

contract UseAddressLibrary {
    using Address for address payable;
    using Address for address;
    function isContractAddress(address _addr) public view returns(bool) {
        return _addr.isContract();
    }
    function trasferMoney(address _addr, uint _amount) public {
        payable(_addr).sendValue(_amount);
        //payable(_addr).transfer(_amount);
        //(bool success,) = _addr.call{value:_amount}("");
        //require(success, "transfer fail");
    }  
    receive() external payable {
        
    } 
}