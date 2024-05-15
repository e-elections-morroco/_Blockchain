const { ethers } = require("hardhat");


async function main() {
  const [deployer] = await ethers.getSigners();
  console.log(`Deploying contracts with the account: ${deployer.address}`);
  const MyToken = await ethers.getContractFactory("Electeur");
  const myToken = await MyToken.deploy();

  // Wait for the deployment to be confirmed
  await myToken.waitForDeployment();

  console.log(`Simple deployed to: ${myToken.target}`);
}

main().catch((error) => {
  console.error("Error deploying Simple:", error);
  process.exitCode = 1;
});


//0x6D035E1d21D20454f4dAeC9672f5cEDee56ebF0a