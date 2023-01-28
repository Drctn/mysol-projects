// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

    /// @author Malvin Chimombe
    /// @title Constructor example

contract A {
    // Declaring state variable
    address owner;
       

    // Creating a constructor
    // to set owner as person deploying contract
    constructor(uint256 _fee) {
	    owner = msg.sender;
        uint256 FEE = _fee;
    
	}

}

contract B is A {
    constructor() A(15000) {
        owner = msg.sender;
    }

}