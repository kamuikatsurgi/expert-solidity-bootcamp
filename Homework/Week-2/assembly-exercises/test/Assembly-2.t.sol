// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test} from "forge-std/Test.sol";
import {Add} from "../src/Assembly-2.sol";

contract AssemblyTwoTest is Test {
    Add add;

    function setUp() public {
        add = new Add();
    }

    function test_addAssembly() public {
        assertEq(add.addAssembly(10, 10), 20);
    }

    function testFuzz_addAssembly(uint256 x, uint256 y) public {
        // to prevent overflow
        vm.assume(x < type(uint128).max);
        vm.assume(y < type(uint128).max);
        assertEq(add.addAssembly(x, y), x + y);
    }
}