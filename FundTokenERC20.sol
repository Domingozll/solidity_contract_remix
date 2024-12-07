//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import { FundMe } from "./FundMe.sol";
// FundMe
// 1、让FundMe的参与者，基于 mapping 来领取相应数量的Token
// 2、让FundMe的参与者，transfer Token
// 3、在使用完以后，需要 burn Token
contract FundTokenREC20 is ERC20 {
    FundMe fundMe;
    constructor(address fundMeAddr) ERC20("FundTokenERC20","FT") {
        fundMe = FundMe(fundMeAddr);
    }

    function mint(uint256 amountTomint) public {
        require(fundMe.fundersToAmount(msg.sender) >= amountTomint,"You cannot mint this many token");
        require(fundMe.getFundSuccess(),"The fundMe is not completed yet"); 
        _mint(msg.sender,amountTomint);
        fundMe.setFunderToAmount(msg.sender, fundMe.fundersToAmount(msg.sender) - amountTomint);
    }

    function claim(uint256 amountToClaim) public {
        // complete claim
        require(balanceOf(msg.sender) >= amountToClaim,"You do not have enough ERC20 tokens");
        //合约成员变量被别的合约获取时需使用getter函数，getter函数由solidity自动创建
        require(fundMe.getFundSuccess(),"The fundMe is not completed yet"); 
        /* to add */
        //burn amountToClaim Tokens
        _burn(msg.sender, amountToClaim);
    }
}