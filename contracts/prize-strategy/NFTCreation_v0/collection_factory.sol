pragma solidity ^0.6.0;

import "../../node_modules/openzeppelin-solidity/contracts/access/Ownable.sol";
import "./Interface/ICollection_Factory.sol";
import "./collection.sol";

contract Collection_Factory is Ownable {
    mapping(address => address) internal collectionowner;
    address[] public collections;

    /** =================== mutative function =================== */
    function create(
        string memory _name,
        string memory _symbol,
        string memory _baseuri,
        address owner
    ) external returns (address) {
        require( owner != address(0), "you must set a address");
        Collection collectionaddress = new Collection(_name,_symbol,_baseuri,owner);
        collectionowner[address(collectionaddress)] = owner;
        collections.push(address(collectionaddress));
        emit createNFT( _name, _symbol, address(collectionaddress));
        return address(collectionaddress);
    }


    /** =================== view =================== */
    function getlength() external view returns (uint){
        return collections.length;
    }

    function getcollection(address nftaddress) external view returns (address) {
        return collectionowner[nftaddress];
    }


    /** =================== event =================== */
    event createNFT(string indexed name, string indexed symbol,address indexed collectionaddress);

}
