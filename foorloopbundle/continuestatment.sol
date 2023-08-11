//SPDX-License-Identifier:GPL-30
pragma solidity >=0.5.0 < 0.9.0;


contract LoopWithContinue {
    function getEvenNumbers(uint256[] memory array) public pure returns (uint256[] memory) {
        uint256[] memory evenNumbers = new uint256[](array.length);
        uint256 count = 0;

        for (uint256 i = 0; i < array.length; i++) {
            if (array[i] % 2 != 0) {
                continue; // Skip odd numbers.
            }
            evenNumbers[count] = array[i];
            count++;
        }

        // Trim the result array to the actual number of even numbers found.
        uint256[] memory result = new uint256[](count);
        for (uint256 i = 0; i < count; i++) {
            result[i] = evenNumbers[i];
        }
        return result;
    }
}
