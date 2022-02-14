// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.11;

import "hardhat/console.sol";

contract WavePortal {

    event NewWave(address indexed from, string message, uint256 timestamp);

    struct Wave {
        address waver; // The address of the user who waved.
        string message; // The message the user sent.
        uint256 timestamp; // The timestamp when the user waved.
    }

    Wave[] waves;
    uint public totalWaves;

    constructor() {
        console.log("I AM SMART CONTRACT. POG.");
    }

    function wave(string memory _message) public {
        totalWaves += 1;
        console.log("%s waved w/ message %s", msg.sender, _message);

        waves.push(Wave(msg.sender, _message, block.timestamp));

        emit NewWave(msg.sender, _message, block.timestamp);
    }

    function getAllWaves() public view returns(Wave[] memory) {
        return waves;
    }

    function getTotalWaves() public view returns(uint256) {
        console.log("We have %d total waves!", totalWaves);
        return totalWaves;
    }
}