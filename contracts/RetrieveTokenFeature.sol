pragma solidity ^0.4.19;


import './ownership/Ownable.sol';
import './token/ERC20.sol';


contract RetrieveTokenFeature is Ownable {

  function retrieveTokens(address to, address anotherToken) public onlyOwner {
    ERC20 alienToken = ERC20(anotherToken);
    alienToken.transfer(to, alienToken.balanceOf(this));
  }

}
