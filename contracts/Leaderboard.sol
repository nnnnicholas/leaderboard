// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Address.sol";


/**
 * @title Leaderboard
 * @dev Receive ETH and associate contributions with contract addresses.
 */
contract Leaderboard is Ownable{

    mapping(address => uint256) attention;

    event attentionDrawnTo(address focus, uint256 amount);
    /**
     * @dev Store cumulative value in attention mapping
     * @param focus to pay attention to
     */
    function payAttention(address focus) external payable{
        attention[focus] += msg.value;
        emit attentionDrawnTo(focus, msg.value);
    }

    /**
     * @dev Retrieve attention paid to a given address
     * @return attention measured in wei
     */
    function retrieve(address focus) external view returns (uint256){
        return attention[focus];
    }

    function withdraw() external payable onlyOwner{
        uint256 balance = address(this).balance;
        require(balance > 0, 'Contract contains no ETH');
        address payable owner = payable(owner());
        (bool success, ) = owner.call{value: msg.value}("");
        require(success, "Failed to send Ether");
    }

    function withdrawTo(address payable _to, uint _amount) public {
        (bool success, ) = _to.call{value: _amount}("");
        require(success, "Failed to send Ether");
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    receive() external payable{}
    fallback() external payable{}

}