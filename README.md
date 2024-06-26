# Ethereum Voting System

This repository contains smart contracts for an Ethereum-based voting system. The system consists of two contracts: `User` and `Electeur`.

## Contracts

### User Contract

The `User` contract manages user information and their voting status. Each user is represented by a unique Ethereum address and can be associated with the following information:
- First name
- Last name
- Date of birth
- National ID (CIN)
- Email
- City (ville)
- Phone number
- Voting status

#### Functions

- `setUser`: Allows the registration of a new user with their information.
- `getUserByAddress`: Retrieves user information by Ethereum address.
- `getUserByCinAndDateOfBirth`: Retrieves user information by national ID (CIN) and date of birth.
- `vote`: Marks a user as voted, preventing multiple votes.

### Electeur Contract

The `Electeur` contract manages the electoral process and tracks the number of votes cast by each elector. Each elector is represented by a unique identifier (UID).

#### Functions

- `setElecteur`: Registers a new elector.
- `getElecteur`: Retrieves elector information by UID.
- `getAllElecteurs`: Retrieves information about all registered electors.
- `vote`: Records votes cast by electors.

## Usage

1. Deploy both contracts on an Ethereum-compatible blockchain network (e.g., Ropsten, Rinkeby, or a local development network like Ganache).
2. Interact with the contracts using a compatible Ethereum wallet or through a web3-enabled application.
3. Users can be registered using the `setUser` function of the `User` contract.
4. Electors can be registered using the `setElecteur` function of the `Electeur` contract.
5. Once registered, users can cast their votes using the `vote` function of both contracts.

## Deployment

1. Deploy the `User` contract by providing the necessary constructor parameters.
2. Deploy the `Electeur` contract by providing the necessary constructor parameters.
3. Interact with the deployed contracts through their respective addresses.

## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests for any improvements or new features you'd like to see.

## License

This project is licensed under the [MIT License](LICENSE).
