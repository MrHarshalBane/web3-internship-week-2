// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title ConditionalsLoopsExercise
 * @dev Demonstrates control flow logic (if/else), for/while loops, and ternary operators.
 */
contract ConditionalsLoopsExercise {

    /**
     * @notice Evaluates score grade using if-else branch logic
     */
    function evaluateGrade(uint256 _score) public pure returns (string memory) {
        if (_score >= 90) {
            return "Grade A - Outstanding";
        } else if (_score >= 75) {
            return "Grade B - Good";
        } else if (_score >= 50) {
            return "Grade C - Pass";
        } else {
            return "Grade F - Fail";
        }
    }

    /**
     * @notice Ternary operator example
     */
    function isEven(uint256 _number) public pure returns (bool) {
        return (_number % 2 == 0) ? true : false;
    }

    /**
     * @notice Calculates sum of numbers from 1 to n using a bounded for loop
     * @dev Keep loop counts bounded to prevent block gas limit overflow!
     */
    function sumUpTo(uint256 _n) public pure returns (uint256) {
        require(_n <= 100, "Input too large: bounded to 100 for gas safety");
        uint256 total = 0;
        for (uint256 i = 1; i <= _n; i++) {
            total += i;
        }
        return total;
    }

    /**
     * @notice Counts digits of a number using a while loop
     */
    function countDigits(uint256 _number) public pure returns (uint256) {
        if (_number == 0) return 1;
        uint256 count = 0;
        uint256 temp = _number;
        while (temp > 0) {
            count++;
            temp /= 10;
        }
        return count;
    }
}
