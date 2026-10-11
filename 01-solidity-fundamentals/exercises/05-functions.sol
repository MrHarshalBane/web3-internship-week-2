// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title FunctionsExercise
 * @dev Demonstrates function visibilities, state mutability (pure, view, state-changing),
 *      returns, and parameter passing.
 */
contract FunctionsExercise {
    uint256 public counter = 10;
    string public message = "Hello Web3";

    // 1. PURE FUNCTION (Neither reads nor modifies state)
    function addPure(uint256 _a, uint256 _b) public pure returns (uint256) {
        return _a + _b;
    }

    // 2. VIEW FUNCTION (Reads state, does NOT modify state)
    function getCounterPlus(uint256 _extra) public view returns (uint256) {
        return counter + _extra;
    }

    // 3. STATE-CHANGING FUNCTION (Modifies state, consumes gas)
    function incrementCounter() public returns (uint256) {
        counter += 1;
        return counter;
    }

    // 4. EXTERNAL FUNCTION (Can only be called from outside the contract)
    function externalGreet(string calldata _name) external pure returns (string memory) {
        return string(abi.encodePacked("Welcome to Web3, ", _name, "!"));
    }

    // 5. INTERNAL FUNCTION (Called by this contract or derived contracts)
    function internalMultiply(uint256 _a, uint256 _b) internal pure returns (uint256) {
        return _a * _b;
    }

    // 6. PRIVATE FUNCTION (Called only by this contract)
    function privateSubtract(uint256 _a, uint256 _b) private pure returns (uint256) {
        require(_a >= _b, "Underflow prevention");
        return _a - _b;
    }

    // 7. MULTIPLE RETURN VALUES & NAMED RETURNS
    function getDetails()
        public
        view
        returns (
            uint256 currentCounter,
            string memory currentMessage,
            bool isActive
        )
    {
        currentCounter = counter;
        currentMessage = message;
        isActive = true;
    }

    /**
     * @notice Helper to test internal logic wrapper
     */
    function calculateSquare(uint256 _val) public pure returns (uint256) {
        return internalMultiply(_val, _val);
    }
}
