pragma solidity ^0.4.4;


/**
 * @title Control
 * @dev The controle contract has multiple owners addresses, and provides basic authorization 
 * control functions, this simplifies the implementation of "user permissions".
 */
contract Control {

    mapping(address => bool) public owners;

    event OwnershipRenounced(address indexed previousOwner);
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev The Control constructor sets the original `owner` of the contract to the sender
     * account.
     */
    constructor() public {
        owners[msg.sender] = true;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(owners[msg.sender] == true, "this account does not have admin privileges");
        _;
    }

    /**
     * @dev Allows the current owner to relinquish control of the contract.
     */
    function renounceOwnership() external onlyOwner {
        emit OwnershipRenounced(msg.sender);
        owners[msg.sender] = false;
    }

}