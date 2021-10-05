// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;
import "./SearchLibrary.sol";
contract UseSearchLibrary {
    using Search for uint[];
    uint[] public data;
    function append(uint value) public {
        data.push(value);
    }
    function replace(uint _old, uint _new) public {
     // This performs the library function call
        int index = data.indexOf(_old);
        if (index == -1) {
            data.push(_new);
        }
        else {
            data[uint(index)] = _new;
        }
    }

}