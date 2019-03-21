var DataSaver = artifacts.require("./DataSaver.sol");

module.exports = function(deployer) {
  deployer.deploy(DataSaver);
};
