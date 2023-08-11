// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PropertyInquiryAndSale {
    struct Property {
        uint propertyId;
        string name;
        address owner;
        bool isAvailable;
        string location;
        uint256 price;
    }

    mapping(uint256 => Property) public Plots;
    uint256 public totalNOfPlots;

    event PropertyAdded(uint256 indexed propertyId,string name, address indexed owner,bool isAvaiable, string location, uint256 price);
    event PropertyPurchased(uint256 indexed propertyId, address indexed buyer);
    event BuildingCreated(uint256 indexed buildingId, string name,address indexed owner,bool isAvaiable, string location, uint256 price);
    event BuildingTransferred(uint256 indexed buildingId, address indexed previousOwner, address indexed newOwner);

    modifier onlyBuildingOwner(uint256 _plotId) {
        require(Plots[_plotId].owner == msg.sender, "You are not the owner of this building.");
        _;
    }
    constructor() {
        totalNOfPlots = 0;
    }

    function addProperty(uint256 _plotId,string memory name,address onwer,bool isAvailable,string memory _location, uint256 _price) public {
        Plots[totalNOfPlots] = Property({
            name:_name,
            owner: msg.sender,
            isAvailable: true,
            location: _location,
            price: _price
        });

        emit PropertyAdded(totalNOfPlots, _name,msg.sender,true, _location, _price);
        totalNOfPlots++;
    }

    function inquireProperty(uint256 _plotId) public view returns (string memory name,address onwer,bool isAvailable,string memory _location, uint256 _price) {
        require(_plotId < totalNOfPlots, "Invalid property ID");

        Property memory property = Plots[_plotId];
        owner = property.owner;
        isAvailable = property.isAvailable;
        location = property.location;
        price = property.price;
    }

    function purchaseProperty(uint256 _plotId) public payable {
        require(_plotId < totalNOfPlots, "Invalid property ID");
        Property storage property = Plots[_plotId];
        require(property.isAvailable, "Property is not available");
        require(msg.value >= property.price, "Insufficient funds");

        address previousOwner = property.owner;
        property.owner = msg.sender;
        property.isAvailable = false;

    
        (bool transferSuccess, ) = previousOwner.call{value: msg.value}("");
        require(transferSuccess, "Transfer failed");

        emit PropertyPurchased(_plotId, msg.sender);
    }      
    
            function createProperty(string memory name,address onwer,bool isAvailable,string memory _location, uint256 _price) external {
        totalNOfPlots++;
        Plots[totalNOfPlots] = Plots(_name,msg.sender,true, _location, _price);
        emit BuildingCreated(totalNOfPlots, _name,msg.sender,true, _location, _price);
    }

    function transferBuildingOwnership(uint256 _plotId,string memory name,address onwer,bool isAvailable,string memory _location, uint256 _price) external onlyBuildingOwner(_plotId) {
        require(_newOwner != address(0), "Invalid new owner address.");
        Plots[_plotId].owner = _newOwner;
        emit BuildingTransferred(_plotId, _name,msg.sender,true, _location, _price);
    }
}
