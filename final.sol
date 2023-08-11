// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PropertyMarket {
    address public owner;
    uint256 public plotCount;
    
    struct Plot {
        address owner;
        uint256 price;
        bool isForSale;
    }
    
    mapping(uint256 => Plot) public plots;
    
    event PlotPurchased(address indexed buyer, uint256 plotId);
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }
    
    constructor() {
        owner = msg.sender;
        plotCount = 0;
    }
    
    function createPlot(uint256 _price) external onlyOwner {
        plots[plotCount] = Plot({
            owner: address(0),
            price: _price,
            isForSale: true
        });
        plotCount++;
    }
    
    function purchasePlot(uint256 _plotId) external payable {
        Plot storage plot = plots[_plotId];
        require(plot.isForSale, "Plot is not for sale");
        require(msg.value >= plot.price, "Insufficient funds");
        
        address previousOwner = plot.owner;
        plot.owner = msg.sender;
        plot.isForSale = false;
        
        if (previousOwner != address(0)) {
            payable(previousOwner).transfer(plot.price);
        }
        
        emit PlotPurchased(msg.sender, _plotId);
    }
    
    function setPlotForSale(uint256 _plotId, uint256 _price) external {
        Plot storage plot = plots[_plotId];
        require(msg.sender == plot.owner, "Only the owner can set the plot for sale");
        plot.price = _price;
        plot.isForSale = true;
    }
    
    function withdrawFunds() external onlyOwner {
        payable(owner).transfer(address(this).balance);
    }
}
