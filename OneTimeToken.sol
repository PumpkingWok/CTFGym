pragma solidity ^0.5.0;

/**
 * @title OneTimeToken
 * @dev The OneTimeToken (OTT) contract has both owner and tokenOwner address, it
 * provides the way to request a temporary token (access) for a fixed time.
 */

contract OneTimeToken {

    address private _owner;
    address private _tokenOwner;
    uint public _minuteToWait;
    uint public _startTime;

    constructor() internal {
        _owner = msg.sender;
        _tokenOwner = address(0);
        _minuteToWait = 15 * 1 minutes;
        _startTime = now;
    }

    /**
     * @return the address of the token owner.
     */
    function tokenOwner() public view returns(address) {
        return _tokenOwner;
    }

    /**
     * @return the address of the contract owner.
     */
    function contractOwner() public view returns(address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the tokenOwner.
     */
    modifier onlyTokenOwner() {
        require(isTokenOwner());
        _;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(isOwner());
        _;
    }

    /**
     * @dev Change minutes to wait for request a new token access.
     */
    function setMinutesToWait(uint minuteToWait) public onlyOwner {
        _minuteToWait = minuteToWait * 1 minutes;
    }

    /**
     * @return true if `msg.sender` is the owner of the token access.
     */
    function isTokenOwner() public view returns(bool) {
        return msg.sender == _tokenOwner;
    }

    /**
     * @return true if `msg.sender` is the owner of the contract.
     */
    function isOwner() public view returns(bool) {
        return msg.sender == _owner;
    }

    /**
     * @dev Request new token access if it is free or expired.
     */
    function requestTokenOwner() public {
        require((_tokenOwner == address(0)) || (now > _startTime + _minuteToWait));
        _tokenOwner = msg.sender;
        _startTime = now;
    }

    /**
     * @dev Release the token access.
     */
    function releaseTokenOwner() public onlyTokenOwner {
        _tokenOwner = address(0);
    }

}
