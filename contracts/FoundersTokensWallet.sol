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

  uint public startBalance;

  function setToken(address newToken) public onlyOwner {
    token = COFIToken(newToken);
  }

  function start() public onlyOwner {
    started = now;
    startBalance = token.balanceOf(this);
  }

  function retrieveTokens(address to) public onlyOwner {
    if (now > started + period) {
      token.transfer(to, token.balanceOf(this));
    } else {
      uint cliffTokens = startBalance.div(period.div(duration));
      uint tokensToRetreive = now.sub(started).div(duration).mul(cliffTokens);
      token.transfer(to, tokensToRetreive);
    }
  }

}
