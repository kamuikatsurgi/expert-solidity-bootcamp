### Question 1

_Write a function that will delete items (one at a time) from a dynamic array without leaving gaps in the array. You should assume that the items to be deleted are chosen at random, and try to do this in a gas efficient manner. For example imagine your array has 12 items and you need to delete the items at indexes 8, 2 and 7. The final array will then have items {0,1,3,4,5,6,9,10,11}_

### Answer (My approach - Probably not the most gas-efficient)

```solidity
// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Homework {

    uint256[] array;

    constructor(uint256[] memory inputArray) {
        array = inputArray;
    }

    function deleteItems(uint256[] calldata indexes) external returns (uint256[] memory) {
        for (uint8 i = 0; i < indexes.length; ++i) {
            uint256 indexValue = array[indexes[i]];
            for (uint8 j; j < array.length; ++j) {
                if (indexValue == array[j]) {
                    array[j] = array[array.length - 1];
                    array.pop();
                }
            }
        }
        return array;
    }
}

// inputArray: [0,1,2,3,4,5,6,7,8,9,10,11]
// indexes: [8,2,7]
// output: [0,1,10,3,4,5,6,9,11]
```
