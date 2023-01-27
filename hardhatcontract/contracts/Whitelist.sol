// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

contract Whitelist {
    uint8 public maxWhitelistedAddresses;

    mapping(address => bool) public whitelistedAddresses;

    uint8 public numAddressesWhitelisted;

    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    function addAddressToWhitelist() public {
        require(
            !whitelistedAddresses[msg.sender],
            "Sender has Aready been Whitelisted!"
        );

        require(
            numAddressesWhitelisted < maxWhitelistedAddresses,
            "More addresses cannot be added, limit reachead"
        );

        whitelistedAddresses[msg.sender] = true;

        numAddressesWhitelisted++;
    }
}
