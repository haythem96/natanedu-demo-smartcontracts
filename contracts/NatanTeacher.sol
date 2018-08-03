pragma solidity ^0.4.4;


import "openzeppelin-solidity/contracts/math/SafeMath.sol";
import "./utils/Control.sol";

contract NatanTeacher is Control {

    struct structTeacher {
        string firstName;
        string lastName;
        string region;
        string topic;
    }

    mapping(address => bool) whiteListed;
    mapping(address => bool) blackListed;
    
    constructor() {
        // constructor
    }

    /**
    * @dev function to whitelist a teacher
    * @param _teacherAdd address of teacher
    */
    function whiteList(address _teacherAdd) public onlyOwner {
        require(_teacherAdd != address(0), "Invalid address");
        whiteListed[_teacherAdd] = true;
    }

    /**
    * @dev function to blacklist a teacher
    * @param _teacherAdd address of teacher
    */
    function blackList(address _teacherAdd) public onlyOwner {
        require(_teacherAdd != address(0), "Invalid address");
        blackListed[_teacherAdd] = true;
    }

}
