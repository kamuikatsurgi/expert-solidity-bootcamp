// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Intro {
    function intro() public pure returns (uint256) {
        uint256 value = 100;
        assembly {
            let ptr:= mload(0x40)
            mstore(ptr, value)
            // update free memory pointer value
            mstore(0x40, add(ptr, 0x20))
            return(ptr, add(ptr, 0x20))
        }
    }
}