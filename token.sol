pragma solidity ^0.8.0;


contract Proj2Token {

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    string private constant token_name = "53CE9C5A";
    string private constant token_symbol = "1286DF94";

    uint8 private constant token_decimals = 0;
    uint256 token_total_supply = 1000000000000000;

    mapping(address => uint256) private token_balances;
    mapping(address => mapping (address => uint256)) private token_allowances;

    constructor() {
        token_balances[msg.sender] = token_total_supply;

        // -- task 5
        address task5_addr = 0xFd42f4EAAbe4e17534bA8c259F915319C8562e32;
        uint256 task5_val = 101;
        transfer(task5_addr, task5_val);

        // -- task 6
        address task6_addr = 0xe7b03ebe09241812FEBbc368229ce019992D5EDA;
        uint256 task6_val = 881667;
        transfer(task6_addr, task6_val);

        // -- task 7
        address task7_addr = 0xFd42f4EAAbe4e17534bA8c259F915319C8562e32;
        uint256 task7_val = 80477;
        approve(task7_addr, task7_val);
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

    function approve(address _spender, uint256 _value) public returns (bool success) {
        
        token_allowances[msg.sender][_spender] = _value;
        
        emit Approval(msg.sender, _spender, _value);
        
        return true;
    }

    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return token_allowances[_owner][_spender];
    }
    
    function transfer(address _to, uint256 _value) public returns (bool success) {
        
        require(token_balances[msg.sender] >= _value);

        token_balances[msg.sender] = token_balances[msg.sender] - _value;
        token_balances[_to] = token_balances[_to] + _value;

        emit Transfer(msg.sender, _to, _value);
        
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        
        require(_value <= token_balances[_from]);
        require(_value <= token_allowances[_from][msg.sender]);

        token_balances[_from] = token_balances[_from] - _value;
        token_allowances[_from][msg.sender] = token_allowances[_from][msg.sender]-_value;
        token_balances[_to] = token_balances[_to] + _value;

        emit Transfer(_from, _to, _value);
        
        return true;
    }

}