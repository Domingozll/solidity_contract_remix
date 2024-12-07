//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract HelloWorldFn {
    
    string stringVar = "Hello World!";


    //访问标识符可见性
    //internal: 合约内、子合约 
    //external: 外部合约、外部账户
    //private: 合约内
    //public: 合约内、合约外、子合约、外部账户

    //标识 view: 表示该函数内的变量只可读取，不可修改变量值
    //标识 pure: 表示该函数只做纯运算，不修改变量值
    //没有view或pure表示，表示该函数可读可写可计算
    //returns: 指定返回值类型和存储状态（memory表示string的存储状态）
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