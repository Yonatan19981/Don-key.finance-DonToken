// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./extensions/ERC20Burnable.sol";

contract Donkey is ERC20Burnable {

    constructor() ERC20("Donkey","DON"){
      
        uint256 initialSupply = 100000000 * 10 ** decimals();
        
        _mint(_msgSender(), initialSupply);
    }
}    