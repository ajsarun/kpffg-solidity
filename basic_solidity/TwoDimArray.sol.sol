// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;
//pragma experimental ABIEncoderV2;
contract TwodimArrayDemo {
    uint[2][3] public c = [[1,2],[2,3],[3,4]]; // (uint[2]) [3] 3 rows 2 columns
    uint [][3] public d; // 3 arrays each is dynamic array 
    uint [2][] public e; // dynamic array its element is fixed sized array that contain 2 elements
    
    function setC() public {
        uint num = 0;
        for(uint i =0; i < 3; i++) {
            for(uint j = 0; j < 2; j++) {
                c[i][j] = num;
                num++;
            }
        }
    }
    function setD() public {
        uint num = 0;
        for(uint i =0; i < d.length; i++) {
            for(uint j = 0; j < 2; j++) {
                d[i].push(num);
                num++;
            }
        }
    }
    function setE() public {
        uint num = 0;
        uint[2] memory arr;
        for(uint i =0; i < 3; i++) {
            for(uint j = 0; j < 2; j++) {
                arr[j] = num;
                num++;
            }
            e.push(arr);
        }
        
    }
    function getCIndex(uint i, uint j) public view returns (uint) {
        return c[i][j];
    }
    
    function getDIndex(uint i, uint j) public view returns (uint) {
        return d[i][j];
    }
    
    function getEIndex(uint i, uint j) public view returns (uint) {
        return e[i][j];
    }
     function getC() public view returns (uint[2][3] memory) {
        return c;
    }
    function getD() public view returns (uint[][3] memory) {
        return d;
    }
    function getE() public view returns (uint[2][] memory) {
        return e;
    } 
}