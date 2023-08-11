// SPDX-License-Identifier:GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;

contract nestedmap{

    mapping(uint=>mapping(uint=>bool))public record;
    function addrecord(uint row,uint column,bool value)public {
        record[row][column]=value;
    }

    function returnrecord(uint row,uint column)public view returns(bool){
        return record[row][column];
    }


} 