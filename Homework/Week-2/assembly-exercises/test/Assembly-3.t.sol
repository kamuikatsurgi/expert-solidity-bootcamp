// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test} from "forge-std/Test.sol";
import {SubOverflow} from "../src/Assembly-3.sol";

contract AssemblyThreeTest is Test {
    SubOverflow suboverflow;

    function setUp() public {
        suboverflow = new SubOverflow();
    }

    function test_suboverflow() public {
        assertEq(suboverflow.subtract(10, 8), 2);
    }

    function testFuzz_suboverflow_case_one(uint256 x, uint256 y) public {
        // Case 1: Where x > y and result does not underflow
        vm.assume(y < x);
        assertEq(suboverflow.subtract(x, y), x - y);
    }

    function testFuzz_suboverflow_case_two(uint256 x, uint256 y) public {
        // Case 1: Where x < y and result does underflow, hence it will return 0
        vm.assume(y > x);
        assertEq(suboverflow.subtract(x, y), 0);
    }
}