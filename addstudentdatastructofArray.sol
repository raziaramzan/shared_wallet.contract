// SPDX-License-Identifier:GPL-3.0

pragma solidity >=0.5.0 < 0.9.0; 
 contract school{
    student[] public stuData;
    struct student{
         string firstName;
         string lastName;
         uint age;
     }
     function addStu(string memory _firstName,string memory _lastName,uint _age)public {
         stuData.push(student(_firstName,_lastName,_age));
     }}