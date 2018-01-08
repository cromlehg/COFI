![COFI](logo.png "COFI")

* _Standart_        : ERC20
* _Name_            : CoinFI
* _Ticket_          : COFI
* _Decimals_        : 18
* _Emission_        : Single
* _Token events_    : 2
* _Fiat dependency_ : No
* _Tokens locked_   : Yes

## Social links
### Facebook -
### Twitter - 
### Reddit - 
### Telegram - 
### Medium - 
### Instagram - 

## Smart-contracts description

Contract mint bounty, advisors and founders tokens after each stage finished. 
Crowdsale contracts have special function to retrieve transferred in errors tokens.

### Contracts contains
1. _COFIToken_ 
2. _TGE_
3. _TimelineWallet_

### How to manage contract
To start working with contract you should follow next steps:
1. Compile it in Remix with enamble optimization flag and compiler 0.4.19
2. Deploy bytecode with MyEtherWallet. 

After crowdsale contract manager must call finishMinting. 

### How to purchase tokens
To purchase tokens user should sedn request to contract manager (to add to whitelist), and then send ETH (more than minimum 0.1 EHT) to corresponding crowdsale contract.
Recommended GAS: xxx xxx , GAS PRICE - 30 Gwei.

### Wallets with ERC20 support
1. MyEtherWallet - https://www.myetherwallet.com/
2. Parity 
3. Mist/Ethereum wallet

EXODUS not support ERC20, but have way to export key into MyEtherWallet - http://support.exodus.io/article/128-how-do-i-receive-unsupported-erc20-tokens

Purchaser must not use other wallets, coinmarkets or stocks. Can lose money.

## Main network configuration

### Tokens distribution
* _Summarty token_             : 300 000 000 COFI
* _Founders tokens_            : 30% - 90 000 000 COFI -  locked for two years with a 6 month cliff; that means tokens get slowly unlocked on a prorated basis every month starting 6 months after crowdsale until 2 years after end of crowdsale.
* _Foundation tokens_          : 20% - 60 000 000 COFI 
* _Tokens to sell_             : 50% - 150 000 000 COFI
* _Unsold tokens_              : Burned

### Addresses
* _Wallet for contribution_    :
* _Foundation wallet_           :
* _Contracts manager_          : 

#### Links
* _Token_ - 
* _TGE_ - 
* _TimelineWallet_ - 

#### Token General Event
* _Base price_                 : 1 ETH = 7500 COFI
* _Minimal insvested limit_    : 0.1 ETH
* _Hardcap_                    : 150 000 000 COFI

_Milestones_
1. (15 Jan 2018 00:00 - 22 Jan 2018 00:00) +20% tokens
2. (22 Jan 2018 00:00 - 28 Jan 2018 00:00) +15% tokens
3. (29 Jan 2018 00:00 - 4 Feb 2018 00:00) +10% tokens
4. (4 Feb 2018 00:00 - 4 Feb 2018 01:00 ) +5% tokens
5. (4 Feb 2018 01:00 - 22 Feb 2018 00:00) without bonus

## Ropsten network configuration (Test #1)

### Tokens distribution
* _Summarty token_             : 300 000 000 COFI
* _Founders tokens_            : 30% - 90 000 000 COFI -  locked for two years with a 6 month cliff; that means tokens get slowly unlocked on a prorated basis every month starting 6 months after crowdsale until 2 years after end of crowdsale.
* _Foundation tokens_          : 20% - 60 000 000 COFI 
* _Tokens to sell_             : 50% - 150 000 000 COFI
* _Unsold tokens_              : Burned

### Addresses
* _Wallet for contribution_    : 0xd89626E2c4218281Ad0Fc5F22AE52dC0FF39DDC4
* _Founders wallet_            : 0x796b57f96cb7661654981032a5f53047a560e3e0
* _Foundation wallet_          : 0xDa67155b22973bE05Bcd28c07107b2E17314A1e2
* _Contracts manager_          : 0xf62158b03Edbdb92a12c64E4D8873195AC71aF6A

