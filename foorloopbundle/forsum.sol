//SPDX-License-Identifier:GPL-30
pragma solidity >=0.5.0 < 0.9.0;

contract ForLoopExample {
   
    uint256 public totalSum;

    function calculateSum(uint256 n) public {
        
        totalSum = 0;

       
        for (uint256 i = 1; i <= n; i++) {
            
            totalSum += i;
        }
    }
}
