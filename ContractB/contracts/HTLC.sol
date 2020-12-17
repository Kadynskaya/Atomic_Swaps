// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

contract HTLC {    
    string public version = "0.0.1";
    bytes32 public digest = 0x2e99758548972a8e8822ad47fa1017ff72f06f3ff6a016851f45c398732bc50c;
    address payable public dest = 0x000086998B2Ae5a51862fA496fe07FD525812357;
    uint public timeOut = block.timestamp + 10 minutes;
    address payable issuer = msg.sender; 

    modifier onlyIssuer {require(msg.sender == issuer); _; }
  
    function claim(string memory _hash) public returns(bool result) {
       require(digest == sha256(abi.encodePacked(_hash)));
       selfdestruct(dest);
       return true;
       }
    
    receive() external payable {}

    function refund() onlyIssuer public returns(bool result) {
        require(block.timestamp >= timeOut);
        selfdestruct(issuer);
        return true;
    }
}
