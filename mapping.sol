// SPDX-License-Identifier:GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;
contract demo
{
    struct student{
        uint id;
        string name;
        string father_name;
        uint class;
 }
    mapping(uint=>student)public data;

    function setter(uint _roll,string memory _name,string memory father_name,uint _class)public 
    {
        data[_roll]= student(_roll,_name,father_name,_class);
    }
}