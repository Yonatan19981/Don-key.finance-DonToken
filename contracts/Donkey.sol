// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./ERC20.sol";

contract Donkey is ERC20 {

    constructor() ERC20("Donkey","DON"){
      
        uint256 initialSupply = 100000000 * 10 ** decimals();
        
        _mint(_msgSender(), initialSupply);
    }
}
