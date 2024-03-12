// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract GasContract {

    uint256 private whiteListAmount;
    mapping(address => uint256) public balances;

    event WhiteListTransfer(address indexed);
    event AddedToWhitelist(address userAddress, uint256 tier);

    constructor(address[] memory /*_admins*/, uint256 /*_totalSupply*/) {
        balances[0x0000000000000000000000000000000000001234] = 1000000000;
    }

    function administrators(uint256 index) public pure returns (address admin) {
        assembly {
            switch index
            case 0 {
                admin := 0x3243Ed9fdCDE2345890DDEAf6b083CA4cF0F68f2
            }
            case 1 {
                admin := 0x2b263f55Bf2125159Ce8Ec2Bb575C649f822ab46
            }
            case 2 {
                admin := 0x0eD94Bc8435F3189966a49Ca1358a55d871FC3Bf
            }
            case 3 {
                admin := 0xeadb3d065f8d15cc05e92594523516aD36d1c834
            }
            case 4 {
                admin := 0x1234
            }
        }
    }

    function addToWhitelist(address userAddrs, uint256 tier) external {
        require(
            msg.sender == 0x0000000000000000000000000000000000001234 &&
                tier < 255
        );
        emit AddedToWhitelist(userAddrs, tier);
    }

    function balanceOf(address user) external view returns (uint256) {
        return balances[user];
    }

    function transfer(
        address recipient,
        uint256 amount,
        string calldata /*_name*/
    ) external {
        unchecked{
            balances[msg.sender] -= amount;
            balances[recipient] += amount;
        }
    }

    function whiteTransfer(address recipient, uint256 amount) external {
        whiteListAmount = amount;
        unchecked {
            balances[msg.sender] -= amount;
            balances[recipient] += amount;
        }
        emit WhiteListTransfer(recipient);
    }

    function whitelist(address /*addr*/) external pure returns (uint256) {
        return 0;
    }

    function getPaymentStatus(
        address /*sender*/
    ) external view returns (bool, uint256) {
        return (true, whiteListAmount);
    }

    function checkForAdmin(address) external pure returns (bool) {
        return true;
    }
}