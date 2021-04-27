pragma solidity 0.5.1;

import "./Storage.sol";

contract Cats is Storage {

    function getNumberOfCats() public view returns(uint256) {
        return Storage.getNumber();
    }

    function setNumberOfCats(uint256 toSet) public {
        Storage.setNumber(toSet);
    }
}