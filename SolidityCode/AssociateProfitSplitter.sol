pragma solidity ^0.5.0;

// @NOTE: This only works in Remix. Alternatively, paste the contents of SafeMath.sol directly here above ArcadeToken.
import "github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/math/SafeMath.sol";


// lvl 1: equal split
contract AssociateProfitSplitter {
    // @TODO: Create three payable addresses representing `employee_one`, `employee_two` and `employee_three`.
    using SafeMath for uint;
    
    address payable employee_one;
    address payable employee_two;
    address payable employee_three;

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
        uint amount = msg.value.div(3);

        // @TODO: Transfer the amount to each employee
        employee_one.transfer(amount);
        employee_two.transfer(amount);
        employee_three.transfer(amount);

        // @TODO: take care of a potential remainder by sending back to HR (`msg.sender`)
        uint remainder = msg.value.sub(amount * 3);
        employee_one.transfer(remainder);
        // balances[msg.sender] = balances[msg.sender].add(remainder);

    }

    function() external payable {
        // @TODO: Enforce that the `deposit` function is called in the fallback function!
        deposit(employee_one, employee_two, employee_three);
    }
}
