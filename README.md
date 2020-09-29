# ProfitSplitter
Solidity Contracts

## Blockchain automation
In order to automate the distribution of employee bonuses, three Smart Contracts have been developed and deployed on Ropsten test network.

## Solidity smart contracts
- AssociateProfitSplitter.sol
- TieredProfitSplitter.sol
- DeferredEquityPlan.sol

## AssociateProfitSplitter
This smart contract divides the profit equally among the employees.

### constructor
- Initialize employee addresses to receive profit
### deposit function
- Divide profit by number of employees (set to 3 employees)
- Remainder sent back to sender
### fallback function
- Set to the deposit function

## TieredProfitSplitter
This smart contract distributes the profit based on a set percentage (60, 25 and 15).

### constructor
- Initialize employee addresses to receive profit

### deposit function
- Set the amount to distribute to the percentage for the first employee (60)
- Set the amount to distribute to the percentage for the second employee (25)
- Set the amount to distribute to the percentage for the third employee (15)
- Remainder sent to employee 1

### fallback function
- Set to the deposit function

## DeferredEquityPlan
This smart contract sets the stock distribution.

### constructor
- Set the address for sending (HR) and the employee receiving equity

### distribute
- Determine time from start till 'now' to calculate equal distributions each year for 4 years

#### Security
- Ensure addresses are for HR and the employee
- Update lock time once a distribution is made
- Ensure total distribution does not exceed max distribution

### deactivate
- End the smart contract

### fallback
- revert any Ether

## Ropsten deployment
The deployment to Ropsten failed due to lack of Ether. The https://faucet.ropsten.be/ transfered failed, then grey listed for spam.

## Test results on Ganache

Before TieredProfitSplitter:

- ADDRESS: 0x26533a5942CcEFB998b57e779a3e68d536AcA288
- BALANCE: 103.31 ETH

- ADDRESS: 0x1C21f384D9C6F46209Ea9630823beE38D29d984a
- BALANCE: 94.30 ETH

- ADDRESS: 0x3b126236E6e8b66DCd2C116037bAa9b76E3ac057
- BALANCE: 99.30 ETH

After 10 Ether, tiered split:

- ADDRESS: 0x26533a5942CcEFB998b57e779a3e68d536AcA288
- BALANCE: 109.31 ETH (up 6 of 10)

- ADDRESS: 0x1C21f384D9C6F46209Ea9630823beE38D29d984a
- BALANCE: 96.80 ETH (up 2.5 of 10) 

- ADDRESS: 0x3b126236E6e8b66DCd2C116037bAa9b76E3ac057
- BALANCE: 100.80 ETH (up 1.5 of 10)
