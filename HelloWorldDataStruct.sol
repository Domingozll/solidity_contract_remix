//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
数据结构:
struct: 结构体
array: 数组
mapping: 映射
*/
contract HelloWorldDataStruct {
    
    string stringVar = "Hello World!";

    struct Info{
        string phrase;
        uint256 id;
        address addr;
    }

    Info[] infos;
   
    mapping (uint256 id => Info) infoMapping;

   function sayHelloToArray(uint256 _id) public view returns(string memory) {
        for(uint256 i = 0;i < infos.length;i++){
            if (infos[i].id == _id) {
                return addInfo(infos[i].phrase);
            }
        }

        return addInfo(stringVar);
   }

   function sayHelloToMapping(uint256 _id) public view returns(string memory) {
       if(infoMapping[_id].addr == address(0x0)) {
            return addInfo(stringVar);      
        }

        return addInfo(infoMapping[_id].phrase);
   }


    function saveHelloWorldToArray(string memory newString,uint256 _id) public {
        //msg为环境变量，msg.sender表示当前正在调用合约的账户地址
        Info memory info = Info(newString, _id, msg.sender); 
        infos.push(info);
    }

       function saveHelloWorldToMapping(string memory newString,uint256 _id) public {
        //msg为环境变量，msg.sender表示当前正在调用合约的账户地址
        Info memory info = Info(newString, _id, msg.sender); 
        infoMapping[_id] = info;
    }

    function addInfo(string memory helloWorldStr) internal pure returns (string memory) {
        return string.concat(helloWorldStr," from zhanglin.");
    }

}