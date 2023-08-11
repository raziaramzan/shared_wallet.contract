//SPDX-License-Identifier:GPL-30
pragma solidity ^0.8.0; 

contract StudentR {
    struct Student {
        string name;
        uint age;
        string major;
    }
}
contract studentrecord is StudentR{


    Student[] public students;
    
    function addStudent(string memory _name, uint _age, string memory _major) public {
        students.push(Student(_name, _age, _major));
    }
    
    function getStudent(uint index) public view returns (string memory, uint, string memory) {
        require(index < students.length, "Invalid index");
        Student memory student = students[index];
        return (student.name, student.age, student.major);
    }

}
contract studentRecordf is StudentR,studentrecord{


    
    function getNumberOfStudents() public view returns (uint) {
        return students.length;
    }

}