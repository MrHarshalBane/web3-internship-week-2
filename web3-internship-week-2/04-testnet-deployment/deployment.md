# Deployment Record & Technical Documentation

## 🌐 Target Environment Specification

- **Target Network:** Sepolia Ethereum Testnet / Local Ganache EVM
- **Network Chain ID:** `11155111` (Sepolia) / `1337` (Ganache)
- **Solidity Compiler Version:** `0.8.20`
- **EVM Version:** `shanghai`
- **Compiler Optimization:** Enabled (`200` runs)
- **Deployment Tool / IDE:** Remix IDE (Injected Provider - MetaMask) / Hardhat

---

## 📜 Deployment Metadata Record

> [!NOTE]  
> The values below are configured as placeholders until live contract deployment is performed on testnet/local node.

| Parameter | Recorded Value / Value Status |
|---|---|
| **Contract Name** | `SkillTokenControlled.sol` |
| **Deployer Address** | `[TODO — deploy and record actual value]` |
| **Contract Deployed Address** | `[TODO — deploy and record actual value]` |
| **Deployment Transaction Hash** | `[TODO — deploy and record actual value]` |
| **Block Number** | `[TODO — deploy and record actual value]` |
| **Gas Used** | `[TODO — deploy and record actual value]` |
| **Block Explorer URL** | `[TODO — deploy and record actual value]` |

---

## 🛠️ Step-by-Step Deployment Guide

### Prerequisites
1. Ensure your MetaMask wallet is connected to **Sepolia Test Network**.
2. Acquire Sepolia ETH from a public faucet (e.g. Sepolia PoW Faucet or Alchemy Sepolia Faucet).

### Execution Steps
1. Open [Remix Ethereum IDE](https://remix.ethereum.org).
2. Load `SkillToken.sol` and `SkillTokenControlled.sol`.
3. In **Solidity Compiler**:
   - Compiler: `0.8.20`
   - Click **Compile SkillTokenControlled.sol**.
4. In **Deploy & Run Transactions**:
   - Environment: Select **Injected Provider - MetaMask**.
   - Account: Confirm deployer wallet address matches MetaMask.
   - Contract: Select `SkillTokenControlled`.
   - Constructor Argument `initialSupply`: Enter `1000000` (represents 1,000,000 tokens).
5. Click **Deploy**.
6. Approve the transaction popup in MetaMask.
7. Once confirmed on block explorer, copy the **Contract Address** and **Tx Hash** into the table above.
8. Save screenshots of the terminal output, transaction receipt, and Sepolia Etherscan page into `04-testnet-deployment/evidence/`.

---

## 📸 Evidence Files Checklist
- `04-testnet-deployment/evidence/deployment.png`
- `04-testnet-deployment/evidence/transaction.png`
- `04-testnet-deployment/evidence/contract-explorer.png`
