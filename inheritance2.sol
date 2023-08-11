// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.6 <0.9.0;

// Base contract Person........

contract Person {
    string public name;
    uint256 public age;

    constructor(string memory _name, uint256 _age) {
        name = _name;
        age = _age;
    }

    function updatePerson(string memory _name, uint256 _age) public {
        name = _name;
        age = _age;
    }
}

// Derived contract Student, inheriting from Person.......

contract Student is Person {
    uint256 public rollNumber;

    constructor(string memory _name, uint256 _age, uint256 _rollNumber)
        Person(_name, _age)
    {
        rollNumber = _rollNumber;
    }

    function updateStudent( string memory _name, uint256 _age, uint256 _rollNumber ) public 
    {
        updatePerson(_name, _age);
        rollNumber = _rollNumber;
    }
}
