//SPDX-License-Identifier:GPL-3.0
pragma solidity ^0.8.0;

contract DoctorRecord {
    struct Patient {
        string name;
        uint256 age;
        string diagnosis;
        string prescription;
    }

    mapping(address => Patient) private patients;

    event PatientAdded(address indexed patientAddress, string name, uint256 age, string diagnosis, string prescription);
    event PatientUpdated(address indexed patientAddress, string name, uint256 age, string diagnosis, string prescription);

    function addPatient(string memory name, uint256 age, string memory diagnosis, string memory prescription) external {
        require(bytes(name).length > 0, "Name cannot be empty");
        require(age > 0, "Age must be greater than 0");
        require(bytes(diagnosis).length > 0, "Diagnosis cannot be empty");
        require(bytes(prescription).length > 0, "Prescription cannot be empty");

        Patient memory newPatient = Patient(name, age, diagnosis, prescription);
        patients[msg.sender] = newPatient;

        emit PatientAdded(msg.sender, name, age, diagnosis, prescription);
    }

    function updatePatient(string memory name, uint256 age, string memory diagnosis, string memory prescription) external {
        require(bytes(name).length > 0, "Name cannot be empty");
        require(age > 0, "Age must be greater than 0");
        require(bytes(diagnosis).length > 0, "Diagnosis cannot be empty");
        require(bytes(prescription).length > 0, "Prescription cannot be empty");

        require(bytes(patients[msg.sender].name).length > 0, "Patient not found");

        patients[msg.sender].name = name;
        patients[msg.sender].age = age;
        patients[msg.sender].diagnosis = diagnosis;
        patients[msg.sender].prescription = prescription;

        emit PatientUpdated(msg.sender, name, age, diagnosis, prescription);
    }

    function getPatient(address patientAddress) external view returns (string memory, uint256, string memory, string memory) {
        return (patients[patientAddress].name, patients[patientAddress].age, patients[patientAddress].diagnosis, patients[patientAddress].prescription);
    }
}
