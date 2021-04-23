// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./ERC20.sol";

contract Donkey is ERC20 {

    mapping (address => bool) private _Utility;
    address private utilityApprover;
    
    constructor() ERC20("donkey","DNK"){
      
        uint256 initialSupply = 100000000 * 10 ** decimals();
        
        _mint(_msgSender(), initialSupply);
        _Utility[_msgSender()]=true;
        utilityApprover = _msgSender();
    }
    
    /**
     * @dev These will modify UtilityApprover access to other user .
     *      
     * Sender must have current UtilityApprover.
     */
    function passUtilitiyAccess( address approver) public{
        require(utilityApprover == _msgSender(),
            "Only existing utilityApprover can pass his access");

        utilityApprover = approver;
    }

    /**
     * @dev Burns 'amount' tokens from the sender's wallet.
     *      
     * Sender must have utility permissions.
     */    
    function burn(uint amount) public{
        require(_Utility[_msgSender()] == true,
            "Only a wallet with utility permission can burn his tokens");

        require(balanceOf(_msgSender()) >= amount,
                "User doesn't have requested token in his account");

        _burn(_msgSender(),amount);
    }

    /**
     * @dev Returns the utility status of 'wallet'.
     */
    function getUtility(address wallet) public view returns (bool){
        return _Utility[wallet];
    }
    
    /**
     * @dev Delegates utility permissions to 'wallet'.
     *      
     * Sender must have utility permissions.
     */
    function giveUtility(address wallet) public{
        require(utilityApprover == _msgSender(),
            "Only a wallet with utility permission can burn his tokens");
            
        _Utility[wallet]=true;
    }
}    