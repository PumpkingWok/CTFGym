# List of CTF in Ethereum world

I'd like to maintain a list of ctf related to solidity smart contracts. (both testnet and mainnet)
You have to install Metamask plug-in in your browser.

## CTF in Ropsten

- [Capture the Ether](https://capturetheether.com/)
- [OpenZeppelin Ethernaut](https://ethernaut.zeppelin.solutions/)
- [ChainShot](https://www.chainshot.com/)
- [Security Innovation Blockchain CTF](https://blockchain-ctf.securityinnovation.com)
- CTF developed by Reddit user u/wadeAlexC (Deployed from Jun-23-2018 to Sep-16-2018)
  - Original contracts
    - [PART1 - FunctionTypes](https://ropsten.etherscan.io/address/0x727c1c8d4b190d208f3701f106f7301cb1a32f27#code)
    - [PART2 - SafeExecution](https://ropsten.etherscan.io/address/0x023916f968af3fbb21ac10abbe18448c79d609c2#code)
    - [PART3 - HoneyPot](https://ropsten.etherscan.io/address/0xdc65b61be773f8be72ded22ac008ad5add045e3c#code)
    - [PART4 - FinePrint](https://ropsten.etherscan.io/address/0x1b359afb0bd86a6c435d178b1fbf8a6fda3ead7d#code)
- CTF developed by Reddit user u/eththrowaway4 (Deployed on Jul-02-2018)
  - Original contract
    - [0x0dAabcE0a1261B582e0d949EbCA9DFf4c22C88ef](https://ropsten.etherscan.io/address/0x0daabce0a1261b582e0d949ebca9dff4c22c88ef#code)

## CTF in Mainnet

- CTF developed by [pvienhage](https://github.com/pvienhage) (Deployed on Nov-29-2018)
  - Original contracts
    - [0x7cd03C9f1D2dc95358B1992e9afc857aeaab45D5](https://etherscan.io/address/0x7cd03C9f1D2dc95358B1992e9afc857aeaab45D5) (0.25 ether, GONE) [Source Code](https://github.com/PumpkingWok/CTFGym/blob/master/contracts/ctf-mainnet/Access_original.sol)
    - [0x8bd25c23d1d01e3216f3410146153f14775dbb6f](https://etherscan.io/address/0x8bd25c23d1d01e3216f3410146153f14775dbb6f) (0.5 ether,  GONE)
    - [0xf278b6fcbc091640082475d36db19da5123da79e](https://etherscan.io/address/0xf278b6fcbc091640082475d36db19da5123da79e) (1 ether, GONE)
  - [Walkthrough by author](https://medium.com/authio/ctf-duplication-dd32cd4ef690)
- CTF developed by p4d (Deployed on Dec-07-2018)
  - Original contract
    - [0x661a64DcC2f04117D0F8A919E2aC66aF8d401d6](https://etherscan.io/address/0x661a64DcC2f04117D0F8A919E2aC66aF8d401d6F) (1 ether, GONE)
    - [Source Code](https://github.com/PumpkingWok/CTFGym/blob/master/contracts/ctf-mainnet/Cryptohunt_original.sol) (Bot stole the prize)
    - [Safe Version](https://github.com/PumpkingWok/CTFGym/blob/master/contracts/ctf-mainnet/Cryptohunt_safe.sol) (Use of OneTimeToken)
- CTF developed by ConsenSys Diligence (Deployed on Feb-26-2019) (The first of a series)
  - [Announcement](https://medium.com/consensys-diligence/consensys-diligence-ether-giveaway-1-4985627b7726)
  - Original contract
    - [0x68Cb858247ef5c4A0D0Cde9d6F68Dce93e49c02A](https://etherscan.io/address/0x68Cb858247ef5c4A0D0Cde9d6F68Dce93e49c02A) (GONE, resolved by @samczsun)
    - [Solution writeup](https://samczsun.com/consensys-ctf-writeup/) written by samczsun (200 DAI bounty reward)
    

# CTF-BOT Resistant

I developed a simple utility contract, OneTimeToken (OTT), for mitigate the issue regard CTF and every contracts where a malicious user or bot could listen on blockchain and wait to find useful info, for instante to discover the input parameters needed to call functions for winning a CTF and create the same transaction with higher gas fees.

The contract [OneTimeToken.sol](https://github.com/PumpkingWok/CTFGym/blob/master/OneTimeToken.sol) is similar to [Ownable.sol](https://github.com/OpenZeppelin/openzeppelin-solidity/blob/master/contracts/ownership/Ownable.sol) developed by OpenZeppelin, but it includes the way to request a token access for a fixed time (15 minutes by default), it also can be changed by contract owner. In this way only the owner of token access can do some sensitive function calls until the token access expired and someone else request it.

## Implementation
```
pragma solidity ^0.5.0;
import 'https://github.com/PumpkingWok/CTFGym/contracts/OneTimeToken.sol';
contract CTF is OneTimeToken {
  function resolveCTF(solution) onlyTokenOwner {
  }
}
```
Every ctf creator, for instance, could use it in easy way only including ´onlyTokenOwner´ in sensitive functions.

The user that find the solution to the challenge, can call `resolveCTF(solution)` in safe mode having token access (`requestTokenOwner()` in OTT).
# Resources

- [Solidity Official Documentation](https://solidity.readthedocs.io/en/v0.4.25/)
- [CryptoZombies smart contracts courses](https://cryptozombies.io/en/course/)
- [Program the Blockchain](https://programtheblockchain.com/)
- [Mythril Classic: Security analysis tool for Ethereum smart contracts](https://mythril.ai/)
- [Consensys Smart Contract Security Best Practices](https://consensys.github.io/smart-contract-best-practices/)

# Contribute

You feel free to collaborate in any way, it would be much appreciated.
