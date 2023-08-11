// SPDX-License-Identifier:GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;

interface Iwallet {
   function getbalance()external view returns(uint);
   
}
//inherit and implement the Iwallet interface.....
contract wallet is Iwallet{
   uint balance=100;
   function getbalance()external view override  returns(uint){
      return balance;
   }
}