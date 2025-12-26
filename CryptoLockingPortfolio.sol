// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CryptoLockingPortfolio {
    mapping(address => uint256) public deposits;
    mapping(address => uint256) public unlockTime;

    event Deposited(address indexed user, uint256 amount, uint256 unlockAt);
    event Withdrawn(address indexed user, uint256 amount);

    function deposit(uint256 _lockDuration) external payable {
        require(msg.value > 0, "Must deposit some Ether");
        require(deposits[msg.sender] == 0, "Already have a deposit");

        deposits[msg.sender] = msg.value;
        unlockTime[msg.sender] = block.timestamp + _lockDuration;

        emit Deposited(msg.sender, msg.value, unlockTime[msg.sender]);
    }

    function withdraw() external {
        uint256 amount = deposits[msg.sender];
        require(amount > 0, "No deposit found");
        require(block.timestamp >= unlockTime[msg.sender], "Lock time not expired");

        deposits[msg.sender] = 0;
        unlockTime[msg.sender] = 0;

        (bool ok, ) = payable(msg.sender).call{value: amount}("");
        require(ok, "Transfer failed");

        emit Withdrawn(msg.sender, amount);
    }

    function getMyDeposit() external view returns (uint256 amount, uint256 unlockAt) {
        return (deposits[msg.sender], unlockTime[msg.sender]);
    }

    function timeLeft() external view returns (uint256) {
        if (block.timestamp >= unlockTime[msg.sender]) return 0;
        return unlockTime[msg.sender] - block.timestamp;
    }
}
