// SPDX-License-Identifier: Unlicense
pragma solidity 0.8.19;

import { ERC1155 as SolmateERC1155 } from "@rari-capital/solmate/src/tokens/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// Used for minting test ERC1155s in our tests
contract SeaportTestERC1155Without2981 is Ownable, SolmateERC1155 {
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

    function supportsInterface(bytes4 interfaceId) public view virtual override (SolmateERC1155) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}
