require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: {
    version: "0.8.26",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200,
      },
      viaIR: true,
    },
  },
  networks: {
    //PRIVATE_KEY=cd0992fd5580d0df845ab28f8f46af0c61516df0338bdbe89614460ef1aa695e
    //INFURA_API_KEY=cd8c6b77fc684a2a8250914a39fec346
    hardhat: {}, // Red local de Hardhat
    sepolia: {
      url: `https://sepolia.infura.io/v3/cd8c6b77fc684a2a8250914a39fec346`,
      accounts: ['0xcd0992fd5580d0df845ab28f8f46af0c61516df0338bdbe89614460ef1aa695e']
    }
  }
};