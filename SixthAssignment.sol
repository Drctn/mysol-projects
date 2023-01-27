// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

    /// @author Malvin Chimombe
    /// @title Payable Contract example

contract PayableContract {
    // Sender is contract owner
    
    address payable public owner;
 
    constructor() payable {
        owner = payable(msg.sender);
    }

    function deposit() payable public {}

    function checkBalance() external view returns (uint256) {
        // View balance of whoever is calling the contract
        return address(this).balance;
    }
}