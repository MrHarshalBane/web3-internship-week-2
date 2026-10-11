# Module 03: Functions, Events & Access Control (`SkillTokenControlled.sol`)

## Overview
This module enhances our ERC-20 token implementation by introducing production-grade smart contract design patterns:
1. **Access Control (`onlyOwner` modifier)**
2. **Emergency Circuit Breaker (`whenNotPaused` modifier)**
3. **Event Logging & Indexing (`emit` statements)**
4. **Administrative Minting & User Token Burning**

---

## 🔐 Security & Architecture Highlights

### 1. Custom Modifiers
- `onlyOwner`: Restricts sensitive administrative operations (such as `mint`, `pause`, `unpause`, and `transferOwnership`) exclusively to the contract deployer/owner.
- `whenNotPaused`: Blocks standard user token operations (`transfer`, `transferFrom`) during emergency security halts.
- `whenPaused`: Ensures unpause commands are executed only when the system is in a paused state.

### 2. Emitted Events & Off-Chain Indexing
Events allow dApps and block explorers (e.g. Etherscan) to index contract activities efficiently without querying full contract state:
- `OwnershipTransferred(address indexed previousOwner, address indexed newOwner)`
- `PausedStateChanged(bool isPaused, address indexed account)`
- `TokensMinted(address indexed to, uint256 amount)`
- `TokensBurned(address indexed from, uint256 amount)`

---

## 🧪 Positive & Negative Security Test Scenarios

The accompanying test suite [`tests/access-control-test-report.md`](file:///C:/Users/harsh/.gemini/antigravity/scratch/web3-internship-week-2/03-functions-events-access-control/tests/access-control-test-report.md) executes both:
- **Positive Test Cases:** Permitted operations executed by authorized roles.
- **Negative Test Cases:** Unauthorized attempts by non-owner addresses or operations executed during paused states, expecting precise revert error strings.
