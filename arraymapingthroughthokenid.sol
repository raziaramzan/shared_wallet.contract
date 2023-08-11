// SPDX-License-Identifier:GPL-3.0
pragma solidity ^0.8.0;

contract StudentTokenization {
    struct Student {
        string name;
        uint256 age;
        string grade;
        bytes32 tokenId;
    }

    mapping(address => Student) public students;

    function tokenizeStudent(string memory name, uint256 age, string memory grade) public returns (bytes32) {
        bytes32 tokenId = keccak256(abi.encodePacked(name, age, grade));
        students[msg.sender] = Student(name, age, grade, tokenId);
        return tokenId;
    }

    function getStudentTokenId() public view returns (bytes32) {
        return students[msg.sender].tokenId;
    }
}
