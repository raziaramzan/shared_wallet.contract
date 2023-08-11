//SPDX-License-Identifier:GPL-30
pragma solidity >=0.5.0 < 0.9.0;

contract ArraySum {
    function calculateSum(uint256[] memory array) public pure returns (uint256) {
        uint256 sum = 0;
        for (uint256 i = 0; i < array.length; i++) {
            sum += array[i];
        }
        return sum;
    }
}
