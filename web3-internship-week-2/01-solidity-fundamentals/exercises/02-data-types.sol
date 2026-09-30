// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title DataTypesExercise
 * @dev Demonstrates Solidity value types, default values, and operations.
 */
contract DataTypesExercise {
    // VALUE TYPES
    bool public isActive = true;
    uint256 public positiveNumber = 42; // Unsigned integer (0 to 2^256 - 1)
    int256 public signedNumber = -100;   // Signed integer (-2^255 to 2^255 - 1)
    address public walletAddress = 0x1111111111111111111111111111111111111111;
    bytes32 public hashKey = "SkillSetGoWeb3"; // Fixed-size byte array

    // DEFAULT VALUES DEMONSTRATION (Uninitialized state variables get default values)
    bool public defaultBool;         // Default: false
    uint256 public defaultUint;     // Default: 0
    int256 public defaultInt;       // Default: 0
    address public defaultAddress;   // Default: 0x0000000000000000000000000000000000000000
    bytes32 public defaultBytes32;   // Default: 0x0000000000000000000000000000000000000000000000000000000000000000

    /**
     * @notice Toggle boolean state
     */
    function toggleActive() public returns (bool) {
        isActive = !isActive;
        return isActive;
    }

    /**
     * @notice Perform basic integer arithmetic
     * @param _a Unsigned int a
     * @param _b Unsigned int b
     * @return sum Addition result
     * @return product Multiplication result
     */
    function calculate(uint256 _a, uint256 _b)
        public
        pure
        returns (uint256 sum, uint256 product)
    {
        sum = _a + _b;
        product = _a * _b;
    }

    /**
     * @notice Converts string to bytes32 representation
     */
    function stringToBytes32(string memory _source) public pure returns (bytes32 result) {
        bytes memory tempEmptyStringTest = bytes(_source);
        if (tempEmptyStringTest.length == 0) {
            return 0x0;
        }
        assembly {
            result := mload(add(_source, 32))
        }
    }
}
