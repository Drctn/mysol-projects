pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

contract Task01 {

    string public textVar = "Reply";
    //text variable - public means variable is available to external contracts

    int8 public varIntA = -48;

    /*
    uint stands for unsigned integer, meaning non negative integers
    different sizes are available
        uint8   ranges from 0 to 2 ** 8 - 1
        uint16  ranges from 0 to 2 ** 16 - 1
        ...
        uint256 ranges from 0 to 2 ** 256 - 1
        unint is an alias for unint256
    */

    int16 public varIntB = 26322;
    uint32 public varIntC = 4673236;
    uint64 public varIntD = 3248556999457;

    bool public option0 = false;
    //boolean variable which is either true or false

    address public owner = 0xf7aca059208402B13c836cdC13cb2b4cc40472a5;
    
    bytes1 i = 0x43;
    // stores a single byte
    
    enum trafficLight {Red, Amber, Green} 
    //enum is short for Enumerable and is used for defining a series of predefined values
      

}
