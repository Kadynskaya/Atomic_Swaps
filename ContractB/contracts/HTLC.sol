// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

contract HTLC {    
    string public version = "0.0.1";
    bytes32 public digest;
    address payable public dest;
    uint public timeOut = block.timestamp + 10 minutes;
    address payable issuer = msg.sender; 

    constructor (bytes32 _digest, address payable _dest) public {
        digest = _digest;
        dest = _dest;
    }

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
