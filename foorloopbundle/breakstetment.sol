//SPDX-License-Identifier:GPL-30
pragma solidity >=0.5.0 < 0.9.0;

contract LoopWithBreak {
    function findValueInArray(uint256[] memory array, uint256 target) public pure returns (bool) {
        for (uint256 i = 0; i < array.length; i++) {
            if (array[i] == target) {
                return true; 
            }
        }
        return false;
    }
}
