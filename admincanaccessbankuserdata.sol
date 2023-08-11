//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Bank {
    address public admin;
    
    struct User {
        uint balance;
    }
    
    mapping(address => User) public users;
    
    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can perform this action");
        _;
    }
    
    constructor() {
        admin = msg.sender;
    }
    
    function deposit() external payable {
        users[msg.sender].balance += msg.value;
    }
    
    function checkBalance() external view returns (uint) {
        return users[msg.sender].balance;
    }
    
    function isAdmin() external view returns (bool) {
        return msg.sender == admin;
    }
    
    function withdraw(address userAddress, uint amount) external onlyAdmin {
        require(users[userAddress].balance >= amount, "Insufficient balance");
        users[userAddress].balance -= amount;
        payable(userAddress).transfer(amount);
    }
}
