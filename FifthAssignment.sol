// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

    /// @author Malvin Chimombe
    /// @title Contract utilizing modifiers

contract EventsContract {

   /// custom error 
   error AmountTooSmall();
   
    event ProfileUpdated(address user);
    event FundsDeposited(address user, uint256 amount);


    /// Define a struct for the user info
    /// variable userName is string and the userAge is a positive integer

    struct UserInfo {
        string userName;
        uint256 userAge;
    }

    /// Fee is the fee applicable to every addFund transaction
    /// owner is the contract owner
   
    uint256 Fee = 150;
    address owner = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
    
    
    /// Mapping from address to KYC data 
    mapping(address => UserInfo) public userMap;
    
    /// Mapping from address to user balance
    mapping(address => uint256) public balMap;

    UserInfo[] public kycData;

    /// This function maps addresses to a user's info     
    function setUserDetails(string calldata _name, uint256 _age) public {
        /// Update user KYC data in the mapping
        userMap[msg.sender] = UserInfo(_name, _age);
        emit ProfileUpdated(msg.sender);
  
        /// @dev Key value mapping
        kycData.push(UserInfo({userName: _name, userAge: _age}));
    }
    
    /// This function returns user's info
    function getUserDetail() public view returns (UserInfo memory) {
        /// View the user's KYC info
        return (userMap[msg.sender]);
    }

    /// Modifier to check that the caller is the owner of the contract.
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    /// Modifier to require the user to use the Deposit function
    modifier depoMade() {
        require(balMap[msg.sender] != 0, "Deposit some money first");
        _;
    }

  /// Modifier to ensure the additional funds are more than the Fee
    modifier feeCovered(uint256 addAmount) {
        if (addAmount < Fee) {
            revert AmountTooSmall();
        }
        _;
    }



    /// Function for user to make an initial deposit 
    function deposit(uint256 amount) public returns (uint256) {
        /// Save deposit to user's account
        balMap[msg.sender] = amount;
        emit FundsDeposited(msg.sender, amount);
        return balMap[msg.sender];
    }

    /// Function to add funds to user's balance on condition that the user has made a deposit
    /// and the additional funds are more than the Fee
    /// @param addAmount the amount to be added to the balance

    function addFund(uint256 addAmount) external depoMade() feeCovered(addAmount)  returns (uint256) {
        /// Increase user's balance with additional funds
        balMap[msg.sender] = balMap[msg.sender] + addAmount;
        return balMap[msg.sender];
    }

    /// Function to check and return user's balance
    function checkBalance() public view returns (uint256) {
        /// View balance of whoever is calling the contract
        return balMap[msg.sender];
    }
    
    /// Function to withdraw all the funds in user's account - restricted to account owner
    function withdraw() public onlyOwner() returns (uint256) {
        balMap[msg.sender] = 0;
        return balMap[msg.sender];
    }



}