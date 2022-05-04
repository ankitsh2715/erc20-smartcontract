// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// interface ERC20Token {
//     function name() external view returns (string memory);
//     function symbol() external view returns (string memory);
//     function decimals() external view returns (uint8);
//     function totalSupply() external view returns (uint256);
//     function balanceOf(address _owner) external view returns (uint256 balance);
//     function transfer(address _to, uint256 _value) external returns (bool success);
//     function transferFrom(address _from, address _to, uint256 _value) external returns (bool success);
//     function approve(address _spender, uint256 _value) external returns (bool success);
//     function allowance(address _owner, address _spender) external view returns (uint256 remaining);
// }

contract Proj2Token {
    string private constant token_name = "53CE9C5A";
    string private constant token_symbol = "1286DF94";

    uint8 private constant token_decimals = 0;
    uint256 token_total_supply = 1000000000000000;

    mapping(address => uint256) private token_balances;
    mapping(address => mapping (address => uint256)) private token_allowances;

    constructor() {
        token_balances[msg.sender] = token_total_supply;

        // -- task 5
        // address task5_addr = 0xFd42f4EAAbe4e17534bA8c259F915319C8562e32;
        // uint256 task5_val = 101;
        // transfer(task5_addr, task5_val);

        // -- task 6
        // address task6_addr = 0xe7b03ebe09241812FEBbc368229ce019992D5EDA;
        // uint256 task6_val = 881667;
        // transfer(task6_addr, task6_val);
    }

    function name() public view returns (string memory) {
        return token_name;
    }

    function symbol() public view returns (string memory) {
        return token_symbol;
    }

    function decimals() public view returns (uint8) {
        return token_decimals;
    }

    function totalSupply() public view returns (uint256) {
        return token_total_supply;
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return token_balances[_owner];
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(token_balances[msg.sender] >= _value);

        return transferFrom(msg.sender, _to, _value);
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        //TODO
    }

}



