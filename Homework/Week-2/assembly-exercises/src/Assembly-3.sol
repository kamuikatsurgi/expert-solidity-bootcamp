// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract SubOverflow {
    // Modify this function so that on overflow it returns the value 0
    // otherwise it should return x - y
    function subtract(uint256 x, uint256 y) public pure returns (uint256) {
        // Write assembly code that handles overflows
        assembly {
            let zero := 0
            let ptr := mload(0x40)
            mstore(ptr, zero)
            mstore(0x40, add(ptr, 0x20))
            let result := sub(x, y)
            // (x - y) > x -> not possible
            if gt(result, x) {
                return(ptr, add(ptr, 0x20))
            }
            let newptr := mload(0x40)
            mstore(newptr, result)
            mstore(0x40, add(newptr, 0x20))
            return(newptr, add(newptr, 0x20))
        }
    }
}