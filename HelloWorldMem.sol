//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract HelloWorldMem {
    
    string stringVar = "Hello World!";

    /*
    6种存储模式
    1、storage  永久性存储（合约成员变量）
    2、memory   暂时性存储，运行时可以被修改（函数入参及返回变量）
    3、calldata 暂时性存储，运行时不能被修改（函数入参及返回变量）
    仅复杂类型需要声明memory或calldata，基础数据类型不需要声明
    
    4、stack
    5、codes
    6、logs
    */

    function sayHello() public view returns(string memory) {
        return addInfo(stringVar);
    }

    function setHelloWorld(string memory newString) public {
        stringVar = newString;
    }

    function addInfo(string memory helloWorldStr) internal pure returns (string memory) {
        return string.concat(helloWorldStr," from zhanglin.");
    }

}