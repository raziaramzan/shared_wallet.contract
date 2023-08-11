//SPDX-License-Identifier:GPL-30
pragma solidity >=0.5.0 < 0.9.0;


contract SimpleLoop {
    function printNumbers(uint256 no) public pure returns (uint256[] memory) {
        uint256[] memory numbers = new uint256[](no);
        for (uint256 i = 0; i < no; i++) {
            numbers[i] = i + 1;
        }
        return numbers;
    }
}
