// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "./ITech4dev.sol";
/**
    Implementation of IERC20 interface which is in ITech4dev file
**/

contract tech4dev is IErc20{
    
    uint public override totalSupply;
    mapping(address => uint) public override balanceOf; //map the address of the person with his balance
    mapping(address => mapping(address => uint)) public override allownace;//owner,spender, amount - nested mapping

    // assigning token name, symbol and decimals according to the requirement of the project
    // we mostly do this in constructor to only set once during construction

    string public name= "tech4dev"; 
    string public symbol = "T4D";
    /*tokens usually opt for a value of 18 since 1ETH = 10 ** 18 and
    this is just for display purpose it will not affect the arthimatic of the contract*/
    uint public decimals = 18;

    /*
    * transfer function will take the address of the recipient and the amount to transfer
    * It will return a boolean
    * since this transfer function is overriding the base transfer function from the interface that this contract inherit
    *           - the keyword override

    */

    function transfer(address recipient, uint amount) external override returns(bool){

        balanceOf[msg.sender] = balanceOf[msg.sender] - amount; //subtracting the amount from the owner's account
        balanceOf[recipient] = balanceOf[recipient] + amount;//adding the amount to the recipient's account

        emit Transfer(msg.sender,recipient, amount); //event is declared in the interface so here we will emit it/brodcast it
         return true; //Since the default value of bool is false, we are making sure it will return true if the transfer is succssfull      
              
    }
    //approve some to another account
    /*
    approve function - takes the address of the spender and amount and it allows an account(sepnder)
    to withdraw from anaother acocunt(the caller) multiple times upto the specified value(amount)
    It is what makes the trasnferFrom possible 
    */
    function approve(address spender, uint amount) external override returns(bool){
         allownace[msg.sender][spender] = amount;

         emit Approval(msg.sender, spender,amount);

         return true;

     }

     /*
     transferFrom function - takes the address of the spender, the recipient and the amount to transfer
                            - returns boolena
                            - override since we are overriding the function in the interface
     */

    function transferFrom(address sender, address recipient, uint amount) external override returns(bool){
        allownace[sender][msg.sender] -= amount;
        balanceOf[sender] -= amount;
        balanceOf[recipient] += amount;

        emit Transfer(sender,recipient,amount);
        return true;
     }

    /*mint function allows the token owner to create a specified amount(amount) of new tokens and 
    transfer it to themself
    It will increase the total supply of the token
    */
     function mint(uint amount) public{
         balanceOf[msg.sender] += amount;
         totalSupply += amount;

         emit Transfer(address(0), msg.sender, amount);
         
     }

    //direct opposit of mint function , It remove,burn 
    /*
    burn function allwos a token holder to burn/destroy a specified amount of existig tokens from their own account
    It will decrease the total supply of the token
    */
     function burn(uint amount) public{
         balanceOf[msg.sender] -= amount;
         totalSupply -= amount;

         emit Transfer(msg.sender,address(0),amount);
     }



   

      

    
    




}
