### Question 1

_What are the advantages and disadvantages of the 256 bit word length in the EVM?_

### Answer

- 32 byte word size - the alternative is 4 or 8 byte words, as in most other architectures, or unlimited, as in Bitcoin. 4 or 8 byte words are too restrictive to store addresses and big values for crypto computations, and unlimited values are too hard to make a secure gas model around. 32 bytes is ideal because it is just large enough to store 32 byte values common in many crypto implementations, as well as addresses (and provides the ability to pack address and value into a single storage index as an optimization), but not so large as to be extremely inefficient.

- A storage slot is 256 bits, as are hashes, ETH amounts etc, so it's simpler to standardize on returning a 256-bit number.

### Question 2

_What would happen if the implementation of a precompiled contract varied between Ethereum clients?_

### Answer

**Consensus Issues:** Ethereum relies on a consensus mechanism where all nodes must agree on the state of the blockchain. If different clients interpret precompiled contracts differently, it can lead to consensus failures where nodes disagree on the validity of transactions and blocks.

**Interoperability Challenges:** Ethereum aims to be a decentralized platform where different clients can interact seamlessly. Varying implementations of precompiled contracts could hinder interoperability between different clients, leading to fragmentation of the network.

### Question 3

_Using Remix write a simple contract that uses a memory variable, then using the debugger step through the function and inspect the memory._

### Answer

```solidity
pragma solidity 0.8.24;

contract Homework {

    uint256[] array;

    function changeArray(uint256[] memory newArray) external {
        array = newArray;
    }
}
```

Upon deployment, the contract's memory is initially empty, with the free memory pointer (0x40) set to a value of 80, indicating it's pointing to the 4th slot.

When the `changeArray()` function is called with [10] as input, the memory layout changes as follows:

The free memory pointer (0x40) now points to the 6th slot, as the 4th slot stores the size of the array and the 5th slot stores the value 10.

Memory:

- 0x40: c0
- 0x60: (empty)
- 0x80: 1 (size of the array)
- 0xa0: a (byte representation of 10)

Subsequently, calling `changeArray()` with [10, 10, 10] as input updates the memory as follows:

The free memory pointer (0x40) now points to the 8th slot.

Memory:

- 0x40: 100
- 0x60: (empty)
- 0x80: 3 (size of the array)
- 0xa0: a (byte representation of 10)
- 0xc0: a (byte representation of 10)
- 0xd0: a (byte representation of 10)

This demonstrates how the memory layout changes with different inputs to the `changeArray()` function, dynamically adjusting to accommodate the array's size and elements.
