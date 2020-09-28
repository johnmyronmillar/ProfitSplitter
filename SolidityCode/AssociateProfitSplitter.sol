pragma solidity ^0.5.0;

// @NOTE: This only works in Remix. Alternatively, paste the contents of SafeMath.sol directly here above ArcadeToken.
import "github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/math/SafeMath.sol";


// lvl 1: equal split
contract AssociateProfitSplitter {
    // @TODO: Create three payable addresses representing `employee_one`, `employee_two` and `employee_three`.
    using SafeMath for uint;
    
    address employee_one;
    address employee_two;
    address employee_three;

    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }

    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        // @TODO: Split `msg.value` into three
        uint amount = msg.value.div(3); // Your code here!

        // @TODO: Transfer the amount to each employee
        // Your code here!
        balances[employee_one] = balances[employee_one].add(amount);
        balances[employee_two] = balances[employee_two].add(amount);
        balances[employee_three] = balances[employee_three].add(amount);

        // @TODO: take care of a potential remainder by sending back to HR (`msg.sender`)
        // Your code here!
        uint remainder = msg.value.sub(amount * 3);
        balances[msg.sender] = balances[msg.sender].add(remainder);

    }

    function() external payable {
        // @TODO: Enforce that the `deposit` function is called in the fallback function!
        // Your code here!
        deposit;
        
    }
}