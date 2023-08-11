//SPDX-License-Identifier:GPL-30
pragma solidity >=0.5.0 < 0.9.0;

contract StudentRecord {
    struct Student {
        string name;
        uint256 age;
        string major;
    }

    mapping(address => Student) public students;
    address[] public studentAddresses;

    event StudentAdded(address indexed studentAddress, string name, uint256 age, string major);
    event StudentUpdated(address indexed studentAddress, string name, uint256 age, string major);

    function addStudent(string memory name, uint256 age, string memory major) public {
        require(age > 0, "Age must be greater than zero");

        Student storage newStudent = students[msg.sender];
        newStudent.name = name;
        newStudent.age = age;
        newStudent.major = major;

        studentAddresses.push(msg.sender);

        emit StudentAdded(msg.sender, name, age, major);
    }

    function updateStudent(string memory name, uint256 age, string memory major) public {
        require(age > 0, "Age must be greater than zero");
        require(students[msg.sender].age > 0, "Student data does not exist");

        Student storage updatedStudent = students[msg.sender];
        updatedStudent.name = name;
        updatedStudent.age = age;
        updatedStudent.major = major;

        emit StudentUpdated(msg.sender, name, age, major);
    }

    function getNumberOfStudents() public view returns (uint256) {
        return studentAddresses.length;
    }
}
