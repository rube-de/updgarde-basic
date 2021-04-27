pragma solidity 0.5.1;

import "./Storage.sol";

contract CatsProxy is Storage {

    address public currentAddress;

    constructor(address _currentAddress) public {
        currentAddress = _currentAddress;
    }

    function upgrade(address _currentAddress) public {
        currentAddress = _currentAddress;
    }

    function getNumberOfCats() public returns (bool, bytes memory){
        (bool res, bytes memory data) = currentAddress.delegatecall(abi.encodePacked(bytes4(keccak256("getNumberOfCats()"))));
        return (res, data);
    }
    function setNumberOfCats(uint256 _number) public returns (bool, bytes memory){
        (bool res, bytes memory data) = currentAddress.delegatecall(abi.encodePacked(bytes4(keccak256("setNumberOfCats(uint256)")), _number));
        return (res, data);
    }
}