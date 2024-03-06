// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Add {
    function addAssembly(uint256 x, uint256 y) public pure returns (uint256) {
        assembly {
            let result := add(x, y)
            let ptr:= mload(0x40)
            mstore(ptr, result)
            // since we are using two assembly blocks, we need to update the free memory pointer
            mstore(0x40, add(ptr, 0x20))
        }

        assembly {
            let ptr := mload(0x40)
            return(sub(ptr, 0x20), 0x20)
        }
    }
}