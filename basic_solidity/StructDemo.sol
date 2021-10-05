// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;

contract StructDemo {
    struct Student {
        string name;
        uint id;
    } 
    Student public student;
    function createStudent(uint _id, string memory _name) public {
        /*3 ways to initilize */
        student.id = _id;
        student.name = _name;
        
        /*student = Student({
            id: _id,
            name: _name
        });*/
        
        //student = Student(_name, _id); //short hand (functions like).
        
       
    }
    function getId() public view returns (uint) {
        return student.id;
    }
    function getName() public view returns (string memory) {
        return student.name;
    }
} 