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
    bytes private dynamicData;
    bytes32 private fixedData =
        0xabcdef1234560000000000000000000000000000000000000000000000000000;

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

    function getUser(
        address _address
    ) public view returns (string memory, uint256) {
        if (
            bytes(users[_address].name).length == 0 && users[_address].age == 0
        ) {
            return ("", 0); //기본값 반환
        }
        return (users[_address].name, users[_address].age);
    }

    function setDynamicData(bytes memory _dynamicData) public {
        dynamicData = _dynamicData;
    }

    function getDynamicData() public view returns (bytes memory) {
        return dynamicData;
    }

    function setFixedData(bytes32 _fixedData) public {
        fixedData = _fixedData;
    }

    function getFixedData() public view returns (bytes32) {
        return fixedData;
    }

    function getDetails()
        public
        view
        returns (
            string memory,
            uint256[] memory, //배열은 참조형이라 memory 붙임
            string[] memory,
            bytes32,
            bytes memory
        )
    {
        return (message, numbers, names, fixedData, dynamicData);
    }
}
