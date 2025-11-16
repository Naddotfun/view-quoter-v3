// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.7.6;

import {Script, console2} from "forge-std/Script.sol";
import {QuoterV3} from "../contracts/QuoterV3.sol";
import {ChainId} from "v3-periphery/contracts/libraries/ChainId.sol";

contract MyScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("OWNER_A_PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        address Unifactory = vm.envAddress("UNI_FACTORY_ADDRESS");
        address Capfactory = vm.envAddress("CAP_FACTORY_ADDRESS");
        QuoterV3 quoter1 = new QuoterV3(Unifactory);
        QuoterV3 quoter2 = new QuoterV3(Capfactory);

        console2.log("quoter1-uni", address(quoter1));
        console2.log("quoter2-cap", address(quoter2));

        vm.stopBroadcast();
    }
}
