// SPDX-License-Identifier: Unlicense
pragma solidity 0.8.19;

import { ERC1155 as SolmateERC1155 } from "@rari-capital/solmate/src/tokens/ERC1155.sol";
import "../utils/ERC2981.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// Used for minting test ERC1155s in our tests
contract SeaportTestERC1155 is Ownable, ERC2981, SolmateERC1155 {
    function mint(
        address to,
        uint256 tokenId,
        uint256 amount
    ) public returns (bool) {
        _mint(to, tokenId, amount, "");
        return true;
    }

    function uri(uint256) public pure override returns (string memory) {
        return "uri";
    }

    function setDefaultRoyaltyInfo(address receiver, uint96 feeNumerator) public {
        _setDefaultRoyalty(receiver, feeNumerator);
    }

    function setTokenRoyalty(uint256 tokenId, address receiver, uint96 feeNumerator) public {
        _setTokenRoyalty(tokenId, receiver, feeNumerator);
    }

    function supportsInterface(bytes4 interfaceId) public view virtual override (SolmateERC1155, ERC2981) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}
