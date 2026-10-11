# Module 01: Solidity Fundamentals

## Overview
This module introduces the core building blocks of Solidity programming (`pragma solidity ^0.8.20`). It consists of five standalone, educational exercise contracts designed to demonstrate fundamental syntax, state vs. memory storage, data structures, control flow, and function modifiers.

---

## 📂 Exercises Breakdown

### 1. [`01-variables.sol`](file:///C:/Users/harsh/.gemini/antigravity/scratch/web3-internship-week-2/01-solidity-fundamentals/exercises/01-variables.sol)
- **Concepts:** State variables, local variables, global variables (`msg.sender`, `block.timestamp`), variable visibilities (`public`, `private`, `internal`), `constant`, and `immutable`.
- **Key Takeaways:** 
  - State variables are permanently saved in contract storage (costs gas).
  - Local variables exist only within the scope of function execution (stored in stack/memory).
  - `constant` variables are set at compile time; `immutable` variables are assigned once in the constructor.

### 2. [`02-data-types.sol`](file:///C:/Users/harsh/.gemini/antigravity/scratch/web3-internship-week-2/01-solidity-fundamentals/exercises/02-data-types.sol)
- **Concepts:** Value types (`uint256`, `int256`, `bool`, `address`, `bytes32`), default values, and type conversions.
- **Key Takeaways:**
  - Uninitialized state variables receive default values (`0` for uint/int, `false` for bool, `0x000...` for address).
  - `address` vs `address payable` distinctions.

### 3. [`03-arrays-mappings-structs.sol`](file:///C:/Users/harsh/.gemini/antigravity/scratch/web3-internship-week-2/01-solidity-fundamentals/exercises/03-arrays-mappings-structs.sol)
- **Concepts:** Dynamic & fixed-size arrays, key-value `mapping`, custom `struct` definitions, array push/pop operations.
- **Key Takeaways:**
  - Mappings offer $O(1)$ lookup time but cannot be iterated directly.
  - Structs enable grouping of heterogeneous data types into a single custom type.

### 4. [`04-conditionals-loops.sol`](file:///C:/Users/harsh/.gemini/antigravity/scratch/web3-internship-week-2/01-solidity-fundamentals/exercises/04-conditionals-loops.sol)
- **Concepts:** `if / else if / else` branching, `for` loops, `while` loops, ternary operator `? :`, and gas consumption considerations.
- **Key Takeaways:**
  - Unbounded loops in Solidity are dangerous because they can exceed the block gas limit and brick function execution.

### 5. [`05-functions.sol`](file:///C:/Users/harsh/.gemini/antigravity/scratch/web3-internship-week-2/01-solidity-fundamentals/exercises/05-functions.sol)
- **Concepts:** Function visibility (`public`, `private`, `internal`, `external`), state mutability (`pure`, `view`, state-changing), named returns, multi-return values.
- **Key Takeaways:**
  - `view` functions read state variables without altering them.
  - `pure` functions neither read nor modify state variables.

---

## 🛠️ How to Compile & Run Tests
1. Load any file in Remix IDE.
2. Select compiler `0.8.20`.
3. Deploy to **Remix VM (Cancun)**.
4. Compare function call results with [`tests/test-report.md`](file:///C:/Users/harsh/.gemini/antigravity/scratch/web3-internship-week-2/01-solidity-fundamentals/tests/test-report.md).
