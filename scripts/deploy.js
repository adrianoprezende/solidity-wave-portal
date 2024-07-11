const { ethers } = require("hardhat");

const main = async () => {
    let provider = ethers.getDefaultProvider();
    const [deployer] = await ethers.getSigners();
    const accountBalance = await provider.getBalance(deployer.address);
  
    console.log("Deploying contracts with account: ", deployer.address);
    console.log("Account balance: ", accountBalance.toString());
  
    const waveContract = await ethers.deployContract("WavePortal", { value: hre.ethers.parseEther('0.001') });
    await waveContract.waitForDeployment();
  
    console.log("WavePortal address: ", waveContract.target);
  };
  
  main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });