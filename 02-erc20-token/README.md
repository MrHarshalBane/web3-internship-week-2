# Module 02: ERC-20 Token Implementation (`SkillToken.sol`)

## Overview
This module demonstrates the step-by-step implementation of an **ERC-20 standard fungible token** from first principles, following Ethereum Improvement Proposal 20 (EIP-20). The contract [`SkillToken.sol`](file:///C:/Users/harsh/.gemini/antigravity/scratch/web3-internship-week-2/02-erc20-token/contracts/SkillToken.sol) provides a clean, fully commented implementation suitable for learning core Web3 state management, balances, and delegation patterns.

---

## 🪙 Token Specifications

- **Token Name:** `Skill Token`
- **Token Symbol:** `STK`
- **Decimals:** `18` (standard ETH decimal precision)
- **Initial Supply:** `1,000,000 STK` ($1,000,000 \times 10^{18}$ base units)
- **Standard:** ERC-20 (EIP-20 compatible)

---

## 🔑 Key Concepts & Architecture

### 1. State Tracking
- **Balances:** `mapping(address => uint256) private _balances` records token balances for every address.
- **Allowances:** `mapping(address => mapping(address => uint256)) private _allowances` tracks third-party spending permissions (`owner => spender => amount`).

### 2. Core Functions
- `totalSupply()`: Returns the total token count minted into existence.
- `balanceOf(address)`: Queries the balance of a specific wallet address.
- `transfer(address recipient, uint256 amount)`: Moves tokens directly from `msg.sender` to `recipient`.
- `approve(address spender, uint256 amount)`: Authorizes `spender` to withdraw up to `amount` from `msg.sender`.
- `transferFrom(address sender, address recipient, uint256 amount)`: Enables approved spenders to transfer tokens on behalf of `sender`.

### 3. Safety Controls
- **Zero Address Validation:** Prevents burning or minting tokens to `address(0)`.
- **Overflow / Underflow Protection:** Solidity 0.8+ native overflow checks protect balances during arithmetic.

---

## 🧪 Testing & Execution

Full functional test records can be inspected at [`tests/test-report.md`](file:///C:/Users/harsh/.gemini/antigravity/scratch/web3-internship-week-2/02-erc20-token/tests/test-report.md).
