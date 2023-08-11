// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentContract {
    struct Student {
        string name;
        uint256 age;
        address[] wallet;
    }

    mapping(address => Student) public students;

    function addStudent(string memory _name, uint256 _age,address) public {
        address studentAddress = msg.sender;
        students[studentAddress] = Student(_name, _age, new address[](0));
    }

    function wallet(address _wallet) public {
        require(students[msg.sender].age > 0, "Student not found.");
        students[msg.sender].wallet.push(_wallet);
    }
}
