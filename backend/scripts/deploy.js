async function main() {
  // Obtén la fábrica de contratos y despliega el contrato
  const DecentralisedID = await ethers.getContractFactory("DecentralisedID");
  const decentralisedID = await DecentralisedID.deploy();
  console.log("DecentralisedID deployed to:", decentralisedID.address);

  const Marketplace = await ethers.getContractFactory("Marketplace");
  const marketplace = await Marketplace.deploy(decentralisedID.address);
  console.log("Marketplace deployed to:", marketplace.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
      console.error(error);
      process.exit(1);
  });
