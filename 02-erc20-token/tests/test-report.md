# Module 02 Test Report: ERC-20 Token (`SkillToken.sol`)

**Test Date:** 2026-09-30  
**Environment:** Remix VM (Cancun) / Local EVM  
**Contract Tested:** `SkillToken.sol`  

---

## 🧪 Detailed Functional Test Cases

| Test ID | Test Scenario | Execution Steps | Expected Outcome | Observed Result | Status |
|---|---|---|---|---|---|
| **STK-01** | Deployment Initial Supply | Deploy with `initialSupply = 1000000` | Deployer balance = $1,000,000 \times 10^{18}$; `totalSupply` = $1,000,000 \times 10^{18}$ | Matched expected supply & balance | ✅ PASS |
| **STK-02** | Token Transfer | Call `transfer(AccountB, 500 * 10^18)` | AccountA balance decreases by 500; AccountB balance increases by 500; `Transfer` event emitted | Balances updated correctly | ✅ PASS |
| **STK-03** | Insufficient Balance Transfer | Call `transfer(AccountB, 2000000 * 10^18)` | Revert with `"ERC20: transfer amount exceeds balance"` | Transaction reverted | ✅ PASS |
| **STK-04** | Approve & Allowance | AccountA calls `approve(AccountB, 200 * 10^18)` | `allowance(AccountA, AccountB)` returns `200 * 10^18`; `Approval` event emitted | Allowance recorded | ✅ PASS |
| **STK-05** | Delegated Transfer (`transferFrom`) | AccountB calls `transferFrom(AccountA, AccountC, 150 * 10^18)` | AccountA balance -150, AccountC balance +150, Allowance reduced to 50 | All state variables updated as expected | ✅ PASS |
| **STK-06** | Exceed Allowance (`transferFrom`) | AccountB attempts `transferFrom(AccountA, AccountC, 100 * 10^18)` (exceeds remaining 50) | Revert with `"ERC20: transfer amount exceeds allowance"` | Transaction reverted | ✅ PASS |

---

## 📊 Summary
All 6 ERC-20 compliance and security boundary test cases passed successfully without exceptions.
