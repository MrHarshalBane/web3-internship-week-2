# Web3 & Blockchain Internship — Week 2 Repository

**Skill Set Go EduTech Blockchain & Web3 Internship**  
**Student Name:** Harshal Uttam Bane  
**Solidity Compiler Version:** `0.8.20`  

[![Live Demo](https://img.shields.io/badge/Live_Hub-mrharshalbane.github.io%2Fweb3--internship--week--2-gold?style=for-the-badge&logo=github)](https://mrharshalbane.github.io/web3-internship-week-2/)
[![Solidity](https://img.shields.io/badge/Solidity-0.8.20-363636?style=for-the-badge&logo=solidity)](https://soliditylang.org/)
[![Ethereum](https://img.shields.io/badge/Network-Sepolia_Testnet-627EEA?style=for-the-badge&logo=ethereum)](https://sepolia.etherscan.io/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

> 🌐 **Interactive Web3 Hub:** Explore the live ERC-20 token simulator and interactive wallet sandbox directly in your browser:  
> 👉 **[https://mrharshalbane.github.io/web3-internship-week-2/](https://mrharshalbane.github.io/web3-internship-week-2/)**

---

## 📢 7-Day Organic Promotion & Developer Discovery Campaign

A zero-cost, community-first 7-day organic growth campaign to share and optimize discoverability for this Web3 smart contract repository:

| Phase | Timeline | Focus | Key Actions & Channels |
|---|---|---|---|
| **Day 1** | Kickoff | **SEO, Discoverability & Repo Curation** | Complete README overhaul, GitHub topics (`solidity`, `erc20`, `web3`, `smart-contracts`, `ethereum`), Open Graph social sharing cards, and JSON-LD schema on the live website. |
| **Days 2–4** | Outreach | **Targeted Web3 & Dev Community Sharing** | Share technical insights and live simulator walkthroughs on Reddit (r/ethdev, r/solidity), Developer DAO, Farcaster, Web3 Discord servers, and LinkedIn. |
| **Days 5–6** | Engagement | **Fostering Genuine Developer Engagement** | Gather feedback on access control safety, token mint/burn mechanics, reentrancy guards, and invite developers to test on Sepolia / browser sandbox. |
| **Day 7** | Retrospective | **Analytics Review & Reach Assessment** | Track GitHub Insights (Traffic, Clones, Stars, Referrers) and website interaction metrics to assess community reach and engagement. |

---

## 📌 Project Objective

This repository contains the complete execution deliverables for **Week 2** of the **Skill Set Go EduTech Blockchain & Web3 Internship**. The primary objective of Week 2 is to build a rock-solid foundation in **Solidity smart contract development**, covering fundamental syntax, data structures, state vs. local storage, custom ERC-20 token standards, event logging, and access control patterns, culminating in testnet/local deployment and systematic test reporting.

---

## 🗺️ Week 2 Task Mapping

| Task # | Handbook Requirement | Project Module / Folder Path | Status |
|---|---|---|---|
| **Task 1** | Solidity Fundamentals (Variables, Data Types, Data Structures, Control Flow, Functions) | [`01-solidity-fundamentals/`](file:///C:/Users/harsh/.gemini/antigravity/scratch/web3-internship-week-2/01-solidity-fundamentals) | ✅ Complete |
| **Task 2** | ERC-20 Token Implementation (`SkillToken.sol`) | [`02-erc20-token/`](file:///C:/Users/harsh/.gemini/antigravity/scratch/web3-internship-week-2/02-erc20-token) | ✅ Complete |
| **Task 3** | Functions, Events & Access Control (`SkillTokenControlled.sol`) | [`03-functions-events-access-control/`](file:///C:/Users/harsh/.gemini/antigravity/scratch/web3-internship-week-2/03-functions-events-access-control) | ✅ Complete |
| **Task 4** | Testnet / Local Blockchain Deployment & Functional Verification | [`04-testnet-deployment/`](file:///C:/Users/harsh/.gemini/antigravity/scratch/web3-internship-week-2/04-testnet-deployment) | 🔄 Ready for Deployment |
| **Task 5** | Checklist & Internship Reflection | [`evidence/`](file:///C:/Users/harsh/.gemini/antigravity/scratch/web3-internship-week-2/evidence) | ✅ Complete |

---

## 📁 Repository Structure & Folder Explanation

```text
web3-internship-week-2/
├── README.md                           # Root documentation & execution overview
├── .gitignore                          # Standard git ignore rules (securing secrets & artifacts)
├── 01-solidity-fundamentals/           # Core Solidity exercises & test reports
│   ├── README.md                       # Module 1 guide & concept breakdowns
│   ├── exercises/                      # 5 targeted Solidity contracts
│   │   ├── 01-variables.sol            # State vs Local variables, visibility, immutability
│   │   ├── 02-data-types.sol           # Value types, reference types, default values
│   │   ├── 03-arrays-mappings-structs.sol # Data structures, dynamic arrays, nested mappings
│   │   ├── 04-conditionals-loops.sol   # Control flow, bounds checks, gas optimizations
│   │   └── 05-functions.sol            # Pure/View/State-changing, returns, visibility
│   └── tests/
│       └── test-report.md              # Test execution log for Module 1
├── 02-erc20-token/                     # ERC-20 Token Implementation
│   ├── README.md                       # Module 2 guide & ERC-20 standards breakdown
│   ├── contracts/
│   │   └── SkillToken.sol              # Clean, custom ERC-20 standard implementation
│   └── tests/
│       └── test-report.md              # Test execution log for SkillToken
├── 03-functions-events-access-control/ # Access Control & Event Logging Module
│   ├── README.md                       # Module 3 guide (Events, Modifiers, Ownership)
│   ├── contracts/
│   │   └── SkillTokenControlled.sol    # Advanced token with Ownership, Mint, Burn & Pause
│   └── tests/
│       └── access-control-test-report.md # Positive & negative security test report
├── 04-testnet-deployment/              # Deployment guide & evidence storage
│   ├── README.md                       # Module 4 overview
│   ├── deployment.md                   # Step-by-step deployment procedure & metadata
│   ├── test-report.md                  # Comprehensive deployment verification report
│   └── evidence/                       # Visual evidence placeholders
│       ├── deployment.png              # Deployment console screenshot placeholder
│       ├── transaction.png             # Transaction confirmation placeholder
│       └── contract-explorer.png       # Block explorer verification placeholder
└── evidence/                           # Deliverables verification & Reflection
    ├── week-2-checklist.md             # Weekly execution task verification
    └── reflection.md                   # Learning outcomes & challenge analysis
```

---

## 🛠️ Technologies Used

- **Programming Language:** Solidity (`^0.8.20`)
- **Execution Environments:** Remix IDE / Hardhat / Foundry / Ganache
- **Target Blockchains:** Ethereum Sepolia Testnet / Local Hardhat Network / Ganache
- **Documentation:** Markdown (GitHub Flavored)
- **Version Control:** Git & GitHub

---

## ⚙️ Setup & Prerequisites

1. **Web Browser with Web3 Wallet:**
   - Install [MetaMask](https://metamask.io/) extension.
   - Configure MetaMask to display Test Networks (e.g., Sepolia).
2. **Remix IDE (Recommended for Beginners):**
   - Access [Remix Ethereum IDE](https://remix.ethereum.org).
3. **Node.js Environment (Optional for Hardhat/Foundry users):**
   - Node.js v18.0.0 or higher.

---

## 🔨 How to Compile

### Using Remix IDE:
1. Open [Remix IDE](https://remix.ethereum.org).
2. Upload or paste the desired `.sol` file from `01-solidity-fundamentals/exercises/`, `02-erc20-token/contracts/`, or `03-functions-events-access-control/contracts/`.
3. In the **Solidity Compiler** tab (left sidebar):
   - Select Compiler Version: `0.8.20`
   - EVM Version: `default` or `shanghai` / `cancun`
   - Enable Optimization (Optional): `200` runs
4. Click **Compile <ContractName>.sol**.

### Using Hardhat / Local CLI:
```bash
# If using hardhat in local project
npx hardhat compile
```

---

## 🧪 How to Test

1. Navigate to the **Deploy & Run Transactions** tab in Remix.
2. Select Environment: **Remix VM (Cancun)** or **Injected Provider - MetaMask**.
3. Select the target contract from the dropdown.
4. Deploy the contract and interact with the deployed contract functions in the Remix UI panel.
5. Refer to specific test reports for step-by-step test vectors:
   - [`01-solidity-fundamentals/tests/test-report.md`](file:///C:/Users/harsh/.gemini/antigravity/scratch/web3-internship-week-2/01-solidity-fundamentals/tests/test-report.md)
   - [`02-erc20-token/tests/test-report.md`](file:///C:/Users/harsh/.gemini/antigravity/scratch/web3-internship-week-2/02-erc20-token/tests/test-report.md)
   - [`03-functions-events-access-control/tests/access-control-test-report.md`](file:///C:/Users/harsh/.gemini/antigravity/scratch/web3-internship-week-2/03-functions-events-access-control/tests/access-control-test-report.md)

---

## 🚀 Deployment Instructions

Detailed deployment logs and execution records are located in [`04-testnet-deployment/deployment.md`](file:///C:/Users/harsh/.gemini/antigravity/scratch/web3-internship-week-2/04-testnet-deployment/deployment.md).

Quick Deployment Steps via Remix + Sepolia:
1. Ensure your MetaMask wallet has Sepolia ETH (obtainable via Sepolia Faucets).
2. Connect Remix to MetaMask via **Injected Provider - MetaMask**.
3. Compile `SkillTokenControlled.sol`.
4. Pass initial parameters (e.g., initial supply: `1000000000000000000000000` for 1,000,000 STKC).
5. Click **Deploy** and confirm the transaction in MetaMask.
6. Copy the deployed contract address and transaction hash, then record them in `04-testnet-deployment/deployment.md`.

---

## 📸 Evidence & Artifacts

All screenshot placeholders and completed task verification checklists are maintained in the [`evidence/`](file:///C:/Users/harsh/.gemini/antigravity/scratch/web3-internship-week-2/evidence) directory:
- Deployment Screenshot: `04-testnet-deployment/evidence/deployment.png`
- Transaction Hash Screenshot: `04-testnet-deployment/evidence/transaction.png`
- Contract Block Explorer Verification: `04-testnet-deployment/evidence/contract-explorer.png`
- Weekly Checklist: [`evidence/week-2-checklist.md`](file:///C:/Users/harsh/.gemini/antigravity/scratch/web3-internship-week-2/evidence/week-2-checklist.md)
- Reflection & Challenges: [`evidence/reflection.md`](file:///C:/Users/harsh/.gemini/antigravity/scratch/web3-internship-week-2/evidence/reflection.md)

---

## ⚠️ Limitations

- **Simulated / Testnet Deployment Only:** Contracts are deployed on test networks (Sepolia / Local VM) and are intended solely for educational purposes.
- **Gas Optimization Scope:** Focus was placed on readability, transparency, and explicit security modifiers rather than aggressive low-level Yul/Assembly gas hacks.
- **Single-Owner Pattern:** The access control utilizes a single-owner pattern (`onlyOwner`), which should be upgraded to Multi-Sig (e.g., Safe) or Timelock for production deployments.

---

## 🎓 What I Learned

- Mastered state variables, visibility modifiers (`public`, `private`, `internal`, `external`), and memory allocation (`memory`, `calldata`, `storage`).
- Implemented ERC-20 token standard logic from scratch to understand balances, transfer mechanisms, and allowances.
- Designed access-controlled smart contracts with custom modifiers, emergency pause safety, and event logging.
- Learned the workflow of deploying, verifying, and testing smart contracts on Ethereum testnets.

---

## 🔮 Next Improvements

1. Upgrade access control to OpenZeppelin `AccessControl` for multi-role permissions (e.g., `MINTER_ROLE`, `PAUSER_ROLE`).
2. Implement automated testing suites using Hardhat + Chai / Foundry (Forge).
3. Integrate OpenZeppelin ERC20Permit (EIP-2612) for gasless token approvals.
4. Add proxy contracts (UUPS / Transparent) for smart contract upgradeability.
