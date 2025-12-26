# 🔐 Crypto Locking Smart Contract

**CodeAlpha Internship – Task 4**

## 📌 Overview

This project implements a **Personal Portfolio (Crypto Locking) Smart Contract** using Solidity.
The contract allows users to deposit Ether (or tokens) with a **lock-in period**, preventing withdrawals until the specified time has passed.

This task focuses on **time-based restrictions**, **secure fund storage**, and **withdrawal control** in smart contracts.

---

## 🛠️ Features

* Deposit Ether with a user-defined lock-in time
* Stores user **deposit amount** and **unlock time** using mappings
* Uses `block.timestamp` to enforce time locks
* Prevents early withdrawals
* Allows withdrawal only after the lock period expires

---

## 📂 Project Structure

```
Crypto-Locking-Contract/
│
├── CryptoLocking.sol
└── README.md
```

---

## ⚙️ How the Contract Works

### 1️⃣ Deposit

* Users deposit Ether into the contract
* A lock-in time is set during deposit
* The contract stores:

  * Deposit amount
  * Unlock timestamp

### 2️⃣ Time Lock Enforcement

* The contract checks `block.timestamp`
* Withdrawals are blocked if the current time is **before** the unlock time

### 3️⃣ Withdraw

* Users can withdraw funds **only after** the lock-in period ends
* Early withdrawal attempts are rejected

---

## 🚀 How to Deploy and Test (Using Remix IDE)

1. Open **Remix IDE**
   👉 [https://remix.ethereum.org](https://remix.ethereum.org)

2. Create a new file

   * Name it `CryptoLocking.sol`
   * Paste the smart contract code

3. Compile the contract

   * Go to **Solidity Compiler**
   * Select version `0.8.x`
   * Click **Compile**

4. Deploy the contract

   * Go to **Deploy & Run Transactions**
   * Select **Remix VM**
   * Click **Deploy**

---

## 🧪 Testing Steps

* Deposit Ether with a future lock-in time
* Try withdrawing **before** unlock time → ❌ Blocked
* Wait until lock time expires
* Withdraw after unlock time → ✅ Successful

---

## 🎯 Learning Outcomes

* Understanding **time-locked smart contracts**
* Using **mappings** for secure user data storage
* Applying **block.timestamp** for time-based logic
* Preventing unauthorized withdrawals
* Hands-on experience with **Remix IDE**

---

## 📜 License

This project is licensed under the **MIT License**.

---

