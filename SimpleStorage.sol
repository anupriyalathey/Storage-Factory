//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract SimpleStorage {
    // Basic data types- boolean, uint, int, address, bytes

    //same as uint256 favouriteNumber =0 (Default value)
    uint256 favouriteNumber;

    mapping(string => uint256) public nameToFavouriteNumber;

    struct People {
        uint256 favouriteNumber;
        string name;
    }

    //uint256[] public favouriteNumbersList;
    People[] public people;

    function store(uint256 _favouriteNumber) public {
        favouriteNumber = _favouriteNumber;
    }

    //view, pure fn don't spend gas unless called from a fn which spends gas
    //view only to read state(not modify) from contract
    //pure doesn't even read

    function retrieve() public view returns (uint256) {
        return favouriteNumber;
    }

    // function add() public pure returns (uint256) {
    //     return(1+1);
    // }

    function addPerson(string memory _name, uint256 _favouriteNumber) public {
        people.push(People(_favouriteNumber, _name));
        nameToFavouriteNumber[_name] = _favouriteNumber;
    }
}
