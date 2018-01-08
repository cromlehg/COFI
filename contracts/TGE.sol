pragma solidity 0.4.18;


import './RetrieveTokenFeature.sol';
import './math/SafeMath.sol';
import './FoundersTokensWallet.sol';


contract TGE is RetrieveTokenFeature {

  using SafeMath for uint256;

  struct Milestone {
    uint start;
    uint end;
    uint bonus;
  }

  address public wallet;

  FoundersTokensWallet public foundersTokensWallet = new FoundersTokensWallet();

  address public foundationTokensWallet;

  uint public price = 7500;

  uint public minPurchaseLimit = 100000000000000000;

  Milestone[] public milestones;

  COFIToken public token;

  uint constant public PERCENT_RATE = 100;

  uint public tokensToSell = 150000000000000000000000000;

  uint public tokensToFounders = 90000000000000000000000000;

  uint public tokensToFoundation = 60000000000000000000000000;

  mapping (address => bool) whiteList;

  function TGE() public {
    addMilestone(1515974400,1516579200,20);
    addMilestone(1516579200,1517097600,15);
    addMilestone(1517184000,1517702400,10);
    addMilestone(1517702400,1517706000,5);
    addMilestone(1517706000,1519257600,0);
  }

  function setWallet(address newWallet) public onlyOwner {
    wallet = newWallet;
  }

  function setToken(address newToken) public onlyOwner {
    token = COFIToken(newToken);
    foundersTokensWallet.setToken(newToken);
  }

  function setFoundationTokensWallet(address newFoundationTokensWallet) public onlyOwner {
    foundationTokensWallet = newFoundationTokensWallet;
  }

  function setTokensToFounders(uint newTokensToFounders) public onlyOwner {
    tokensToFounders = newTokensToFounders;
  }

  function setTokensToFoundation(uint newTokensToFoundation) public onlyOwner {
    tokensToFoundation = newTokensToFoundation;
  }

  function setTokensToSell(uint newTokensToSell) public onlyOwner {
    tokensToSell = newTokensToSell;
  }

  function setPrice(uint newPrice) public onlyOwner {
    price = newPrice;
  }

  function addMilestone(uint start, uint end, uint bonus) public onlyOwner {
    milestones.push(Milestone(start, end, bonus));
  }

  function changeMilestone(uint i, uint start, uint end, uint bonus) public onlyOwner {
    require(i < milestones.length);
    milestones[i].start = start;
    milestones[i].end = end;
    milestones[i].bonus = bonus;
  }

  function getBonus() public view returns(uint) {
    for (uint i = 0; i < milestones.length; i++) {
      if (now >= milestones[i].start && now < milestones[i].end)
        return milestones[i].bonus;
    }
    revert();
  }

  function calculateTokens(uint amountInWei) public view returns(uint) {
    uint tokens = amountInWei.mul(price);
    uint bonus = getBonus();
    if (bonus > 0) {
      uint bonusTokens = tokens.mul(bonus).div(PERCENT_RATE);
      tokens = tokens.add(bonusTokens);
    }
    return tokens;
  }

  function directTransfer(address to, uint amountTokensInDouble) public onlyOwner returns(uint) {
    if (amountTokensInDouble > tokensToSell) {
      amountTokensInDouble = tokensToSell;
    }
    tokensToSell = tokensToSell.sub(amountTokensInDouble);
    token.transfer(to, amountTokensInDouble);
    return amountTokensInDouble;
  }

  function directTransferByETH(address to, uint amountInWei) public onlyOwner returns(uint) {
    uint calculatedTokens = calculateTokens(amountInWei);
    uint transferredTokens = directTransfer(to, calculatedTokens);
    if (transferredTokens < calculatedTokens) {
      uint bonus = getBonus();
      if (bonus > 0) {
        transferredTokens = transferredTokens.div(bonus.div(PERCENT_RATE).add(1));
      }
      amountInWei = transferredTokens.div(price);
    }
    return amountInWei;
  }

  function isContract(address _addr) private view returns (bool is_contract) {
    uint length;
    assembly {
      //retrieve the size of the code on target address, this needs assembly
      length := extcodesize(_addr)
    }
    return (length>0);
  }

  function addToWhiteList(address addr) public onlyOwner {
    whiteList[addr] = true;
  }

  function () public payable {
    require(whiteList[msg.sender] && msg.value >= minPurchaseLimit);
    uint actual = directTransferByETH(msg.sender, msg.value);
    wallet.transfer(actual);
    if (actual < msg.value) {
      // check msg.sender not code to prevent re-entrance attack
      require(!isContract(msg.sender));
      msg.sender.transfer(msg.value.sub(actual));
    }
  }

  function finish() public onlyOwner {
    token.transfer(foundersTokensWallet, tokensToFounders);
    token.transfer(foundationTokensWallet, tokensToFoundation);
    token.burn(token.balanceOf(this));
    token.unlock();
    foundersTokensWallet.start();
    foundersTokensWallet.transferOwnership(owner);
  }

}
