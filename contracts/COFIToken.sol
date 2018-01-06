pragma solidity 0.4.18;


import './token/StandardToken.sol';
import './token/BurnableToken.sol';
import './RetrieveTokenFeature.sol';
import './TGE.sol';


contract COFIToken is StandardToken, RetrieveTokenFeature, BurnableToken {

  string public symbol = 'COFI';

  string public name = 'COFI';

  uint8 public decimals = 18;

  bool public locked = true;

  address public saleAgent = new TGE();

  modifier notLocked() {
    require(msg.sender == saleAgent || !locked);
    _;
  }

  function COFIToken() public {
    totalSupply = 300000000000000000000000000;
    balances[saleAgent] = totalSupply;
    TGE(saleAgent).setToken(this);
    TGE(saleAgent).transferOwnership(owner);
  }

  function unlock() public {
    require(msg.sender == saleAgent || msg.sender == owner);
    locked = false;
  }

  function transfer(address _to, uint256 _value) public notLocked returns (bool) {
    super.transfer(_to, _value);
  }

  function transferFrom(address _from, address _to, uint256 _value) public notLocked returns (bool) {
    super.transferFrom(_from, _to, _value);
  }

}
