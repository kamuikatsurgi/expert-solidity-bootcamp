// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test} from "forge-std/Test.sol";
import {Intro} from "../src/Assembly-1.sol";

contract AssemblyOneTest is Test {
    Intro intro;

    function setUp() public {
        intro = new Intro();
    }

    function test_intro() public {
        assertEq(intro.intro(), 100);
    }
}