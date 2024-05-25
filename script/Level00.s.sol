// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script, console} from "forge-std/Script.sol";
import { HelloEthernaut } from "../src/Level00.sol";

contract HelloEthernautScript is Script {

    HelloEthernaut public helloEthernaut;

    function setUp () public  {
        helloEthernaut = HelloEthernaut(0x9153479C68c7C96f48285262817D36F6B0C34D39);
    }

    function run () public {
        vm.startBroadcast();

        string memory password;
        password =  helloEthernaut.password();

        helloEthernaut.authenticate(password);
        
        vm.stopBroadcast();
    }
}