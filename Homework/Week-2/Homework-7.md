### Question 1

_The parameter X represents a function. Complete the function signature so that X is a standard ERC20 transfer function (other than the visibility). The query function should revert if the ERC20 function returns false._

```solidity
function query(address _receiver, uint256 _amount, X) public {...}
```

### Answer

```solidity
// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Homework {
    function query(
        address _receiver,
        uint256 _amount,
        function (address, uint256) external returns (bool) X
    ) public {
        bool success = X(_receiver, _amount);
        if (!success) revert("ERC20 transfer failed!");
    }
}
```

### Question 2

_The following function checks function details passed in the data parameter._

```solidity
function checkCall (bytes calldata data) external{}
```

_The data parameter is bytes encoded representing the following:_

- Function selector
- Target address
- Amount (uint256)

Complete the function body as follows:

_The function should revert if the function is not an ERC20 transfer function. Otherwise extract the address and amount from the data variable and emit an event with those details._

### Answer

```solidity
// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Homework {

    bytes4 targetSelector = bytes4(keccak256(bytes("transfer(address,uint256)")));

    event transferOccurred(address, uint256);

    function checkCall (bytes calldata data) external {
        bytes4 selector = bytes4(data[:4]);
        if (selector != targetSelector) {
            revert("Invalid function selector!");
        }
        (address receiver, uint256 amount) = abi.decode(data[4:], (address, uint256));
        emit transferOccurred(receiver, amount);
    }
}
```
