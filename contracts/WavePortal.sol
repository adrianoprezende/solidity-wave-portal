// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint256 private totalWaves;
    mapping (address => Wave[]) private wavePeople;
    Wave[] waves;
    uint256 private seed;

    event NewWave(address indexed from, uint256 timestamp, string message);
    event Awarded(address indexed from, uint256 prizeAmount);

    struct Wave {
        address waver; // Endereço do usuário que deu h5
        string message; // Mensagem que o usuário enviou
        uint256 timestamp; // Data/hora de quando o usuário deu h5.
    }

    constructor() payable {
        seed = generateSeed();
        console.log("Hello, Etherium World!");
    }

    function generateSeed() private view returns (uint256) {
        uint256 _seed = (block.timestamp + block.difficulty) % 100;
        console.log("# Randomic generated: %d", _seed);
        return _seed;
    }

    function wave(string memory _message) public {

        if ( wavePeople[msg.sender].length > 0 ) {
            uint lastIndex = wavePeople[msg.sender].length - 1;
            require(
                wavePeople[msg.sender][lastIndex].timestamp + 2 minutes < block.timestamp,
                "Wait 2 minutes to send another High Five!"
            );
        }

        Wave memory curWave = Wave(msg.sender, _message, block.timestamp);
        wavePeople[msg.sender].push(curWave);
        waves.push(curWave);

        seed = generateSeed();

        totalWaves += 1;

        console.log("Address %s let the message %s and gave a total of %d high five!", msg.sender, _message, wavePeople[msg.sender].length);

        if (seed <= 50) {
            console.log("%s won!", msg.sender);

            uint256 prizeAmount = 0.0001 ether;
        
            require(
                prizeAmount <= address(this).balance,
                "Trying to withdraw more money than the contract has."
            );

            (bool success, ) = (msg.sender).call{value: prizeAmount}("");
            require(success, "Failed to withdraw money from contract.");

            emit Awarded(msg.sender, prizeAmount);
        }

        emit NewWave(msg.sender, block.timestamp, _message);
    }

    function getAllWaves() public view returns (Wave[] memory) {
        return waves;
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have a total of %d high five!", totalWaves);
        return totalWaves;
    }
}
