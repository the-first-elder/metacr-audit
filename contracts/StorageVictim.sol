
// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;


contract StorageVictim {

// no visibility
   address immutable owner;
   
   struct Storage {
   
       address user;
       uint amount;
   }

// no visibility
   mapping(address => Storage) storages;

   constructor(){
       owner = msg.sender;
   }

   function store(uint _amount) public {
   
       // uninitialised pointer. str.user points to the storage address 0 which is "owner"
    //    too many lines could have saved some gas..
       Storage storage str = storages[msg.sender];
       
       str.user = msg.sender;
       
    //    overides amount and should sum 
       str.amount = _amount; 

       storages[msg.sender] = str;

   }
   function getStore() public view returns (address, uint) {
       
       Storage storage str = storages[msg.sender];
       
       return (str.user, str.amount);
   }
   
   function getOwner() public view returns (address) {
       
       return owner;
   }
}
