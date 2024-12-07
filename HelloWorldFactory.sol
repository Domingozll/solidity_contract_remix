//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

//引入同级目录下HelloWorldFn.sol中的所有contract（一个sol文件可能有多个合约）
import  "./HelloWorldFn.sol";

//引入同级目录下HelloWorldFn.sol中的HelloWorldFn合约
import { HelloWorldFn } from "./HelloWorldFn.sol";

//从网络地址引入contract
// import { HelloWorld } from "https://github.com/smartcontractkit/Web3_tutorial_Chinese/blob/main/lesson-2/HelloWorld.sol";

//从依赖包中引入
// import { ContractName } from "@companyName/product/ontract";

contract HelloWorldFactory {
    
    HelloWorldFn hwFn;

    HelloWorldFn[] hwFns; 


    function createHelloWorld() public {
        hwFn = new HelloWorldFn();
        hwFns.push(hwFn);
    }

    function getHelloWorld( uint256 _index ) public view returns( HelloWorldFn ) {
        return hwFns[_index];
    }

    function callSayHellloFromFactory(uint256 _index) public view returns(string memory) {
        return hwFns[_index].sayHello();
    }

}