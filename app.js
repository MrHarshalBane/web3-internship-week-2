// Web3 Internship Week 2 - ERC-20 & Controlled Token Sandbox
document.addEventListener('DOMContentLoaded', () => {
  // State
  let userBalance = 1000000;
  let isPaused = false;

  // Contracts Source Dictionary
  const contracts = {
    skilltoken: `// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title SkillToken (STK)
 * @dev Clean ERC-20 standard learning token for Skill Set Go EduTech.
 */
interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract SkillToken is IERC20 {
    string public name = "Skill Token";
    string public symbol = "STK";
    uint8 public decimals = 18;
    uint256 private _totalSupply;

    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint256)) private _allowances;

    constructor(uint256 initialSupply) {
        uint256 scaledSupply = initialSupply * (10 ** uint256(decimals));
        _mint(msg.sender, scaledSupply);
    }

    function totalSupply() public view override returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address account) public view override returns (uint256) {
        return _balances[account];
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        _transfer(msg.sender, recipient, amount);
        return true;
    }

    function _transfer(address sender, address recipient, uint256 amount) internal {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        require(_balances[sender] >= amount, "ERC20: transfer amount exceeds balance");

        _balances[sender] -= amount;
        _balances[recipient] += amount;
        emit Transfer(sender, recipient, amount);
    }

    function _mint(address account, uint256 amount) internal {
        require(account != address(0), "ERC20: mint to the zero address");
        _totalSupply += amount;
        _balances[account] += amount;
        emit Transfer(address(0), account, amount);
    }
}`,
    controlled: `// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title SkillTokenControlled (STK)
 * @dev Advanced ERC-20 implementation featuring ownership, minting, burning, and emergency pause mechanics.
 */
contract SkillTokenControlled {
    string public name = "Skill Token Controlled";
    string public symbol = "STK";
    uint8 public decimals = 18;
    uint256 public totalSupply;
    address public owner;
    bool public paused;

    mapping(address => uint256) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Mint(address indexed to, uint256 value);
    event Burn(address indexed from, uint256 value);
    event Paused(address indexed by);
    event Unpaused(address indexed by);

    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the contract owner");
        _;
    }

    modifier whenNotPaused() {
        require(!paused, "Token transfers are currently paused");
        _;
    }

    constructor(uint256 initialSupply) {
        owner = msg.sender;
        totalSupply = initialSupply * (10 ** uint256(decimals));
        balanceOf[msg.sender] = totalSupply;
        emit Transfer(address(0), msg.sender, totalSupply);
    }

    function transfer(address to, uint256 amount) external whenNotPaused returns (bool) {
        require(to != address(0), "Cannot transfer to zero address");
        require(balanceOf[msg.sender] >= amount, "Insufficient balance");
        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;
        emit Transfer(msg.sender, to, amount);
        return true;
    }

    function setPaused(bool state) external onlyOwner {
        paused = state;
        if (state) emit Paused(msg.sender);
        else emit Unpaused(msg.sender);
    }

    function mint(address to, uint256 amount) external onlyOwner {
        totalSupply += amount;
        balanceOf[to] += amount;
        emit Mint(to, amount);
        emit Transfer(address(0), to, amount);
    }

    function burn(uint256 amount) external {
        require(balanceOf[msg.sender] >= amount, "Burn amount exceeds balance");
        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;
        emit Burn(msg.sender, amount);
        emit Transfer(msg.sender, address(0), amount);
    }
}`
  };

  // DOM Elements
  const userBalanceEl = document.getElementById('user-balance');
  const recipientAddrInput = document.getElementById('recipient-addr');
  const transferAmountInput = document.getElementById('transfer-amount');
  const btnTransfer = document.getElementById('btn-transfer');
  const btnFaucet = document.getElementById('btn-faucet');
  const btnTogglePause = document.getElementById('btn-toggle-pause');
  const btnBurnTokens = document.getElementById('btn-burn-tokens');
  const contractPauseStatus = document.getElementById('contract-pause-status');
  const eventsList = document.getElementById('events-list');
  const btnClearLogs = document.getElementById('btn-clear-logs');
  const codeDisplay = document.getElementById('code-display');
  const codeTabs = document.querySelectorAll('.code-tab');
  const btnCopySol = document.getElementById('btn-copy-sol');
  const toast = document.getElementById('toast');
  const toastText = document.getElementById('toast-text');

  function showToast(msg) {
    toastText.textContent = msg;
    toast.classList.remove('hidden');
    setTimeout(() => toast.classList.add('hidden'), 2600);
  }

  function appendEvent(eventName, details) {
    const item = document.createElement('div');
    item.className = 'event-item';
    item.innerHTML = `
      <span class="event-name">${eventName}</span>
      <span class="event-details">${details}</span>
    `;
    eventsList.prepend(item);
  }

  // Token Transfer Simulation
  btnTransfer.addEventListener('click', () => {
    if (isPaused) {
      alert('Error: Execution reverted: Token transfers are currently paused by the contract owner.');
      return;
    }

    const recipient = recipientAddrInput.value.trim();
    const amount = parseInt(transferAmountInput.value, 10);

    if (!recipient || !recipient.startsWith('0x') || recipient.length < 10) {
      alert('Please enter a valid Ethereum hex address (0x...)');
      return;
    }

    if (isNaN(amount) || amount <= 0) {
      alert('Please enter a valid token transfer amount.');
      return;
    }

    if (amount > userBalance) {
      alert('Error: Execution reverted: ERC20: transfer amount exceeds balance.');
      return;
    }

    userBalance -= amount;
    userBalanceEl.textContent = userBalance.toLocaleString();
    appendEvent('Transfer', `from: 0x742d...f44e, to: ${recipient.substring(0, 8)}...${recipient.substring(recipient.length - 4)}, value: ${amount.toLocaleString()} STK`);
    showToast(`Transferred ${amount.toLocaleString()} STK successfully!`);
  });

  // Faucet
  btnFaucet.addEventListener('click', () => {
    userBalance += 100;
    userBalanceEl.textContent = userBalance.toLocaleString();
    appendEvent('Mint', `to: 0x742d...f44e, value: 100 STK`);
    showToast('Faucet: +100 STK credited to deployer wallet!');
  });

  // Toggle Pause
  btnTogglePause.addEventListener('click', () => {
    isPaused = !isPaused;
    if (isPaused) {
      contractPauseStatus.className = 'text-red';
      contractPauseStatus.innerHTML = '<i class="fa-solid fa-circle-xmark"></i> Paused';
      btnTogglePause.innerHTML = '<i class="fa-solid fa-play"></i> Unpause Contract';
      appendEvent('Paused', 'Contract transfers paused by owner (0x742d...f44e)');
      showToast('Emergency Stop Triggered: Contract Paused!');
    } else {
      contractPauseStatus.className = 'text-green';
      contractPauseStatus.innerHTML = '<i class="fa-solid fa-circle-check"></i> Active';
      btnTogglePause.innerHTML = '<i class="fa-solid fa-pause"></i> Toggle Pause State';
      appendEvent('Unpaused', 'Contract transfers unpaused by owner (0x742d...f44e)');
      showToast('Contract unpaused: Transfers enabled!');
    }
  });

  // Burn Tokens
  btnBurnTokens.addEventListener('click', () => {
    if (userBalance < 1000) {
      alert('Insufficient token balance to burn 1,000 STK.');
      return;
    }
    userBalance -= 1000;
    userBalanceEl.textContent = userBalance.toLocaleString();
    appendEvent('Burn', `from: 0x742d...f44e, value: 1,000 STK (Sent to 0x0000...0000)`);
    showToast('Burned 1,000 STK permanently from supply!');
  });

  // Clear Event Logs
  btnClearLogs.addEventListener('click', () => {
    eventsList.innerHTML = '';
  });

  // Code Tab Switcher
  codeTabs.forEach(tab => {
    tab.addEventListener('click', () => {
      codeTabs.forEach(t => t.classList.remove('active'));
      tab.classList.add('active');
      const contractKey = tab.dataset.contract;
      codeDisplay.textContent = contracts[contractKey] || '';
    });
  });

  // Copy Code
  btnCopySol.addEventListener('click', () => {
    navigator.clipboard.writeText(codeDisplay.textContent).then(() => {
      showToast('Contract code copied to clipboard!');
    }).catch(() => {
      showToast('Copied code!');
    });
  });

  // Campaign Kit Copy
  const btnCopyCampaignSummary = document.getElementById('btn-copy-campaign-summary');
  if (btnCopyCampaignSummary) {
    btnCopyCampaignSummary.addEventListener('click', () => {
      const summaryText = `🚀 7-Day Web3 Promotion Campaign Kit:
• Day 1: GitHub SEO, Repo Curation & Metadata Optimization (Done)
• Days 2–4: Community Technical Sharing (Reddit r/ethdev, Developer DAO, Farcaster, Web3 Discords)
• Days 5–6: Fostering Genuine Engagement & Interactive Token Simulation Feedback
• Day 7: Analytics Review (GitHub Traffic, Stars, Forks & Test Transfers)

Live Hub: https://mrharshalbane.github.io/web3-internship-week-2/
GitHub: https://github.com/MrHarshalBane/web3-internship-week-2`;
      navigator.clipboard.writeText(summaryText).then(() => {
        showToast('Full 7-Day Campaign Kit copied to clipboard!');
      });
    });
  }

  // Pitch Snippet Copy
  const btnCopyPitch = document.getElementById('btn-copy-pitch');
  const pitchSnippet = document.getElementById('pitch-snippet');
  if (btnCopyPitch && pitchSnippet) {
    btnCopyPitch.addEventListener('click', () => {
      navigator.clipboard.writeText(pitchSnippet.textContent.replace(/^"|"$/g, '')).then(() => {
        showToast('Community outreach snippet copied!');
      });
    });
  }

  // Share on X / Twitter
  const btnShareTwitter = document.getElementById('btn-share-twitter');
  if (btnShareTwitter) {
    btnShareTwitter.addEventListener('click', () => {
      const tweetText = encodeURIComponent("Explore my Solidity & ERC-20 Token Engine built during the Web3 internship! Interactive browser testing, Sepolia testnet verification & access control mechanics.\n\nLive Hub: https://mrharshalbane.github.io/web3-internship-week-2/\n#Web3 #Solidity #Ethereum #Blockchain #BuildInPublic");
      window.open(`https://twitter.com/intent/tweet?text=${tweetText}`, '_blank');
    });
  }

  // Share on LinkedIn
  const btnShareLinkedin = document.getElementById('btn-share-linkedin');
  if (btnShareLinkedin) {
    btnShareLinkedin.addEventListener('click', () => {
      const shareUrl = encodeURIComponent("https://mrharshalbane.github.io/web3-internship-week-2/");
      window.open(`https://www.linkedin.com/sharing/share-offsite/?url=${shareUrl}`, '_blank');
    });
  }
});

