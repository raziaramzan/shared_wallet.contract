//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Town {
    // Structure to represent a building
    struct Building {
        address owner;
        string name;
        uint256 value;
    }

    // Mapping to store the buildings by their unique IDs
    mapping(uint256 => Building) public buildings;

    // The total number of buildings in the town
    uint256 public totalBuildings;

    // Events for tracking building ownership transfers
    event BuildingCreated(uint256 indexed buildingId, string name, uint256 value, address indexed owner);
    event BuildingTransferred(uint256 indexed buildingId, address indexed previousOwner, address indexed newOwner);

    // Modifier to check if the caller is the owner of a specific building
    modifier onlyBuildingOwner(uint256 _buildingId) {
        require(buildings[_buildingId].owner == msg.sender, "You are not the owner of this building.");
        _;
    }

    // Constructor to initialize the contract
    constructor() {
        totalBuildings = 0;
    }

    // Function to create a new building in the town
    function createBuilding(string memory _name, uint256 _value) external {
        totalBuildings++;
        buildings[totalBuildings] = Building(msg.sender, _name, _value);
        emit BuildingCreated(totalBuildings, _name, _value, msg.sender);
    }

    // Function to transfer ownership of a building
    function transferBuildingOwnership(uint256 _buildingId, address _newOwner) external onlyBuildingOwner(_buildingId) {
        require(_newOwner != address(0), "Invalid new owner address.");
        buildings[_buildingId].owner = _newOwner;
        emit BuildingTransferred(_buildingId, msg.sender, _newOwner);
    }
}
