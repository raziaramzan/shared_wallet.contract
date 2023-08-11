// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EngineerRegistry {
    // Struct to store engineer data
    struct Engineer {
        uint256 id;          // Unique identifier for the engineer
        string name;         // Name of the engineer
        string specialization; // Field of specialization
        uint256 experience;  // Years of experience
        address walletAddress; // Ethereum address of the engineer
    }

    // Mapping to store engineer data by their Ethereum address
    mapping(address => Engineer) public engineers;

    // Function to add an engineer to the registry
    function addEngineer(
        uint256 id,
        string memory name,
        string memory specialization,
        uint256 experience
    ) external {
        require(engineers[msg.sender].walletAddress == address(0), "Engineer already exists");
        
        engineers[msg.sender] = Engineer({
            id: id,
            name: name,
            specialization: specialization,
            experience: experience,
            walletAddress: msg.sender
        });
    }

    // Function to get engineer data by Ethereum address
    function getEngineerByAddress(address engineerAddress) external view returns (Engineer memory) {
        return engineers[engineerAddress];
    }
}
