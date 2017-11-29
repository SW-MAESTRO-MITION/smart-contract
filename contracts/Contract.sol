pragma solidity ^0.4.18;

contract Owned {
    address public owner;

    function Owned() public {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address newOwner) public onlyOwner {
        owner = newOwner;
    }

    function getOwner() public constant returns (address) {
        return owner;
    }
}

contract Contract is Owned {
  struct File {
    string name;
    string date;
    uint size;
  }

  mapping(string => File) private files;
  event UploadFile(string hash, File file);

  function setFile(string date, string hash, string name, uint size) onlyOwner public {
    require(size > 0);

    File memory file = File(name, date, size);
    files[hash] = file;
    UploadFile(hash, file);
  }

  function getFile(string hash) view public returns (string, string, uint) {
    return (files[hash].name, files[hash].date, files[hash].size);
  }
}
