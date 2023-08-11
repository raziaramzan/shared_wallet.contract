//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingSystem {
    address public admin;
    mapping(address => bool) public hasVoted;
    mapping(address => bool) public isAdmin;
    
    constructor() {
        admin = msg.sender;
        isAdmin[msg.sender] = true;
    }
    
    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can perform this action");
        _;
    }
    
    modifier hasNotVoted() {
        require(!hasVoted[msg.sender], "You have already voted");
        _;
    }
    
    function addAdmin(address newAdmin) public onlyAdmin {
        isAdmin[newAdmin] = true;
    }
    
    function removeAdmin(address adminToRemove) public onlyAdmin {
        require(adminToRemove != admin, "Cannot remove the main admin");
        isAdmin[adminToRemove] = false;
    }
    
    function vote(bool choice) public hasNotVoted {
        hasVoted[msg.sender] = true;
        // Perform voting logic here
    }
    
    // Function to retrieve user data - only accessible by admin
    function getUserData(address user) public view onlyAdmin returns (bool hasVotedStatus) {
        return hasVoted[user];
    }
}
