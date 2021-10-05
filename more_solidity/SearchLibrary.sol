// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;
library Search {
    function indexOf(uint[] storage self, uint value) public view returns (int) {
        for (uint i = 0; i < self.length; i++) {
            if (self[i] == value) return int(i);
        }
        return -1;
    }
}
