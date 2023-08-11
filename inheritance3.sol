// SPDX-License-Identifier:GPL-3.0
pragma solidity >=0.5.0 < 0.9.0;

contract studentrecord
{
    struct student{
        uint roll;
        string name;
        string father_name;
        uint class;
 }

}
contract batch is studentrecord {
    uint256[] public regNo;
        mapping(uint=>student)public data;

    function setter(uint _roll,string memory _name,string memory father_name,uint _class,uint _regNo)public 
    {
        data[_roll]= student(_roll,_name,father_name,_class);
        regNo.push(_roll);
    }
    
}
