// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract User {
    struct UserInfo {
        string firstName;
        string lastName;
        string birthDate;
        string CIN;
        string email;
        string ville;
        string phone;
        bool isVoted; // Variable indiquant si l'utilisateur a déjà voté
    }

    mapping(address => UserInfo) public users;
    address[] public userAddresses;

    function setUser(address _userAddress, string memory _firstName, string memory _lastName, string memory _birthDate, string memory _cin, string memory _email, string memory _ville, string memory _phone) public {
        require(_userAddress != address(0), "Invalid user address");
        users[_userAddress] = UserInfo(_firstName, _lastName, _birthDate, _cin, _email, _ville, _phone, false);
        userAddresses.push(_userAddress);
    }

    function getUserByAddress(address _userAddress) public view returns (string memory, string memory, string memory, string memory, string memory, string memory, string memory, bool isVoted) {
        require(_userAddress != address(0), "Invalid user address");
        UserInfo memory user = users[_userAddress];
        return (user.firstName, user.lastName, user.birthDate, user.CIN, user.email, user.ville, user.phone ,user.isVoted);
    }
    function getUserByCinAndDateOfBirth(string memory _cin, string memory _dateOfBirth) public view returns (string memory, string memory, string memory, string memory, string memory, string memory, string memory , bool isVoted) {
        for (uint256 i = 0; i < userAddresses.length; i++) {
            UserInfo memory user = users[userAddresses[i]];
            if (keccak256(abi.encodePacked(user.CIN)) == keccak256(abi.encodePacked(_cin)) && keccak256(abi.encodePacked(user.birthDate)) == keccak256(abi.encodePacked(_dateOfBirth))) {
                return (user.firstName, user.lastName, user.birthDate, user.CIN, user.email, user.ville, user.phone , user.isVoted);
            }
        }
        revert("User not found with the provided CIN and date of birth");
    }

    function vote(address _userAddress) public {
    UserInfo storage user = users[_userAddress];
    require(!user.isVoted, "User already voted");
    user.isVoted = true;
}

}

//0xfa0d7dA8D1024D4b411C0f55B635c171F7ab9DD5