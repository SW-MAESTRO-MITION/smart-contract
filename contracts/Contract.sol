pragma solidity ^0.4.18;

contract Contract {
    string date;

    event Instructor(
      string date
    );

    function set(string _date) public {
        date = _date;
        Instructor(_date);
    }

    function get() view public returns (string) {
        return date;
    }
}
