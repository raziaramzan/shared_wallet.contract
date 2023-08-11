// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {
    uint256 public count;
    uint256 public initialValue;

    constructor(uint256 _initialValue) {
        count = _initialValue;
        initialValue = _initialValue;
    }

    // Function to increment the counter
    function increment() public {
        count += 1;
    }

    // Function to decrement the counter
    function decrement() public {
        count -= 1;
    }

    // Function to reset the counter to its initial value
    function reset() public {
        count = initialValue;
    }
}