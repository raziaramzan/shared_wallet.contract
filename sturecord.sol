// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentRecord {
    // Struct to represent student record
    struct Student {
        uint256 rollNumber;
        string name;
        uint8 age;
        string department;
    }

    // Array to store student records
    Student[] public students;

    // Function to add a new student record
    function addStudent(uint256 _rollNumber, string memory _name, uint8 _age, string memory _department) public {
        Student memory newStudent = Student({
            rollNumber: _rollNumber,
            name: _name,
            age: _age,
            department: _department
        });

        students.push(newStudent);
    }

    // Function to get the total number of student records
    function getNumberOfStudents() public view returns (uint256) {
        return students.length;
    }

    // Function to get a student record by index
    function getStudent(uint256 index) public view returns (uint256 rollNumber, string memory name, uint8 age, string memory department) {
        require(index < students.length, "Invalid index");

        Student memory student = students[index];
        return (student.rollNumber, student.name, student.age, student.department);
    }
}
