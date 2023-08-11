// SPDX-License-Identifier:GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;
contract structs{
    struct car{
        string model;
        uint year;
        address onwer;
    }
    Car public car;
    Car[]public cars;
    mapping (address=>car[])public carsbyonwer;
    function examples() external {
        car memory toyta=car("toyta",1998,msg.sender);
        car memory lambo=car({year: 1996, model: "lamborghini", onwer: msg.sender});

    }

    }
}