#### Links
* _Token_ - https://ropsten.etherscan.io/address/0x30765e90aaa5630a1b2b84df1faf7fd71b4d6362
* _TGE_ - https://ropsten.etherscan.io/address/0xdd5e3e4209afe532e8a6ad202d861a8f017d134e
* _TimelineWallet_ - https://ropsten.etherscan.io/address/0x796b57f96cb7661654981032a5f53047a560e3e0

#### Token General Event
* _Base price_                 : 1 ETH = 7500 COFI
* _Minimal insvested limit_    : 0.1 ETH
* _Hardcap_                    : 150 000 000 COFI

_Milestones_
1. (15 Jan 2018 00:00 - 22 Jan 2018 00:00) +20% tokens
2. (22 Jan 2018 00:00 - 28 Jan 2018 00:00) +15% tokens
3. (29 Jan 2018 00:00 - 4 Feb 2018 00:00) +10% tokens
4. (4 Feb 2018 00:00 - 4 Feb 2018 01:00 ) +5% tokens
5. (4 Feb 2018 01:00 - 22 Feb 2018 00:00) without bonus

### Test audit (TGE)
#### Purchasers
* 0.1 Ether => 900 tokens, 20% bonus, gas = 69108
https://ropsten.etherscan.io/tx/0x7ff90c9d208b60bdd7d47576dafad6368cd95ada3d82e1d6bf3c3fc3fd5acc9c
* 0.1 Ether => 862,5 tokens, 15% bonus, gas = 55409
https://ropsten.etherscan.io/tx/0x5ab03be07d2dc6645817b07ab13411f6227247daafcf425ed8f5398839b3caa0
* 1 Ether => 149,998,237.5 tokens (all available) + 0.00001175 Ether back to purchaser, price = 150000000, 10% bonus, gas = 55390
https://ropsten.etherscan.io/tx/0xa388efca65a271062ae1e9b071c4b8bd5a346cc44762c740a8fcfcbdc74a551c
* Rejected purchase when 0 tokens are available for sail, gas = 27803
https://ropsten.etherscan.io/tx/0x7666d515d0fa4f24a6b83adc198088eb567b77935a652ea7251e7c52436728f5

#### Service operations
* addToWhiteList, gas = 43711
https://ropsten.etherscan.io/tx/0x399029a590a13b9d80246f546f91fd6e7349dc3db5c8142ddaf141430faa2d81
* changeMilestone(0, 1515420831, 1515424431, 20), gas = 39281
https://ropsten.etherscan.io/tx/0x6d7b38da56b96ec890c8e9d3710da5b7764fb623632787e78acd981e6451b460
* setWallet, gas = 44078
https://ropsten.etherscan.io/tx/0xf22351f785a6831ea4c76d28109fb36d36f6dd3ff5680584bf3a45e69bebd3b5
* changeMilestone(1, 1515421500, 1515421800, 15), gas = 39345
https://ropsten.etherscan.io/tx/0xa88c1014aaee5e6565e1450a35b48b48cbf5c332db868c862be061f08855e6f8
* setPrice, gas = 27514
https://ropsten.etherscan.io/tx/0xdd33f568db563d5903177711c67835ab27748277cfd82b03772bb791687c9d61
* changeMilestone(2, 1515421800, 1515422400, 10), gas = 39345
https://ropsten.etherscan.io/tx/0x8db4008f57dd026d6829a5272eec3128c862c4a3d644bc299f13b4884d8878c5
* setFoundationTokensWallet, gas = 43748
https://ropsten.etherscan.io/tx/0xab3f1bbe198bb7da4e8693ae3a05b2eab295005ab1b88ac67de207ad2d040c6a
* finish, gas = 156749
https://ropsten.etherscan.io/tx/0x7e8a20ec4fb6b20a74eadd7543835ac5602041f6d204fd2a3199ecb75b3abe5c

### Test audit (Token)
* Transfer 50 tokens, gas = 52856
https://ropsten.etherscan.io/tx/0xd36bf78e2d5260fdfc5f7c983d3639def945573e1af8fadabb81066cb31e4fed

## Ropsten network configuration (Test #2)

### Tokens distribution
* _Summarty token_             : 150 015 000 COFI - reduced for test purposes
* _Founders tokens_            : 90 000 000 COFI -  locked for two hours with a 30 minutes cliff
* _Foundation tokens_          : 60 000 000 COFI 
* _Tokens to sell_             : 15 000 COFI - reduced for test purposes
* _Unsold tokens_              : Burned

