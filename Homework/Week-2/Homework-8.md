### Gas Optimization Game

_Your task is to edit and optimize the Gas.sol contract._

- You cannot edit the tests
- All the tests must pass.
- You can change the functionality of the
- contract as long as the tests pass.
- Try to get the gas usage as low as possible.

### Answer

Before Optimization Gas Report

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
