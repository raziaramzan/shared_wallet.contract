// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.5.0 < 0.9.0;

contract StudentRecordArray {
    uint[] public stuIds;
    string[] public stuNames;
    uint[] public stuAges;


    function addStudentRecord(uint _id, string memory _name, uint _age) public {
        stuIds.push(_id);
        stuNames.push(_name);
        stuAges.push(_age);
    }

    function getStudent(uint _index) public view returns (uint, string memory, uint) {
        require(_index < stuIds.length, "Index out of bounds");
        return (stuIds[_index], stuNames[_index], stuAges[_index]);
    }

     function updateStudent(uint _index, uint _id, string memory _name, uint _age) public {
        require(_index < stuIds.length, "Index out of bounds");
        stuIds[_index] = _id;
        stuNames[_index] = _name;
        stuAges[_index] = _age;
    }

    function getNumberOfStudents() public view returns (uint) {
        return stuIds.length;
    }
    function popElement() public{
        stuIds.pop();
    }
}