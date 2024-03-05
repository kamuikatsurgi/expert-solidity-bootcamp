// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test} from "forge-std/Test.sol";
import {Scope} from "../src/Assembly-4.sol";

contract AssemblyFourTest is Test {
    Scope scope;

    function setUp() public {
        scope = new Scope();
    }

    function test_increment() public {
        scope.increment(10);
        assertEq(scope.count(), 20);
    }

    function testFuzz_increment(uint256 x) public {
        // to prevent overflow
        vm.assume(x < type(uint256).max - 10);
        uint256 oldCount = scope.count();
        scope.increment(x);
        uint256 newCount = scope.count();
        assertEq(newCount, oldCount + x);
    }
}