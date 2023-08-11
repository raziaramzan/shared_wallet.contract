// SPDX-License-Identifier:GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;
contract DoctorRecord {
    struct Patient {
        uint id;
        string name;
        uint256 age;
        string diagnosis;
        string prescription;
    }

    mapping(uint=>Patient)public  record;

    function setter(uint _id,string memory _name,uint _age,string memory _diagnosis,string memory _prescription)public 
    {
        record[_id]= Patient(_id,_name,_age,_diagnosis,_prescription);
    }
}