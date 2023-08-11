/* // SPDX-License-Identifier:GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;

contract addN0WithArray{
    uint public No;
    uint[] public numbers;

    function addNo(uint _No)public {
    numbers.push(_No);
    }
    function lengthOfArray()public view returns (uint){
        return numbers.length;
    }
    function remove(uint index)public {
        delete numbers[index];
    }
}*/
 