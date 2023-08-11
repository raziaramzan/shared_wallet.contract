// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

    contract TownLandSale {

        struct Property {
        uint256 id;
        string blockName;
        uint256 nOfPlots;
        string perMarlaPrice;
        uint256 sizeOfPlots;
        address onwer;
        bool isForSale;
        string location;
        }
    
    mapping (uint256=>Property)public Plots;

    uint256 public totalNoOfPlots;

       constructor() {
        totalNoOfPlots = 0;
    }

    event PropertyAdded(uint256 indexed Id, string  blockName,uint256 perMarlaPrice,
    uint256 sizeOfPlots,address indexed owner,bool isForSale, string location);
    event PropertyPurchased(uint256 indexed propertyId, address indexed buyer);

    
    function addProperty(uint _id,string memory _blockName,uint _nOfPlots,
    uint256 _perMarlaPrice,
    uint256 _sizeOfPlots,string memory _location) public {
        Plots[totalNoOfPlots] = Property({
            id:_id,
            blockName:_blockName,
            nOfPlots:_nOfPlots,
            perMarlaPrice: _perMarlaPrice,
            sizeOfPlots:_sizeOfPlots,
            owner: msg.sender,
            isForSale: true,
            location:_location           
        });
    }
        emit PropertyAdded(totalNoOfPlots, msg.sender, _location, _isForSale);
        totalNoOfPlots++;
    }

    
    