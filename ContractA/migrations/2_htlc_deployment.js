const HTLC = artifacts.require("HTLC");

module.exports = function (deployer) {
  const _digest = "0x2e99758548972a8e8822ad47fa1017ff72f06f3ff6a016851f45c398732bc50c";
  const _dest = "0xa3Cea76EB5cb584f6Db76294fA7d214eEFA1d2Ac";

  deployer.deploy(HTLC, _digest, _dest);
};