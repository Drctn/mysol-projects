// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract Mapping {
    // Mapping from address to uint256
    mapping(address => uint256) public balMap;

    function deposit(uint256 amount) public returns (uint256) {
        // Save deposit to user's account
        balMap[msg.sender] = amount;
        return balMap[msg.sender];
    }

    function checkBalance() public view returns (uint256) {
        // View balance of whoever is calling the contract
        return balMap[msg.sender];
    }
}