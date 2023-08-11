// SPDX-License-Identifier: MIT

pragma solidity>=0.5.0 < 0.9.0;

struct student
{
    uint rollno;
    string name;
    uint age;
    string class;
}

contract studentrecord
{
    student public s1;

    constructor(uint _rollno, string memory _name, uint _age, string memory _class)
    {
    s1.rollno =_rollno;
    s1.name =_name;
    s1.age =_age;
    s1.class =_class;
    }


function change(uint _rollno, string memory _name, uint _age, string memory _class)public 
{
    student memory new_student=student({

    rollno:_rollno,
    name:_name,
    age:_age,
    class:_class
    });

    s1=new_student;
}
}


