// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentRegistry {
    struct Student {
        uint256 studentId;
        string name;
        uint256 age;
    }
    
    Student[] public students;

    function addStudent(uint256 _studentId, string memory _name, uint256 _age) public {
        Student memory newStudent = Student(_studentId, _name, _age);
        students.push(newStudent);
    }

    function getStudentCount() public view returns (uint256) {
        return students.length;
    }

    function getStudent(uint256 index) public view returns (uint256, string memory, uint256) {
        require(index < students.length, "Index out of bounds");
        Student memory student = students[index];
        return (student.studentId, student.name, student.age);
    }
}
