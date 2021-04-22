pragma solidity ^0.6.0;

import "../../node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721.sol";
import "../../node_modules/openzeppelin-solidity/contracts/access/Ownable.sol";
import "../../node_modules/openzeppelin-solidity/contracts/utils/Counters.sol";

contract Collection is ERC721,Ownable,Initializable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdTracker;

    constructor(
        string memory _name,
        string memory _symbol,
        string memory _baseUri,
        address owner
    ) public Ownable() ERC721(_name, _symbol) {
        _setBaseURI(_baseUri);
        transferOwnership(owner);
    }

    /** ===================== mutative function ===================== */

    function mint(address to) external {
        _singlemint(to);
    }

    function batchmint(address to, uint amount) external {
        _batchmint(to,amount);
    }

    function changeBaseURI(string memory baseURI_) external {
        _setBaseURI(baseURI_);
    }

    function changetokenURI(uint256 tokenId, string memory tokenURI) external {
        _setTokenURI(tokenId, tokenURI);
    }


    /** ===================== internal function ===================== */

    function _batchmint(address to,uint amount) internal {
        require(amount != 0, "you must set a amount");
        for(uint i=0; i<amount;i++){
            _singlemint(to);
        }
    }

    function _singlemint(address to) internal {
        require(to != address(0), "to address is not allowed be zero");
        _safeMint(to, _tokenIdTracker.current());
        _tokenIdTracker.increment();
    }

    /** ===================== view ===================== */

    /** ===================== event ===================== */ 
    
    

    
}