// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title VariablesExercise
 * @dev Demonstrates Solidity variable types: State, Local, Global, Constant, and Immutable.
 */
contract VariablesExercise {
    // STATE VARIABLES (Stored permanently in blockchain storage)
    string public publicStateVar = "Skill Set Go Web3 Internship";
    uint256 private privateStateVar = 100;
    uint256 internal internalStateVar = 500;

    // CONSTANT & IMMUTABLE VARIABLES (Gas efficient, set at compile/deployment time)
    uint256 public constant MAX_LIMIT = 1000;
    address public immutable i_owner;

    constructor() {
        // Immutable variables can only be assigned during contract construction
        i_owner = msg.sender;
    }

    /**
     * @notice Demonstrates local and global variables
     * @return sum The result of adding state, local, and parameter values
     * @return sender The address of the caller (global variable msg.sender)
     * @return timestamp The current block timestamp (global variable block.timestamp)
     */
    function demonstrateVariables(uint256 _inputParam)
        public
        view
        returns (
            uint256 sum,
            address sender,
            uint256 timestamp
        )
    {
        // LOCAL VARIABLE (Stored temporarily in stack/memory during execution)
        uint256 localValue = 50;

        // Sum state variable, local variable, and input parameter
        sum = privateStateVar + localValue + _inputParam;

        // GLOBAL VARIABLES (Provide information about the blockchain environment)
        sender = msg.sender;
        timestamp = block.timestamp;
    }

    /**
     * @notice Returns the private state variable value
     */
    function getPrivateStateVar() public view returns (uint256) {
        return privateStateVar;
    }
}
