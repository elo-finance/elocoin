// SPDX-License-Identifier: MIT
/*
*
* 
*
*       ________   _____         ___________    __________      ___________  ____________    _____  ____
*      / ______/  /    /        /    ___   /   /  _______/     /   ___    / /____   ____/   /    / /   /
*     / /____    /    /        /   /  /   /   /  /            /   /  /   /      /  /       /    / /   /
*    / ______/  /    /        /   /__/   /   /  /            /   /__/   /      /  /       /  /\ \/   /
*   / /_____   /    /______  /          /   /  /_________   /          /  ____/  /____   /  /  \    /
*  /_______/  /___________/ /__________/   /____________/  /__________/  /___________/  /__/    \__/
*
*
*
*  DISCLAIMER: This ELOCOIN contract is enhanced following the recommendations of the audit firm TechRate, as 7th of December, 2021.
*  The previous contract address minted on 15th of June was: 0xf19fbe5eb4c13b073428b144910b1731de34bd3f

*
*
*By Navarro & Navarro,2021
*______________________________________________________________
*
*@dev CNC
*
*In crypto and DAO we trust
*
*Real crypto value:
*_________________________________________________________________
*
*/
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/draft-ERC20Permit.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";

/// @custom:security-contact contact@elo.finance
contract ELOCOIN is ERC20, ERC20Burnable, Pausable, Ownable, ERC20Permit, ERC20Votes {
    constructor() ERC20("ELOCOIN", "ELO") ERC20Permit("ELOCOIN") {
        _mint(msg.sender, 210000000 * 10 ** decimals());
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }

    // The following functions are overrides required by Solidity.

    function _afterTokenTransfer(address from, address to, uint256 amount)
        internal
        override(ERC20, ERC20Votes)
    {
        super._afterTokenTransfer(from, to, amount);
    }

    function _mint(address to, uint256 amount)
        internal
        override(ERC20, ERC20Votes)
    {
        super._mint(to, amount);
    }

    function _burn(address account, uint256 amount)
        internal
        override(ERC20, ERC20Votes)
    {
        super._burn(account, amount);
    }
}
