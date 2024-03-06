// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test} from "forge-std/Test.sol";
import {Yul} from "../src/Assembly-5.sol";

contract AssemblyFiveTest is Test {
    Yul yul;
    address test;

    function setUp() public {
        yul = new Yul();
        test = makeAddr("test");
    }

    function test_check_wei_return_value() public {
        uint256 wei_value = yul.return_wei_sent{value: 1e18}();
        assertEq(wei_value, 1e18);
    }

    function testFuzz_check_wei_return_value(uint64 x) public {
        uint256 wei_value = yul.return_wei_sent{value: x}();
        assertEq(wei_value, x);
    }
}