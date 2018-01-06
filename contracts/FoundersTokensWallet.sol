pragma solidity ^0.4.19;


import './ownership/Ownable.sol';
import './math/SafeMath.sol';
import './COFIToken.sol';


contract FoundersTokensWallet is Ownable {

  using SafeMath for uint256;

  COFIToken public token;

  uint public start;

  uint public period = 2 years;

  uint public duration = 24 weeks;

  uint public started;

  uint public retrievedTokens;

  uint public startBalance;

  function setToken(address newToken) public onlyOwner {
    token = COFIToken(newToken);
  }

  function start() public onlyOwner {
    started = now;
    retrievedTokens = 0;
    startBalance = token.balanceOf(this);
  }

  function retrieveTokens(address to) public onlyOwner {
    if (now > started + period) {
      token.transfer(to, token.balanceOf(this));
    } else {
      require(now > started + duration);
      uint timeSinceStart = now - started;
      uint fullTokens = startBalance.mul(timeSinceStart).div(period);
      uint tokensToRetreive = fullTokens - retrievedTokens;
      retrievedTokens = retrievedTokens.add(tokensToRetreive);
      token.transfer(to, tokensToRetreive);
    }
  }

}
