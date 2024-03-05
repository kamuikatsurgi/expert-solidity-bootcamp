### Question 1

_Look at the example of init code in this [GIST](https://gist.github.com/extropyCoder/4243c0f90e6a6e97006a31f5b9265b94). When we do the CODECOPY operation, what are we overwriting?_

### Answer

When we deploy the above contract, `CODECOPY` copies the entire calldata into the memory.

**Usage**

- Copies bytes from this contract to memory
- Revert reason error messages
- Deploy a contract from this contract
- Any other static data

### Question 4

_Write some Yul. 1. Add 0x07 to 0x08. 2. store the result at the next free memory location. 3. (optional) write this again in opcodes_

### Answer

```solidity
// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Yul {
    function addAssembly() public pure returns (uint256) {
        assembly {
            let result := add(0x07, 0x08)
            let ptr:= mload(0x40)
            mstore(ptr, result)
            // update free memory pointer
            mstore(0x40, add(ptr, 0x20))
            // return result
            return(ptr, 0x20)
        }
    }
}
```

### Question 6

_Complete the assembly exercises._

### Answer

All the assembly exercises are successfully completed. You can find the solutions in the following directories:

- [Exercises](./assembly-exercises/src/): This directory contains the completed tasks for the assembly exercises.
- [Tests](./assembly-exercises/test/): This directory contains the unit and fuzz tests to verify the correctness of the assembly implementations.
