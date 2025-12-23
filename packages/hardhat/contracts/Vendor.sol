pragma solidity 0.8.20; //Do not change the solidity version as it negatively impacts submission grading
// SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/access/Ownable.sol";
import "./YourToken.sol";

contract Vendor is Ownable {
    event BuyTokens(address buyer, uint256 amountOfETH, uint256 amountOfTokens);

    YourToken public yourToken;

    constructor(address tokenAddress) Ownable(msg.sender) {
        yourToken = YourToken(tokenAddress);
    } 

    uint256 public constant tokensPerEth = 100;
    // ToDo: create a payable buyTokens() function:
    function buyTokens() public payable {
        // To find the amount of tokens to dispersed by the amount of ETH the user has deposited:
        //   (100 / .01) = 10, therefore, 10 tokens is amountOfTokens 
        uint256 amountOfTokens = (tokensPerEth * msg.value) / 1 ether;
         
        // 1. purchase tokens (10 tokens = 0.1 ETH, 100 tokens = 1 ETH)
        // yourToken(address, uint256) 
        yourToken.transfer(msg.sender, amountOfTokens);

        // 2. emit event
        emit BuyTokens(msg.sender, msg.value, amountOfTokens);
    }

    // ToDo: create a withdraw() function that lets the owner withdraw ETH

    // ToDo: create a sellTokens(uint256 _amount) function:
}
