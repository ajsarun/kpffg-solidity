//SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

contract SimpleMappingExample {

    mapping(uint => bool) public myMapping;
    mapping(address => bool) public myAddressMapping;
    mapping (uint => mapping(uint => bool)) public uintUintBoolMapping;
    mapping(address => mapping(uint => bool)) public addressNumberBoolean;

    function setMyMapping(uint _index, bool _value) public {
        myMapping[_index] = _value;
    }

    function setMyAddressMapping(bool _value) public {
        myAddressMapping[msg.sender] = _value;
    }
    
    function setUintUintBoolMapping(uint _index1, uint _index2, bool _value) public {
        uintUintBoolMapping[_index1][_index2] = _value;
    } 

    function getMapValueFromAddress(address _addr, uint _num) public view returns(bool) {
        return addressNumberBoolean[_addr][_num];
    }
    
    function setMapValueToAddress(address _addr, uint _num, bool _flag) public  {
        addressNumberBoolean[_addr][_num] = _flag;
    }
    function resetValueOfMapOfAddress(address _addr, uint _num) public {
        delete addressNumberBoolean[_addr][_num];
    }

}