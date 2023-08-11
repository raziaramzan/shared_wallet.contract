// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NestedLoop {
    function createMatrix(uint256 rows, uint256 cols) public pure returns (uint256[][] memory) {
        uint256[][] memory matrix = new uint256[][](rows);

        for (uint256 i = 0; i < rows; i++) {
            matrix[i] = new uint256[](cols);
            for (uint256 j = 0; j < cols; j++) {
                matrix[i][j] = i * cols + j;
            }
        }

        return matrix;
    }
}
