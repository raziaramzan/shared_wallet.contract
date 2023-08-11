// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GullburgColony {
    address public owner;
    string public location;
    uint public price;

    constructor(string memory _location, uint _price) {
        owner = msg.sender;
        location = _location;
        price = _price;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    function changePrice(uint256 _newPrice) public onlyOwner {
        price = _newPrice;
    }
}

contract ResidentialProperty is GullburgColony {
    uint public numBedrooms;
    uint public numBathrooms;

    constructor(
        string memory _location,
        uint _price,
        uint _numBedrooms,
        uint _numBathrooms
    ) GullburgColony(_location, _price) {
        numBedrooms = _numBedrooms;
        numBathrooms = _numBathrooms;
    }
}

contract CommercialProperty is GullburgColony {
    string public propertyType;

    constructor(
        string memory _location,
        uint _price,
        string memory _propertyType
    ) GullburgColony(_location, _price) {
        propertyType = _propertyType;
    }
}
