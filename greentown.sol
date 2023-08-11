// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

    contract TownLandSale {

        struct land {
        uint256 id;
        string blockName;
        uint256 nOfPlots;
        string perMarlaPrice;
        uint256 sizeOfPlots;
        address onwer;
        bool isForSale;
    }
    
    
    mapping (uint256=>land)public Plots;

  // Events for tracking building ownership transfers
    uint256 public totalNoOfPlots;
    event plotCreated(uint256 indexed landId, string blockName, uint256 totalNoOfPlots,
    uint256 _sizeOfPlots, address _newOnwer, bool _isForSale,address indexed owner);
    event plotTransferred(uint256 indexed landId, address indexed previousOwner, address indexed newOwner);

    // Modifier to check if the caller is the owner of a specific building

   modifier onlyplotOwner(uint256 _landId) {
        require(Plots[_landId].owner == msg.sender, "You are not the owner of this building.");
        _;
   }
     constructor() {
        totalNoOfPlots = 0;
    }
    // Function to create a new building in the town
    function insertplots(uint256 _id, string memory _blockName, uint256 _nOfPlots,
    string memory _perMarlaPrice, uint256 _sizeOfPlots, address, bool _isForSale) external {
        totalNoOfPlots++;
        Plots[totalNoOfPlots] = land(_id,_blockName,_nOfPlots,_perMarlaPrice,_sizeOfPlots,
        msg.sender,_isForSale);
        emit plotCreated(totalNoOfPlots, _blockName,_nOfPlots,_perMarlaPrice,_sizeOfPlots,
        msg.sender,_isForSale);

    }
        // Function to transfer ownership of a plot
        function transferPlotOwnership(uint _landId, uint256 _id, string memory _blockName, uint256 _nOfPlots,
        string memory _perMarlaPrice, uint256 _sizeOfPlots, bool _isForSale,address _newOnwe) external 
        onlyplotOwner(_landId) {
        require(_newOwner != address(0), "Invalid new owner address.");
        Plots[_landId].owner =_newOwner;
        emit plotTransferred(_landId,_blockName,_nOfPlots,_perMarlaPrice,_sizeOfPlots,
        msg.sender,_isForSale,_newOnwer);

    }}

    // SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PropertyInquiry {
    struct Property {
        address owner;
        string location;
        uint256 price;
        bool isAvailable;
    }

    mapping(uint256 => Property) public properties;
    uint256 public propertyCount;

    event PropertyAdded(uint256 indexed propertyId, string location, uint256 price, bool isAvailable);

    function addProperty(string memory location, uint256 price) public {
        propertyCount++;
        properties[propertyCount] = Property(msg.sender, location, price, true);
        emit PropertyAdded(propertyCount, location, price, true);
    }

    function getProperty(uint256 propertyId) public view returns (address owner, string memory location, uint256 price, bool isAvailable) {
        require(propertyId > 0 && propertyId <= propertyCount, "Invalid property ID");
        Property storage property = properties[propertyId];
        return (property.owner, property.location, property.price, property.isAvailable);
    }

    function updatePropertyAvailability(uint256 propertyId, bool availability) public {
        require(propertyId > 0 && propertyId <= propertyCount, "Invalid property ID");
        require(properties[propertyId].owner == msg.sender, "Only the owner can update availability");
        properties[propertyId].isAvailable = availability;
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PropertyInquiryAndSale {
    struct Property {
        address owner;
        bool isAvailable;
        string location;
        uint256 price;
    }

    mapping(uint256 => Property) public properties;
    uint256 public propertyCounter;

    event PropertyAdded(uint256 indexed propertyId, address indexed owner, string location, uint256 price);
    event PropertyPurchased(uint256 indexed propertyId, address indexed buyer);

    constructor() {
        propertyCounter = 0;
    }

    function addProperty(string memory _location, uint256 _price) public {
        properties[propertyCounter] = Property({
            owner: msg.sender,
            isAvailable: true,
            location: _location,
            price: _price
        });

        emit PropertyAdded(propertyCounter, msg.sender, _location, _price);
        propertyCounter++;
    }

    function inquireProperty(uint256 _propertyId) public view returns (address owner, bool isAvailable, string memory location, uint256 price) {
        require(_propertyId < propertyCounter, "Invalid property ID");

        Property memory property = properties[_propertyId];
        owner = property.owner;
        isAvailable = property.isAvailable;
        location = property.location;
        price = property.price;
    }

    function purchaseProperty(uint256 _propertyId) public payable {
        require(_propertyId < propertyCounter, "Invalid property ID");
        Property storage property = properties[_propertyId];
        require(property.isAvailable, "Property is not available");
        require(msg.value >= property.price, "Insufficient funds");

        address previousOwner = property.owner;
        property.owner = msg.sender;
        property.isAvailable = false;

        // Transfer the payment to the previous owner
        (bool transferSuccess, ) = previousOwner.call{value: msg.value}("");
        require(transferSuccess, "Transfer failed");

        emit PropertyPurchased(_propertyId, msg.sender);
    }
}





 // Function to create a new plot in the town
    function insertPlots(uint256 _id, string memory _blockName, uint256 _nOfPlots,
    string memory _perMarlaPrice, uint256 _sizeOfPlots, address, bool _isForSale) external {
        totalNoOfPlots++;
        Plots[totalNoOfPlots] = Property(_id,_blockName,_nOfPlots,_perMarlaPrice,_sizeOfPlots,
        msg.sender,_isForSale);
    }