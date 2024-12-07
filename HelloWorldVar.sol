//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract HelloWorldVar{
    
    bool boolVar_1 = true;
    bool boolVar_2 = false;

    // uint8 uint8Var = 256; //uint8的取值范围：[0,255]
    // uint8 uint8Var = -1;
    uint8 uint8Var = 255;

    // uint 等价于 uint256
    uint256 uint256Var = 25555555555;

    // int8 intVar = -129; //int8取值范围： [-128,127]
    // int8 int8Var = 128;
    int8 int8Var_1 = -128;
    int8 int8Var_2 = 127;
    // int 等价于 int256
    int256 int256Var_1 = 2777878787878;
    int256 int256Var_2 = -2777878787878;

    // 1 byte = 8bit;
    bytes8 bytes8Var = "Hello Wo";//不能超过 8 * 8 bit，一个字符占 8bit
    bytes32 bytes32Var = "hahaha Hello World";//不能超过 32 * 8 bit，一个字符占 8bit
    //bytes为数组变量


    //string动态分配bytes
    string stringVar = "Hello World..............................";

    //配置固定内存大小的变量有助于节约存储空间

    //address需要以0x开头,后面跟40个字符
    // address addrVar = 9b8be82F4cDF78510fbE5d7cbe9D92f511fcA443;
    // address addrVar = 0x1234567890123456789012345678901234567890;
    address addrVar = 0x9b8be82F4cDF78510fbE5d7cbe9D92f511fcA443;


}