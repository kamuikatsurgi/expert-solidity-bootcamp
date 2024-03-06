// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Yul {
    function return_wei_sent() public payable returns (uint256) {
        assembly {
            let amount_sent := callvalue()
            let ptr := mload(0x40)
            mstore(ptr, amount_sent)
            // return wei sent
            return(ptr, 0x20)
        }
    }
}