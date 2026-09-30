// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title ArraysMappingsStructsExercise
 * @dev Demonstrates dynamic/fixed arrays, mappings, structs, and nested data structures.
 */
contract ArraysMappingsStructsExercise {
    // STRUCT DEFINITION
    struct Student {
        uint256 id;
        string name;
        uint256 score;
        bool isEnrolled;
    }

    // ARRAYS
    uint256[] public dynamicNumbers;
    uint256[3] public fixedNumbers = [10, 20, 30];
    Student[] public students;

    // MAPPINGS
    mapping(address => uint256) public userBalances;
    mapping(uint256 => Student) public idToStudent;
    mapping(address => mapping(string => bool)) public userSkills;

    // EVENTS
    event StudentAdded(uint256 indexed id, string name, uint256 score);

    /**
     * @notice Add a number to dynamic array
     */
    function addNumber(uint256 _number) public {
        dynamicNumbers.push(_number);
    }

    /**
     * @notice Get all numbers in dynamic array
     */
    function getDynamicNumbers() public view returns (uint256[] memory) {
        return dynamicNumbers;
    }

    /**
     * @notice Add a new student struct to array & mapping
     */
    function registerStudent(uint256 _id, string memory _name, uint256 _score) public {
        Student memory newStudent = Student({
            id: _id,
            name: _name,
            score: _score,
            isEnrolled: true
        });

        students.push(newStudent);
        idToStudent[_id] = newStudent;

        emit StudentAdded(_id, _name, _score);
    }

    /**
     * @notice Update user balance in mapping
     */
    function setBalance(address _user, uint256 _amount) public {
        userBalances[_user] = _amount;
    }

    /**
     * @notice Register a skill for a user in nested mapping
     */
    function addSkill(address _user, string memory _skill) public {
        userSkills[_user][_skill] = true;
    }

    /**
     * @notice Check if user has a skill
     */
    function hasSkill(address _user, string memory _skill) public view returns (bool) {
        return userSkills[_user][_skill];
    }
}
