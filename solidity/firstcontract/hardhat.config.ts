import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";

const config: HardhatUserConfig = {
  solidity: "0.8.24",
  defaultNetwork: "sepolia",
  networks: {
    hardhat: {},
    sepolia: {
      url: "https://eth-mainnet.g.alchemy.com/v2/RlIaw-tIBTgeraxwU7bu0azSs50B5mei/getNFTs/?owner=vitalik.eth",
      accounts: ["4f1a1a36b7524f8ca634d44e7e7a2231730571aa8e2bf2a9c2e0111929bcfc02"],
    },
  },
};

export default config;
