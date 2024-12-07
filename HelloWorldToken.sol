//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMeToken {
    // 1、Token的名字
    // 2、Token的简称
    // 3、Token的发行数量
    // 4、owner地址
    // 5、balance address => uint256 记录每个地址又多少个Token
    string public tokenName;
    string public tokenSymbol;
    uint256 public totalSupply;
    address public owner;
    mapping(address => uint256) public balances;

    constructor( string memory _tokenName, string memory _tokenSymbol) {
        tokenName = _tokenName;
        tokenSymbol = _tokenSymbol;
        owner = msg.sender;
    }

    // mint：获取 Token
    function mint(uint256 amountToMint) public {
        balances[msg.sender] += amountToMint;
        totalSupply += amountToMint;
    }

    // transfer: transfer Token
    function transfer(address payee,uint256 amount) public {
        require(balances[msg.sender] >= amount,"You do not have enough balance to transfer");
        balances[msg.sender] -= amount;
        balances[payee] += amount;
    }

    // balance: 查看某一个地址的Token数量 
    function balabceOf(address addr) public view returns(uint256) {
        return balances[addr];
    }

}