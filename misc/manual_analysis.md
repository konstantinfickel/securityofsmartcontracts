# Results of manual analysis
This file contains the ordering created by the manual analysis of the findings of Amphicyon.

15 distinct honeypot contracts
7 known before, 7 not known, but with known techniques, 1 not known before with previously unknown technique

77 flagged
73 honeypots
4 false positives
5.2% false positive rate

2,Crowdsale,false positive
1,EarlyTokenSale,falsePositive
1,USDTUBE,falsePositive

## False Positives
Crowdsale:
https://etherscan.io/address/0x32353f618727f1272258b45a2aac1bf2335faa2a
https://etherscan.io/address/0x47df3eb32d6f829d371d3b8c2bdfa4d84a0ae16c

* understandableLength
* canSendEther
* silentlyFailingFunction
* initializationPhase

EarlyTokenSale: Could be used as honeypot
https://etherscan.io/address/0x5779e3be792dd42f24ae1958a3416fc508f227c8 (4.5)

* understandableLength
* preventableTransfers
* canSendEther
* silentlyFailingFunction

USDTUBE: HorribleCode
https://etherscan.io/address/0xc5431cb71f527fc74ea487717e93b4606ee6df26

* uppercaseName
* understandableLength
* canSendEther
* silentlyFailingFunction

## Internal Transactions
Quiz-Honeypot (known before)
https://etherscan.io/address/0x59434a7b9aeebe94045d3715aa020f6a1d7875ad
https://etherscan.io/address/0xbd53a4db4003c59070abbfa4e6c31afbf0b26843
https://etherscan.io/address/0x4a73d9fe078fa67601047f88c3e6c270602e5709
https://etherscan.io/address/0x735906d7ab237eeea06f4af86795bb4e0ec199e0
https://etherscan.io/address/0xfac1c7270bc5b0664e27e7f2e82281d564aedf4e
https://etherscan.io/address/0xe1ccb3a5bae6fecdb9b60c0acf94989f48c10742
https://etherscan.io/address/0x2b98b39d39914b3aad05dd06a46868507156400d
https://etherscan.io/address/0x0e8f2803fa16492b948bc470c69e99460942db2b
https://etherscan.io/address/0x4aec37ae465e1d78649aff117bab737c5fb4f214
https://etherscan.io/address/0x2ad6bdedf16b32a925ba293ee07f9b3c1c5ab266
https://etherscan.io/address/0x878e6c6f9a86a1e5d313e7b872ccd109135e91b4
https://etherscan.io/address/0x4ca675d62a05c451555c93e456f902bd3e423586
https://etherscan.io/address/0xa0f9e5283fbf6d735e1e3a0f724ea6cccc13c27a
https://etherscan.io/address/0x4bc53ead2ae82e0c723ee8e3d7bacfb1fafea1ce
https://etherscan.io/address/0xce6b1aff0fe66da643d7a9a64d4747293628d667
https://etherscan.io/address/0x70bf9df6967dc96156e76cc43b928a7ef02e159a
https://etherscan.io/address/0xcea86636608bacb632dfd1606a0dc1728b625387
https://etherscan.io/address/0x1237b26652eebf1cb8f59e07e07101c0df4f60f6
https://etherscan.io/address/0xc7e454770433c071dd1863eeb27fb7e1adbd3361
https://etherscan.io/address/0xc77081641129a028d622f85671ea172ac5595938
https://etherscan.io/address/0xc1574ab95106621686d6e480f378d79c0442fe33
https://etherscan.io/address/0x40ef62929748b3e045fd2036322880ef486e4454
https://etherscan.io/address/0x4c4757b23526ba13876f8ef3efe973618266e3e8
https://etherscan.io/address/0x159d2829613b0fe363e462b218c695c6eae0a5e1
https://etherscan.io/address/0x36d5d7262784130de564e99f5c2eab2aa0484bce
https://etherscan.io/address/0x52682a037a8deab04e708055c751556a0840897a
https://etherscan.io/address/0x1fbf025ad94dde79f88732f79966a9a435f2772f
https://etherscan.io/address/0x3668eba58190c7bb2d63cb484467ff0a42fb3367
https://etherscan.io/address/0x85044611b5954739dbde0ccb9aae6bb18e38e38b
https://etherscan.io/address/0x0684a256b8a6434cf10ee81bc1bcdcbba3365daa
https://etherscan.io/address/0xc78f0fdfb708689cbe6629175b66958eaa89e7d0
https://etherscan.io/address/0x2e0794073ec7b08e40d80a41599bb31df042e4e5

Modified LogFile (known before)
https://etherscan.io/address/0xaae1f51cf3339f18b6d3f3bdc75a5facd744b0b8
https://etherscan.io/address/0xefbfc3f373c9cc5c0375403177d71bcc387d3597
https://etherscan.io/address/0x4e73b32ed6c35f570686b89848e5f39f20ecc106
https://etherscan.io/address/0x561eac93c92360949ab1f1403323e6db345cbf31
https://etherscan.io/address/0xd518db222f37f9109db8e86e2789186c7e340f12
https://etherscan.io/address/0x01f8c4e3fa3edeb29e514cba738d87ce8c091d3f
https://etherscan.io/address/0x4320e6f8c05b27ab4707cd1f6d5ce6f3e4b3a5a1

DivX (not known before)
https://etherscan.io/address/0xaa3a6f5bddd02a08c8651f7e285e2bec33ea5e53

