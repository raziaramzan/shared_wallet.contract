// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.6 <0.9.0;
// Parent contract
contract Parent {
    uint public parentData;

    constructor(uint _data) {
        parentData = _data;
    }

    function parentFunction() public pure returns (string memory) {
        return "This is a function from the parent contract.";
    }
}

// Child contract inheriting from Parent
contract Child is Parent {
    uint public childData;

    constructor(uint _parentData, uint _childData) Parent(_parentData) {
        childData = _childData;
    }

    function childFunction() public pure returns (string memory) {
        return "This is a function from the child contract.";
    }
}
