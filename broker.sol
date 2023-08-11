pragma solidity ^0.8.0;

contract GulbergColony {
    address public owner;
    
    constructor() {
        owner = msg.sender;
    }
    
    struct Property {
        string location;
        uint256 price;
        address owner;
    }
    
    Property[] public properties;
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this action");
        _;
    }
    
    modifier propertyExists(uint256 _propertyId) {
        require(_propertyId < properties.length, "Property does not exist");
        _;
    }
    
    modifier propertyOwner(uint256 _propertyId) {
        require(properties[_propertyId].owner == msg.sender, "You are not the owner of this property");
        _;
    }
    
    function addProperty(string memory _location, uint256 _price) external onlyOwner {
        properties.push(Property(_location, _price, address(0)));
    }
    
    function assignProperty(uint256 _propertyId, address _newOwner) external onlyOwner propertyExists(_propertyId) {
        properties[_propertyId].owner = _newOwner;
    }
    
    function getProperty(uint256 _propertyId) external view propertyExists(_propertyId) returns (
        string memory location,
        uint256 price,
        address owner
    ) {
        Property storage property = properties[_propertyId];
        location = property.location;
        price = property.price;
        owner = property.owner;
    }
}

contract RealEstateAgent {
    address public agentOwner;
    
    constructor() {
        agentOwner = msg.sender;
    }
    
    modifier onlyAgentOwner() {
        require(msg.sender == agentOwner, "Only agent owner can perform this action");
        _;
    }
    
    function listProperty(GulbergColony _colony, uint256 _propertyId) external onlyAgentOwner {
        address agentAddress = address(this);
        (string memory location, uint256 price, address owner) = _colony.getProperty(_propertyId);
        require(owner == agentAddress, "Property is not owned by agent");
    }
    
    function buyProperty(GulbergColony _colony, uint256 _propertyId) external payable {
        (, uint256 price, ) = _colony.getProperty(_propertyId);
        require(msg.value >= price, "Insufficient funds to buy the property");
        payable(address(_colony)).transfer(msg.value);
        _colony.assignProperty(_propertyId, msg.sender);
    }
}

contract Broker is RealEstateAgent {
    address public brokerOwner;
    
    constructor() {
        brokerOwner = msg.sender;
    }
    
    modifier onlyBrokerOwner() {
        require(msg.sender == brokerOwner, "Only broker owner can perform this action");
        _;
    }
    
    function listPropertyWithFee(GulbergColony _colony, uint256 _propertyId, uint256 _fee) external onlyBrokerOwner {
        super.listProperty(_colony, _propertyId);
        require(_fee > 0, "Fee should be greater than 0");
        address brokerAddress = address(this);
        _colony.assignProperty(_propertyId, brokerAddress);
    }
}

contract Buyer {
    function purchaseProperty(GulbergColony _colony, uint256 _propertyId) external payable {
        (, uint256 price, ) = _colony.getProperty(_propertyId);
        require(msg.value >= price, "Insufficient funds to buy the property");
        payable(address(_colony)).transfer(msg.value);
        _colony.assignProperty(_propertyId, msg.sender);
    }
}
