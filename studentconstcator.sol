// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentRecords {
    struct Student {
        uint id;
        string name;
        uint age;
    }

    mapping(uint => Student) public students; // Mapping to store student records
    uint public totalStudents; // Variable to keep track of the total number of students

    constructor() {
        // Initialize the contract with some initial students
        addStudent(1, "Alice", 20);
        addStudent(2, "Bob", 22);
        addStudent(3, "Charlie", 21);
    }

    function addStudent(uint _id, string memory _name, uint _age) public {
        require(students[_id].age == 0, "Student with the same ID already exists");
        
        Student memory newStudent = Student(_id, _name, _age);
        students[_id] = newStudent; // Add a new student record to the mapping
        totalStudents++; // Increment the total number of students
    }

    function getStudent(uint _id) public view returns (uint, string memory, uint) {
        require(students[_id].age != 0, "Student record not found");
        Student memory student = students[_id];
        return (student.id, student.name, student.age); // Get the student record by ID
    }
    function deletestudent(uint _id) public {
        delete students[_id];
    }
}