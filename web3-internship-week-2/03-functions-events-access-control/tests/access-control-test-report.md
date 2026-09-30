# Module 03 Security Test Report: Access Control & Events

**Test Date:** 2026-09-30  
**Environment:** Remix VM (Cancun) / Sepolia Testnet Simulator  
**Contract Tested:** `SkillTokenControlled.sol`  

---

## 🧪 Comprehensive Positive & Negative Test Cases

| Test Case ID | Test Category | Scenario Description | Caller / Inputs | Expected Result | Observed Result | Status |
|---|---|---|---|---|---|---|
| **AC-POS-01** | Positive | Owner mints new tokens | `Owner (0x5B38...)` / `to = 0xAb84...`, `amount = 500 * 10^18` | `TokensMinted` event emitted; recipient balance +500 | Balance updated; Event logged | ✅ PASS |
| **AC-NEG-01** | Negative | Non-owner attempts minting | `Attacker (0xAb84...)` / `to = 0xAb84...`, `amount = 1000 * 10^18` | Revert: `"AccessControl: caller is not the owner"` | Reverted with expected error string | ✅ PASS |
| **AC-POS-02** | Positive | Owner triggers pause contract | `Owner (0x5B38...)` | `paused = true`; `PausedStateChanged(true)` event emitted | Contract paused successfully | ✅ PASS |
| **AC-NEG-02** | Negative | Transfer during paused state | `User (0x5B38...)` / `transfer(0xAb84..., 10 * 10^18)` | Revert: `"Pausable: token transfers are paused"` | Reverted with expected error string | ✅ PASS |
| **AC-NEG-03** | Negative | Non-owner attempts unpause | `Attacker (0xAb84...)` | Revert: `"AccessControl: caller is not the owner"` | Reverted with expected error string | ✅ PASS |
| **AC-POS-03** | Positive | Owner unpauses contract | `Owner (0x5B38...)` | `paused = false`; Transfers resume working | Transfers succeeded | ✅ PASS |
| **AC-POS-04** | Positive | User burns own tokens | `User (0x5B38...)` / `burn(100 * 10^18)` | `TokensBurned` event emitted; Total supply & user balance reduced by 100 | Supply and balance reduced | ✅ PASS |
| **AC-NEG-04** | Negative | User burns more than balance | `User (0xAb84...)` / `burn(1000000 * 10^18)` | Revert: `"ERC20: transfer amount exceeds balance"` | Reverted with expected error string | ✅ PASS |
| **AC-POS-05** | Positive | Ownership transfer | `Owner` calls `transferOwnership(NewOwner)` | `owner` updated to `NewOwner`; `OwnershipTransferred` event emitted | Owner updated | ✅ PASS |
| **AC-NEG-05** | Negative | Previous owner calls mint after ownership transfer | `Previous Owner` calls `mint()` | Revert: `"AccessControl: caller is not the owner"` | Reverted with expected error string | ✅ PASS |

---

## 🔒 Security Conclusion
The contract successfully passed all 10 access control boundary tests. Permission checks cleanly isolate administrative authority to the owner wallet, while emergency pause mechanics securely halt unauthorized transfers.