Evil Gift Box (known before)
https://etherscan.io/address/0xef75f477126d05519d965d116fc9606e60fc70a8
https://etherscan.io/address/0xc304349d7cc07407b7844d54218d29d1a449b854
https://etherscan.io/address/0xcb71b51d9159a49050d56516737b4b497e98bb99
https://etherscan.io/address/0x7fefc8bf6e44784ed016d08557e209169095f0f3
https://etherscan.io/address/0xc5ce9c06a0caf0e4cbd90572b6550feafd69b740
https://etherscan.io/address/0x8d056569b215c8b56e4b3a615dac425d8d2352a4
https://etherscan.io/address/0xd0981f1e922be67f2d0bb4f0c86f98f039dd24cc
https://etherscan.io/address/0x26ae986bfab33f4cbadec30ea55b5eed9e883ecf
https://etherscan.io/address/0x2e4eb4585cb949e53212e796cef13d562c24374b

PiggyBank (not known before)
https://etherscan.io/address/0x68af0f18c974a9603ec863fefcebb4ceb2589070

Evil Roulette (not known before)
https://etherscan.io/address/0x3c3f481950fa627bb9f39a04bccdc88f4130795b

Evil Bet (not known before)
https://etherscan.io/address/0x11f4306f9812b80e75c1411c1cf296b04917b2f0

Evil Roulette R (known before)
https://etherscan.io/address/0x611ae0be21a9c0ab284a4a68c8c44843330072a7
https://etherscan.io/address/0x57684f9059afbf7bb11b07263500292ac9d78e7b
https://etherscan.io/address/0xd87eaad7afb256c69526a490f402a658f12246fd
https://etherscan.io/address/0x197803b104641fbf6e206a425d9dc35dadc4f62f

## Race Honeypot

GIFT_CARD (not known before)
https://etherscan.io/address/0x99bab102c0a03438bcfd70119f07ee646db26ddf
https://etherscan.io/address/0x5e58c1e8ffe57a86098e66ee6a1764e41ebf2c4d
https://etherscan.io/address/0x403f614ea176bdd865ab0377831f487987179cea
https://etherscan.io/address/0x6ce3fef99a6a4a8d1cc55d980966459854b3b021
https://etherscan.io/address/0x90302710ae7423ca1ee64907ba82b7f6854a5ddc

## Underhanded Solidity

### Skip Empty String-Literal
Shark (Previously unknown)
https://etherscan.io/address/0xf4ac238121585456dee1096fed287f4d8906d519

### Uncalled Call
X2_FLASH (Known before)
https://etherscan.io/address/0x2f30ff3428d62748a1d993f2cc6c9b55df40b4d7

### Storage Null-Pointer
Evil Roulette (Previously unknown)
https://etherscan.io/address/0xfb6e71e0800bccc0db8a9cf326fe3213ca1a0ea0

### Shadowed Variables
Evil Proxy: (Previously known)
https://etherscan.io/address/0x33f82dfbaafb07c16e06f9f81187f78efa9d438c

Capsule: (Previously known)
https://etherscan.io/address/0x5c8546a7b86ba30202c09a84f5a72644a2a4f7ba
https://etherscan.io/address/0x9168fdc9f9db7b71865fe4bfd6f78b3610ebc704
https://etherscan.io/address/0x340844b39aacbdb4e7718fa14a95758f87a09a9a

StakeholderBattle: (Previously known)
https://etherscan.io/address/0x7704442e1005b9ab403463ed85e2fb24761a8738
https://etherscan.io/address/0x33685492a20234101b553d2a429ae8a6bf202e18
https://etherscan.io/address/0x50ddfe3722fc303cace413df41db23d55025e2e6
https://etherscan.io/address/0xc0c7d89e4968775931e53e9510ebad43644b0866
https://etherscan.io/address/0x11f3081cd6b2ac5a263e65e206f806bea7fa9c56

## Analysis of latched honeypots
https://etherscan.io/address/0x36d5d7262784130de564e99f5c2eab2aa0484bce (1.01)
https://etherscan.io/address/0xcea86636608bacb632dfd1606a0dc1728b625387 (1.05)
https://etherscan.io/address/0xc0c7d89e4968775931e53e9510ebad43644b0866 (0.21)
https://etherscan.io/address/0x70bf9df6967dc96156e76cc43b928a7ef02e159a (1.01)
https://etherscan.io/address/0x878e6c6f9a86a1e5d313e7b872ccd109135e91b4 (1.000000000001)
https://etherscan.io/address/0x4aec37ae465e1d78649aff117bab737c5fb4f214 (1.000000001)
https://etherscan.io/address/0xe1ccb3a5bae6fecdb9b60c0acf94989f48c10742 (1.1)
https://etherscan.io/address/0xfac1c7270bc5b0664e27e7f2e82281d564aedf4e (1.0001)
https://etherscan.io/address/0x735906d7ab237eeea06f4af86795bb4e0ec199e0 (1.1)
https://etherscan.io/address/0x4a73d9fe078fa67601047f88c3e6c270602e5709 (1.000000000000001)
https://etherscan.io/address/0xbd53a4db4003c59070abbfa4e6c31afbf0b26843 (0.5001)
https://etherscan.io/address/0x5e58c1e8ffe57a86098e66ee6a1764e41ebf2c4d (0.10000000001)
https://etherscan.io/address/0x99bab102c0a03438bcfd70119f07ee646db26ddf (0.20001111)

+ emptied by reentrancy
https://etherscan.io/address/0xaae1f51cf3339f18b6d3f3bdc75a5facd744b0b8 (1)

```
> 1.01+1.05+0.21+1.01+1.000000000001+1.000000001+1.1+1.0001+1.1+1.000000000000001+0.5001+1+0.10000000001+0.20001111
[1] 10.9802
```