### Addresses
* _Wallet for contribution_    : 0xd89626E2c4218281Ad0Fc5F22AE52dC0FF39DDC4
* _Founders wallet_            : 0x796b57f96cb7661654981032a5f53047a560e3e0
* _Foundation wallet_          : 0xDa67155b22973bE05Bcd28c07107b2E17314A1e2
* _Contracts manager_          : 0xf62158b03Edbdb92a12c64E4D8873195AC71aF6A

#### Links
* _Token_ - https://ropsten.etherscan.io/address/0xec0d419c6debb7c50406f70c9b8f46723de3a764
* _TGE_ - https://ropsten.etherscan.io/address/0x5bfb67a57622ff9cb4d7ae35ab7d16d449650f32
* _TimelineWallet_ - https://ropsten.etherscan.io/address/0xf5ba3de4e7f84d302287039b3ef1914d7a377e45

#### Token General Event
* _Base price_                 : 1 ETH = 7500 COFI
* _Minimal insvested limit_    : 0.1 ETH
* _Hardcap_                    : 15 000 COFI

_Milestones_
1. (09 Jan 2018 00:00 - 09 Jan 2018 01:00) +20% tokens
2. (22 Jan 2018 00:00 - 28 Jan 2018 00:00) +15% tokens
3. (29 Jan 2018 00:00 - 4 Feb 2018 00:00) +10% tokens
4. (4 Feb 2018 00:00 - 4 Feb 2018 01:00 ) +5% tokens
5. (4 Feb 2018 01:00 - 22 Feb 2018 00:00) without bonus

### Test audit (TGE)
#### Purchasers
* 4 Ether => 15 000 tokens (all awailable) + 2.333333333333333334 Ether back to purchaser, 20% bonus, gas = 65234
https://ropsten.etherscan.io/tx/0x6158b00663f5ff5858832701b31f387151c15442f5f9c15b0e57f0c8f0ad8ce3
* 0.1 Ether => 0 tokens (0 tokens awailable for sail) + 0.1 Ether back to purchaser, gas = 58477

#### Service operations
* addToWhiteList, gas = 43711
https://ropsten.etherscan.io/tx/0xc8d6874417e87c5bd78a3051237fcb9b3b8cdb98b30c0fbe829d23f29a341e7d
* setWallet, gas = 44078
https://ropsten.etherscan.io/tx/0xdc71e30bf6aa853a2372fb1609e66b8bbae5c58fc841ec58b3a9fc0ef2368747
* setFoundationTokensWallet, gas = 43748
https://ropsten.etherscan.io/tx/0xa7c654c1c2217feeeabcb34101cacce1f81d24aa9b2a5b519dce1ac8a9b56345
* finish, gas = 171841
https://ropsten.etherscan.io/tx/0x727d6195b7c7e2a908887e126b8b37cb5b1cc6e10ccc8afc3d509a7713317ea1

### Test audit (FoundersTokensWallet)
Rejected retrieveTokens before first cliff, gas = 23850
https://ropsten.etherscan.io/tx/0x24d099a91e03d8989e69ec4b67eb55e6b0a0998e3a884acf18dcc2e8ea637a0a
retrieveTokens between first and second cliffs => 22 500 000 tokens to wallet, gas = 78098
https://ropsten.etherscan.io/tx/0x7fd68e8dc22b8b3d860722444320798f8b580a778b27b9c7ef54b52f4c878576
retrieveTokens between first and second cliffs => 0 tokens to wallet, gas = 26189
https://ropsten.etherscan.io/tx/0x76b8935b782ab0def917c575eb139c23b7efa3849e23c9c8541e86c3a898b5bc
retrieveTokens between second and third cliffs => 22 500 000 tokens to wallet, gas = 48098
https://ropsten.etherscan.io/tx/0x3a283d652bb936f25ee952ab8180344adbd27a72f92caea5275c547016dda4fd
retrieveTokens between second and third cliffs => 0 tokens to wallet, gas = 26189
https://ropsten.etherscan.io/tx/0xd896a14c62efe43301e79c1e37bff7965971bfbeba176337d800cf988de7e89b
