// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.14;

interface IERC20 {
    function approve(address, uint256) external;

    function transfer(address, uint256) external returns (bool);

    function balanceOf(address) external returns (uint256);

    function transferFrom(address, address, uint256) external;
}