// SPDX-License-Identifier:GPL-3.0
pragma solidity >=0.5.0 < 0.9.0; 
   
// Defining contract 
contract MappingTest {
      
    //Declare Employee structure
    struct Employee 
    {
        uint8 id;
        string subject;
        uint8 marks;
    }
      
    // Creating a mapping for address and employee
    mapping (address => Employee) employees;
    address[] public employeesArray;    
}

 function add(string memory key, string name) public view  returns (bool){   
        employees[key].name = name;            
        return true;
}