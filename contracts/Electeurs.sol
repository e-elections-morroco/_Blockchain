// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Electeur {
    struct ElecteurInfo {
        uint256 UID;
        uint256 voteCount;
    }

    mapping(uint256 => ElecteurInfo) public electeurs;
    uint256[] public electeurKeys;

    function setElecteur(uint256 _UID) public {
        electeurs[_UID] = ElecteurInfo(_UID, 0);
        electeurKeys.push(_UID); // Ajouter la clé du mapping aux clés des électeurs
    }

    function getElecteur(uint256 _UID) public view returns (uint256, uint256) {
        ElecteurInfo memory electeur = electeurs[_UID];
        return (electeur.UID, electeur.voteCount);
    }

    function getAllElecteurs() public view returns (ElecteurInfo[] memory) {
        uint256 totalElecteurs = electeurKeys.length;
        ElecteurInfo[] memory allElecteurs = new ElecteurInfo[](totalElecteurs);
        
        for (uint256 i = 0; i < totalElecteurs; i++) {
            allElecteurs[i] = electeurs[electeurKeys[i]];
        }
        
        return allElecteurs;
    }

    function vote(uint256 _UID) public {
    electeurs[_UID].voteCount++;
}

}


//0x6D035E1d21D20454f4dAeC9672f5cEDee56ebF0a