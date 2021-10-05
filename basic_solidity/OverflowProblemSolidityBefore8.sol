//SPDX-License-Identifier: MIT
pragma solidity 0.6.12;
contract OveflowExample {
    uint8 public num;
    constructor() public {
        num = 255;
    }
    function increment(uint8 _inc) public {
        //require (num +_inc >= num, "overflow occurs");
        num += _inc;
        //assert(num  >= _inc);
    }
}
