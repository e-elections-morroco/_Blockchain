// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Person {
    struct UserInfo {
        string firstName;
        string lastName;
        string birthDate;
        string CIN;
        string email;
        string ville;
        string phone;
    }
    mapping(address => UserInfo) public users;
    address[] public userAddresses; // Ajout d'une liste des adresses des utilisateurs

    function setUser(address _userAddress, string memory _firstName, string memory _lastName, string memory _birthDate, string memory _cin, string memory _email, string memory _ville, string memory _phone) public {
        require(_userAddress != address(0), "Invalid user address");
        users[_userAddress] = UserInfo(_firstName, _lastName, _birthDate, _cin, _email, _ville, _phone);
        userAddresses.push(_userAddress); // Ajout de l'adresse de l'utilisateur à la liste
    }

    function getUserByAddress(address _userAddress) public view returns (string memory, string memory, string memory, string memory, string memory, string memory, string memory) {
        require(_userAddress != address(0), "Invalid user address");
        UserInfo memory user = users[_userAddress];
        return (user.firstName, user.lastName, user.birthDate, user.CIN, user.email, user.ville, user.phone);
    }

    function getUserByCinAndDateOfBirth(string memory _cin, string memory _dateOfBirth) public view returns (string memory, string memory, string memory, string memory, string memory, string memory, string memory) {
        for (uint256 i = 0; i < userAddresses.length; i++) {
            UserInfo memory user = users[userAddresses[i]];
            if (keccak256(abi.encodePacked(user.CIN)) == keccak256(abi.encodePacked(_cin)) && keccak256(abi.encodePacked(user.birthDate)) == keccak256(abi.encodePacked(_dateOfBirth))) {
                return (user.firstName, user.lastName, user.birthDate, user.CIN, user.email, user.ville, user.phone);
            }
        }
        revert("User not found with the provided CIN and date of birth");
    }
}
//0x010F1DabB6744d635DbE4C52469134Eb886c5B5b