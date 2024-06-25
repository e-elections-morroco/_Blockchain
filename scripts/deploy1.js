const { ethers } = require("hardhat");


async function main() {
  const [deployer] = await ethers.getSigners();
  console.log(`Deploying contracts with the account: ${deployer.address}`);
  const MyToken = await ethers.getContractFactory("User");
  const myToken = await MyToken.deploy();

  // Wait for the deployment to be confirmed
  await myToken.waitForDeployment();

  console.log(`Simple deployed to: ${myToken.target}`);
}

main().catch((error) => {
  console.error("Error deploying Simple:", error);
  process.exitCode = 1;
});


// 0x862F1e39D737b822877B42757AD26986D4C69e22