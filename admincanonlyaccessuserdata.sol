//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UserDataContract {
    address public admin;

    mapping(address => string) private userData;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can access this function");
        _;
    }

    function setUserData(string memory data) public onlyAdmin {
        userData[msg.sender] = data;
    }

    function getUserData(address user) public view returns (string memory) {
        require(msg.sender == user || msg.sender == admin, "You are not authorized to access this data");
        return userData[user];
    }
}
