// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BookRoom {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    struct Room {
        uint roomId;
        bool isOccupied;
        address occupant;
        uint timeUntilBooked;
    }

    mapping(uint => Room) public rooms;

    event RoomBooked(uint roomId, address occupant, uint timeUntilBooked);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    function bookRoom(uint roomId, uint nights) public payable {
        require(!rooms[roomId].isOccupied || block.timestamp >= rooms[roomId].timeUntilBooked, "Room is occupied");

        rooms[roomId].isOccupied = true;
        rooms[roomId].occupant = msg.sender; 
        rooms[roomId].timeUntilBooked = block.timestamp + (nights * 1 days);

        emit RoomBooked(roomId, msg.sender, rooms[roomId].timeUntilBooked);
    }
}