### Gas Optimization Game

_Your task is to edit and optimize the [Gas.sol](./gas-optimization-game/src/Gas.sol) contract._

- You cannot edit the tests
- All the tests must pass.
- You can change the functionality of the contract as long as the tests pass.
- Try to get the gas usage as low as possible.

### Answer

**Before Optimization Gas Report**

```bash
Test result: ok. 16 passed; 0 failed; 0 skipped; finished in 1.16s

| src/Gas.sol:GasContract contract |                 |        |        |        |         |
|----------------------------------|-----------------|--------|--------|--------|---------|
| Deployment Cost                  | Deployment Size |        |        |        |         |
| 2423432                          | 11894           |        |        |        |         |
| Function Name                    | min             | avg    | median | max    | calls   |
| addToWhitelist                   | 13115           | 57815  | 84266  | 84266  | 8       |
| administrators                   | 2523            | 2523   | 2523   | 2523   | 5       |
| balanceOf                        | 616             | 2116   | 2616   | 2616   | 8       |
| balances                         | 554             | 1054   | 554    | 2554   | 4       |
| checkForAdmin                    | 11621           | 11621  | 11621  | 11621  | 1       |
| getPaymentStatus                 | 780             | 780    | 780    | 780    | 1       |
| transfer                         | 191457          | 192957 | 193457 | 193457 | 4       |
| whiteTransfer                    | 94956           | 96289  | 96956  | 96956  | 3       |
| whitelist                        | 598             | 598    | 598    | 598    | 2       |

Ran 1 test suite in 1.16s: 16 tests passed, 0 failed, 0 skipped (16 total tests)
```

**After Optimization Gas Report**

```bash
Suite result: ok. 16 passed; 0 failed; 0 skipped; finished in 791.46ms (2.40s CPU time)
| src/Gas.sol:GasContract contract |                 |       |        |       |         |
|----------------------------------|-----------------|-------|--------|-------|---------|
| Deployment Cost                  | Deployment Size |       |        |       |         |
| 336312                           | 1798            |       |        |       |         |
| Function Name                    | min             | avg   | median | max   | calls   |
| addToWhitelist                   | 21741           | 22697 | 23095  | 23305 | 8       |
| administrators                   | 421             | 462   | 465    | 498   | 5       |
| balanceOf                        | 593             | 2093  | 2593   | 2593  | 8       |
| balances                         | 531             | 1031  | 531    | 2531  | 4       |
| checkForAdmin                    | 405             | 405   | 405    | 405   | 1       |
| getPaymentStatus                 | 488             | 488   | 488    | 488   | 1       |
| transfer                         | 49655           | 49736 | 49691  | 49907 | 4       |
| whiteTransfer                    | 67532           | 67608 | 67556  | 67736 | 3       |
| whitelist                        | 366             | 366   | 366    | 366   | 2       |

Ran 1 test suite in 825.94ms (791.46ms CPU time): 16 tests passed, 0 failed, 0 skipped (16 total tests)
```
