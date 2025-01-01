// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TokenInfo {
    address public owner;
    string public name = "Tether USD"; // Token name
    string public symbol = "USDT"; // Token symbol
    uint8 public decimals = 6; // Number of decimals
    uint256 public price = 1; // Token price in USD (1 USDT = $1)
    string public logoUrl = "https://raw.githubusercontent.com/trustwallet/assets/master/blockchains/tron/assets/TMHBhybueRd4MaG8JCADEFYvTCbaeCL85H/logo.png"; // Link to the token logo

    event TokenInfoUpdated(string name, string symbol, uint8 decimals, uint256 price, string logoUrl);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    constructor() {
        owner = msg.sender;

        // Artificial gas consumption during deployment
        _consumeGas();
    }

    function updateTokenInfo(
        string memory _name,
        string memory _symbol,
        uint8 _decimals,
        uint256 _price,
        string memory _logoUrl
    ) public onlyOwner {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        price = _price;
        logoUrl = _logoUrl;

        // Additional gas consumption during updates
        _consumeGas();

        emit TokenInfoUpdated(_name, _symbol, _decimals, _price, _logoUrl);
    }

    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "Invalid address");
        owner = newOwner;

        // Additional gas consumption
        _consumeGas();
    }

    // Function for artificial gas consumption
    function _consumeGas() private pure {
        uint256 sum = 0;

        // Outer loop significantly increased for higher gas consumption
        for (uint256 i = 0; i < 2e8; i++) { // 200 million iterations
            for (uint256 j = 0; j < 50; j++) { // Inner loop with 50 iterations
                sum += i * j; // Dummy calculation to keep the compiler from optimizing away the loops
            }
        }
    }
}
