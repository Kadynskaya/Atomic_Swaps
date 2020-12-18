const HTLC = artifacts.require("HTLC");

module.exports = function (deployer) {
  const _digest = "0x2e99758548972a8e8822ad47fa1017ff72f06f3ff6a016851f45c398732bc50c";
  const _dest = "0x000086998B2Ae5a51862fA496fe07FD525812357";
  
  deployer.deploy(HTLC, _digest, _dest);
};