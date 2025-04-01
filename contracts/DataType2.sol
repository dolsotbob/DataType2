// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DataType2 {
    string private message = "Hello, Solidity!";
    uint256[] private numbers;
    string[] private names;
    struct User {
        string name;
        uint256 age;
    }

    function getMessage() public view returns (string memory) {
        return message;
    }

    function setMessage(string memory _message) public {
        message = _message;
    }

    function getNumbers() public view returns (uint256[] memory) {
        return numbers;
    }

    function addNumber(uint256 _number) public {
        numbers.push(_number);
    }

    function getNumber(uint256 _index) public view returns (uint256) {
        require(_index < numbers.length, "Index out of bounds");
        return numbers[_index];
    }

    function getNames() public view returns (string[] memory) {
        return names;
    }

    function addName(string memory _name) public {
        names.push(_name);
    }

    mapping(address => uint256) private balances;
    mapping(address => User) private users;

    function setBalance(address _address, uint256 _balance) public {
        balances[_address] = _balance;
    }

    function getBalance(address _address) public view returns (uint256) {
        return balances[_address];
    }

    function setUser(
        address _address,
        string memory _name,
        uint256 _age
    ) public {
        users[_address] = User(_name, _age);
    }
}
