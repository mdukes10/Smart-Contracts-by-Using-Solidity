pragma solidity ^0.5.0;

// lvl 1: equal split


contract AssociateProfitSplitter {
    address payable public employee_one; 
    address payable public employee_two; 
    address payable public employee_three; 

// @TODO: Create three payable addresses representing `employee_one`, `employee_two` and `employee_three`.

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

        uint amount = (msg.value / 3);
       
        // @TODO: Transfer the amount to each employee

        employee_one.transfer(amount);
        employee_two.transfer(amount);
        employee_three.transfer(amount);
       
       // @TODO: Split `msg.value` into three

        msg.sender.transfer(msg.value-amount*3);
        
    }
    
      // @TODO: Enforce that the `deposit` function is called in the fallback function!


    function fallback() external payable {
        deposit();
    }
}
