// SPDX-License-Identifier: Unlicense
pragma solidity 0.8.19;

import { ERC721 as SolmateERC721 } from "@rari-capital/solmate/src/tokens/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// Used for minting test ERC721s in our tests
contract SeaportTestERC721Without2981 is Ownable, SolmateERC721("Test721", "TST721") {
    function mint(address to, uint256 tokenId) public returns (bool) {
        _mint(to, tokenId);
        return true;
    }

    function tokenURI(uint256) public pure override returns (string memory) {
        return "tokenURI";
    }

    function supportsInterface(bytes4 interfaceId) public view virtual override (SolmateERC721) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}
