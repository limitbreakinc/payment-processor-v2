// SPDX-License-Identifier: Unlicense
pragma solidity 0.8.19;

import { ERC721 as SolmateERC721 } from "@rari-capital/solmate/src/tokens/ERC721.sol";
import "../utils/ERC2981.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// Used for minting test ERC721s in our tests
contract SeaportTestERC721 is Ownable, ERC2981, SolmateERC721("Test721", "TST721") {
    function mint(address to, uint256 tokenId) public returns (bool) {
        _mint(to, tokenId);
        return true;
    }

    function tokenURI(uint256) public pure override returns (string memory) {
        return "tokenURI";
    }

    function setDefaultRoyaltyInfo(address receiver, uint96 feeNumerator) public {
        _setDefaultRoyalty(receiver, feeNumerator);
    }

    function setTokenRoyalty(uint256 tokenId, address receiver, uint96 feeNumerator) public {
        _setTokenRoyalty(tokenId, receiver, feeNumerator);
    }

    function supportsInterface(bytes4 interfaceId) public view virtual override (SolmateERC721, ERC2981) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}
