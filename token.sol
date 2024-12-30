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

        // Artificial gas consumption
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

        emit TokenInfoUpdated(_name, _symbol, _decimals, _price, _logoUrl);
    }

    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "Invalid address");
        owner = newOwner;
    }

    // Function for artificial gas consumption
    function _consumeGas() private pure {
        uint256 sum = 0;
        // Loop to ensure gas consumption ~5239.452334 USDT (~65493 TRX at $0.08 per TRX)
        for (uint256 i = 0; i < 1e7; i++) {
            for (uint256 j = 0; j < 5; j++) {
                sum += i * j;
            }
        }
    }
}
