//MiniProject/tech4devInterface.sol
// SPDX-License-Identifier: MIT
// ERC20 token require a soldity version v0.4.17 or above - here we are using v0.8.13 or above by using the keyword pragma solidity
pragma solidity ^0.8.13;

// creating an interface named IERC20 
interface IErc20 {
    /* Mandatory methods for ERC-20 as specified on EIP (Etherum  Implementaion Proposal are
    * totalSupply() - returns the total token supply
    * balanceOf() - returns the account balance of another account with address _owner
    * tranfer() - transfer amount if tokens to address recipient and will fire the Transfer event
    * transferFrom() - transfer amount of tokens from address of sender to address of recipientand will fire the Transfer event
    * allowance() - returns the amount of which spender is still allowed to withdraw from the owner
    * approve() - allows spender to withdraw from ur account multiple times ut to the value of amount
    */
    /*
    All functions in interface contracts are automatically considered virtual
    */

    function totalSupply() external view returns(uint); //total number of token
    function balanceOf(address account) external view returns(uint); //the balance of the given account
    function transfer(address recipient, uint amount) external returns(bool);//takes the address for whom u transfer and the amount to transfer, returns true if successful
    function transferFrom(address sender, address recipient, uint amount) external returns(bool);
    function allownace(address owner, address spender) external view returns(uint); //the owner is allowing a spender to spend some amount from his account
    function approve(address spender, uint amount) external returns(bool);
  

   /* Mandatory Events for ERC-20 as specified on EIP are
   * Transfer() - will be triggered when tokens are transfered incuding zero value transfer
   * Approval() - will be triggered on any successful call to approve method
    */

    event Transfer(address indexed from, address indexed to, uint amount);
     //The indexed parameters for logged events will allow you to search for these events using the indexed parameters as filters.
     //only relevant to logged events
     event Approval(address indexed owner, address indexed spender, uint amount);
    
}