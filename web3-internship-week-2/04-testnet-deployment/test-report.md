# Module 04 Verification & Deployment Test Report

**Environment:** Sepolia Testnet / Local Blockchain  
**Contract:** `SkillTokenControlled.sol`  

---

## 🧪 Post-Deployment Verification Matrix

| Test ID | Functional Test | Expected Result | Observed Result | Final Status |
|---|---|---|---|---|
| **DEP-01** | Contract Code Deployment | Contract deploys with valid address & transaction hash | `[TODO — deploy and record actual value]` | 🔄 PENDING DEPLOYMENT |
| **DEP-02** | Owner Balance Check | Owner balance equals `1,000,000 * 10^18 STKC` | `[TODO — deploy and record actual value]` | 🔄 PENDING DEPLOYMENT |
| **DEP-03** | Token Transfer | `transfer()` moves 100 STKC from Owner to Recipient | `[TODO — deploy and record actual value]` | 🔄 PENDING DEPLOYMENT |
| **DEP-04** | Owner Minting | `mint()` creates 500 STKC for Recipient | `[TODO — deploy and record actual value]` | 🔄 PENDING DEPLOYMENT |
| **DEP-05** | Unauthorized Minting | Non-owner `mint()` reverts with `"AccessControl: caller is not the owner"` | `[TODO — deploy and record actual value]` | 🔄 PENDING DEPLOYMENT |
| **DEP-06** | Emergency Pause | `pause()` stops transfers; subsequent `transfer()` reverts | `[TODO — deploy and record actual value]` | 🔄 PENDING DEPLOYMENT |
| **DEP-07** | Resume Unpause | `unpause()` enables transfers again | `[TODO — deploy and record actual value]` | 🔄 PENDING DEPLOYMENT |

---

## 📝 Verification Note
Upon completing the live deployment on Sepolia or local Ganache network, execute the test scenarios above and replace `[TODO — deploy and record actual value]` with observed execution outputs and transaction hashes.
