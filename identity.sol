// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract identtity
{
    string name;
    uint age; 

    constructor()  
    {
        name="AliRaza";
        age=20;
    }
    function getName() view public returns(string memory)
    {
        return name;
    }
    
        function getAge() view public returns(uint)
        {
            return age;
        }
    }

