// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GullburgColony{
    

struct Plot{
	    string blockName;
        uint nOfPlots;
        uint64 perMarlaPrice;
        uint sizeOfPlots;
        address onwer;
        bool isForSale;
} 
    mapping (uint => Plot) public plots;
    uint[] public plotIds;

    event PlotSold(uint plotId);
    function ListPlotForsale(uint _plotId,string memory _blockName,uint _nOfPlots,
    uint64 _perMarlaPrice,uint _sizeOfPlots,address _onwer,bool _isForSale)public {
    Plot memory newPlot=Plot({

        blockName:_blockName,
        nOfPlots:_nOfPlots,
        perMarlaPrice:_perMarlaPrice,
        sizeOfPlots:_sizeOfPlots,
        onwer:msg.sender,
        isForSale:true

    });
    plots [_plotId] = newPlot;
    plotIds.push(_plotId);
    }
    function buyPlot(uint _plotId)public payable  {
        Plot storage plot = plots[_plotId];
    
        require(plot.isForSale,"Property is not for sale");
        require(plot.perMarlaPrice <= msg.sender, "insufficiant blance");

        plot.onwer = msg.sender;
        plot.isForSale = false;

        payable (plot.onwer).transfer(plot.perMarlaPrice);

        emit PlotSold(_plotId);
    }
    }