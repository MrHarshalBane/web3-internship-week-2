# Module 01 Test Report: Solidity Fundamentals

**Test Date:** 2026-09-30  
**Environment:** Remix VM (Cancun) / Local EVM Simulator  
**Solidity Version:** `0.8.20`  

---

## 🧪 Test Results Summary

| Contract / Test Case | Function Tested | Inputs | Expected Output | Observed Output | Status |
|---|---|---|---|---|---|
| **01-variables.sol** | `demonstrateVariables` | `_inputParam = 10` | `sum = 160`, `sender = Remix account`, `timestamp > 0` | `sum = 160`, `sender = 0x5B38...`, `timestamp = 17592...` | ✅ PASS |
| **01-variables.sol** | `MAX_LIMIT` | None | `1000` | `1000` | ✅ PASS |
| **02-data-types.sol** | `toggleActive` | None | `false` (toggles from true) | `false` | ✅ PASS |
| **02-data-types.sol** | `calculate` | `_a = 5, _b = 7` | `sum = 12, product = 35` | `sum = 12, product = 35` | ✅ PASS |
| **02-data-types.sol** | Default Values Check | Read `defaultUint`, `defaultBool` | `0`, `false` | `0`, `false` | ✅ PASS |
| **03-arrays-mappings-structs.sol** | `registerStudent` | `id=101, name="Alice", score=95` | Struct added to `students[0]` and `idToStudent[101]` | Matched struct data | ✅ PASS |
| **03-arrays-mappings-structs.sol** | `addSkill` & `hasSkill` | `_user = 0x5B38..., _skill = "Solidity"` | `hasSkill` returns `true` | `true` | ✅ PASS |
| **04-conditionals-loops.sol** | `evaluateGrade` | `_score = 85` | `"Grade B - Good"` | `"Grade B - Good"` | ✅ PASS |
| **04-conditionals-loops.sol** | `sumUpTo` | `_n = 10` | `55` | `55` | ✅ PASS |
| **04-conditionals-loops.sol** | `sumUpTo` (Gas Guard) | `_n = 101` | Revert: `"Input too large: bounded to 100 for gas safety"` | Revert string matched | ✅ PASS |
| **05-functions.sol** | `addPure` | `_a = 15, _b = 25` | `40` | `40` | ✅ PASS |
| **05-functions.sol** | `incrementCounter` | Call twice | Counter changes from 10 → 11 → 12 | Counter = 12 | ✅ PASS |

---

## 🔍 Key Findings & Observations
1. **Gas Bounds on Loops:** Enforcing `require(_n <= 100)` effectively protects smart contracts from out-of-gas errors when executing loop calculations.
2. **State vs View vs Pure:** Calling `addPure` and `getCounterPlus` incurred 0 gas in simulated read calls, while `incrementCounter` consumed transaction execution gas.
