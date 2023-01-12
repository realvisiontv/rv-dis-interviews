// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts@4.8.0/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.8.0/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts@4.8.0/security/Pausable.sol";
import "@openzeppelin/contracts@4.8.0/access/AccessControl.sol";
import "@openzeppelin/contracts@4.8.0/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts@4.8.0/utils/Counters.sol";

contract MyNFT00000 is ERC721, ERC721Enumerable, Pausable, AccessControl, ERC721Burnable {
    using Counters for Counters.Counter;

    bytes32 public constant ROLE_PAUSER = keccak256("ROLE_PAUSER");
    bytes32 public constant ROLE_MINTER = keccak256("ROLE_MINTER");
    bytes32 public constant ROLE_GRANTS_MINTER = keccak256("ROLE_GRANTS_MINTER");
    Counters.Counter private _tokenIdCounter;
    string _tokensBaseURI;

    constructor() ERC721("MyNFT00000", "MFT0x5") {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(ROLE_PAUSER, msg.sender);
        _grantRole(ROLE_MINTER, msg.sender);
    }

    function safeMint(address to) public onlyRole(ROLE_MINTER) {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }

    function grantMinterRole(address account) external onlyRole(ROLE_GRANTS_MINTER) {
        _grantRole(ROLE_MINTER, account);
    }

    function setBaseURI(string calldata newURI) external onlyRole(DEFAULT_ADMIN_ROLE) {
        _tokensBaseURI = newURI;
    }

    function _baseURI() internal view override(ERC721) returns (string memory) {
        return _tokensBaseURI;
    }

    function pause() public onlyRole(ROLE_PAUSER) {
        _pause();
    }

    function unpause() public onlyRole(ROLE_PAUSER) {
        _unpause();
    }

    function destroyContract(address payable addr) external onlyRole(DEFAULT_ADMIN_ROLE) {
        selfdestruct(addr);
    }

    function _beforeTokenTransfer(address from, address to, uint256 tokenId, uint256 batchSize)
        internal
        whenNotPaused
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId, batchSize);
    }

    // The following functions are overrides required by Solidity.

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable, AccessControl)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
