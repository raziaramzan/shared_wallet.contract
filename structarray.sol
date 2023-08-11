// SPDX-License-Identifier:GPL-3.0
pragma solidity >=0.5.0 < 0.9.0; 

contract demo{
    struct student{
        string name;
        uint roll;
        bool pass;
        address wallet;
    }
    student[5]public s;

    function insertstudent(uint index,string memory _name,uint _roll,bool _pass,address _wallet)public {
        s[index]=student(_name,_roll,_pass,_wallet);
    }
    function returnstudent(uint index)public view returns(student memory){
        return s[index];
    }
}