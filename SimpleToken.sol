// SPDX-License-Identifier: GPL-2.0

pragma solidity ^0.8.0;

// written by: <robux@mail.ru>

contract SimpleToken {
    address public owner;

    event Paid(address _from, uint _amount, uint _timestamp);

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {
        pay();
    }

    function pay() public payable {
        emit Paid(msg.sender, msg.value, block.timestamp);
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function getContractAddress() public view returns(address) {
        return address(this);
    }

    function withdraw() external {
        require(msg.sender == owner, "Must be owner!");
        require(address(this).balance>0, "Empty balance!");
        //address payable _to = payable(owner)
        //_to.transfer(address(this).balance);
        payable(owner).transfer(address(this).balance);
    }

}
