// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "../../02-erc20-token/contracts/SkillToken.sol";

/**
 * @title SkillTokenControlled
 * @dev Extended ERC-20 token implementing custom access control modifiers, ownership management,
 *      emergency pause mechanism, custom event logging, minting, and burning capabilities.
 */
contract SkillTokenControlled is SkillToken {
    // ACCESS CONTROL STATE
    address public owner;
    bool public paused;

    // EVENTS
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    event PausedStateChanged(bool isPaused, address indexed account);
    event TokensMinted(address indexed to, uint256 amount);
    event TokensBurned(address indexed from, uint256 amount);

    // MODIFIERS

    /**
     * @dev Restricts execution to contract owner only
     */
    modifier onlyOwner() {
        require(msg.sender == owner, "AccessControl: caller is not the owner");
        _;
    }

    /**
     * @dev Restricts execution when contract is not paused
     */
    modifier whenNotPaused() {
        require(!paused, "Pausable: token transfers are paused");
        _;
    }

    /**
     * @dev Restricts execution when contract is paused
     */
    modifier whenPaused() {
        require(paused, "Pausable: contract is not paused");
        _;
    }

    /**
     * @notice Constructor sets owner and initial token supply
     * @param initialSupply Initial supply of tokens
     */
    constructor(uint256 initialSupply) SkillToken(initialSupply) {
        owner = msg.sender;
        paused = false;
        emit OwnershipTransferred(address(0), msg.sender);
    }

    /**
     * @notice Transfer contract ownership to a new address
     * @param newOwner Address of new owner
     */
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "AccessControl: new owner is zero address");
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }

    /**
     * @notice Pause all token transfers (Emergency stop mechanism)
     */
    function pause() public onlyOwner whenNotPaused {
        paused = true;
        emit PausedStateChanged(true, msg.sender);
    }

    /**
     * @notice Unpause token transfers
     */
    function unpause() public onlyOwner whenPaused {
        paused = false;
        emit PausedStateChanged(false, msg.sender);
    }

    /**
     * @notice Mint new tokens (Restricted to contract owner)
     * @param to Recipient address
     * @param amount Token amount to mint
     */
    function mint(address to, uint256 amount) public onlyOwner returns (bool) {
        _mint(to, amount);
        emit TokensMinted(to, amount);
        return true;
    }

    /**
     * @notice Burn tokens from caller balance
     * @param amount Token amount to burn
     */
    function burn(uint256 amount) public returns (bool) {
        require(balanceOf(msg.sender) >= amount, "Burn: amount exceeds balance");
        
        // Internal transfer to zero address simulating burn
        _transfer(msg.sender, address(0), amount);
        emit TokensBurned(msg.sender, amount);
        return true;
    }

    /**
     * @notice Overridden transfer function with pause modifier enforcement
     */
    function transfer(address recipient, uint256 amount) public override whenNotPaused returns (bool) {
        return super.transfer(recipient, amount);
    }

    /**
     * @notice Overridden transferFrom function with pause modifier enforcement
     */
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) public override whenNotPaused returns (bool) {
        return super.transferFrom(sender, recipient, amount);
    }
}
