// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Mapping {
   
    // Define a struct for the user info
    struct UserInfo {
        string userName;
        uint256 userAge;
    }

    // Mapping from address to KYC data 
    mapping(address => UserInfo) public userMap;
    
    // Mapping from address to user balance
    mapping(address => uint256) public balMap;

    UserInfo[] public kycData;
         
    function setUserDetails(string calldata _name, uint256 _age) public {
        // Update user KYC data in the mapping
        userMap[msg.sender] = UserInfo(_name, _age);
  
        // Key value mapping
        kycData.push(UserInfo({userName: _name, userAge: _age}));
    }
    

    function getUserDetail() public view returns (UserInfo memory) {
        //View the user's KYC info
        return (userMap[msg.sender]);
    }

    
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
