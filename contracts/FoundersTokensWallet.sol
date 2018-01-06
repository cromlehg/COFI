pragma solidity 0.4.18;


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
    require(now >= started + duration);
    if (now >= started + period) {
      token.transfer(to, token.balanceOf(this));
    } else {
      uint parts = period.div(duration);
      uint tokensByPart = startBalance.div(parts);
      uint timeSinceStart = now.sub(started);
      uint pastParts = timeSinceStart.div(duration);
      uint tokensToRetrieveSinceStart = pastParts.mul(tokensByPart);
      uint tokensToRetrieve = tokensToRetrieveSinceStart.sub(retrievedTokens);
      if(tokensToRetrieve > 0) {
        retrievedTokens = retrievedTokens.add(tokensToRetrieve);
        token.transfer(to, tokensToRetrieve);
      }
    }
  }

}
