// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.14;

library Position {
    struct Info {
        uint128 liquidity;
    }
    

    function update (Info storage self, uint128 liquidityDelta) internal {
        uint128 liquidityBefore = self.liquidity;
        uint128 liquidityAfter = liquidityBefore + liquidityDelta;

        self.liquidity = liquidityAfter;
    }

    function get(
        mapping(bytes32 => Info) storage self,
        address owner,
        int24 lowerTick,
        int24 upperTick
    ) internal view returns (Position.Info storage position) {

        //https://www.notion.so/00ed1a54cfb84f09b0a899cbbd873fca?pvs=4#23385c1c6f1c4eac99d79cb3464180b5
        position = self [
            keccak256(abi.encodePacked(owner, lowerTick, upperTick))
        ];
    }
}