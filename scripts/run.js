const main = async () => {
    const [owner, randomPerson] = await hre.ethers.getSigners();
    const waveContract = await hre.ethers.deployContract("WavePortal", { value: hre.ethers.parseEther('0.1') });
    await waveContract.waitForDeployment();
    console.log("Contract deployed to:", waveContract.target);
    console.log("Contract deployed by:", owner.address);

    await doCheckContractBalance(waveContract);

    let waveCount;
    waveCount = await waveContract.getTotalWaves();

    let waveTxn = await waveContract.wave("Uma mensagem!");
    await waveTxn.wait(); // aguarda a transação ser minerada

    await doCheckContractBalance(waveContract);

    waveCount = await waveContract.getTotalWaves();

    waveTxn = await waveContract.connect(randomPerson).wave("Outra mensagem!");
    await waveTxn.wait(); // aguarda a transação ser minerada

    await doCheckContractBalance(waveContract);

    waveCount = await waveContract.getTotalWaves();

    waveTxn = await waveContract.connect(randomPerson).wave("Mais uma mensagem!");
    await waveTxn.wait(); // aguarda a transação ser minerada

    await doCheckContractBalance(waveContract);

    waveCount = await waveContract.getTotalWaves();

    let allWaves = await waveContract.getAllWaves();
    console.log(allWaves);
  };
  
  main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });

/*
* Consulta saldo do contrato
*/
async function doCheckContractBalance(waveContract) {
  let contractBalance = await hre.ethers.provider.getBalance(waveContract.target);
  console.log("Saldo do contrato:", hre.ethers.formatEther(contractBalance));
}
