pragma solidity ^0.6.0;

import "@openzeppelin-solidity/contracts/toekn/ERC721/ERC721";
import "@openzeppelin-solidity/contracts/access/Ownable.sol";
import "@openzeppelin-solidity/contracts/utils/Counters.sol";
import "@openzeppelin-solidity/contracts/proxy/Initializable.sol";

contract NFT_test is ERC721,Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdTracker;

    constructor(
        string memory _name,
        string memory _symbol,
        string memory _baseUri
    ) public Ownable() ERC721(_name, _symbol) {
        setBaseURI(_baseUri);
    }

    /** ===================== mutative function ===================== */

    function mint(address to) external {
        _singlemint(to);
    }

    function batchmint(address to, uint amount) external {
        _batchmint(to,amount);
    }

    function changeBaseURI(string memory baseURI_) external {
        _setBaseURI(baseURL_);
    }

    function changetokenURI(uint256 tokenId, string memory tokenURI) external {
        _setTokenURI(tokenId, tokenURI);
    }

    function initialize(
        string memory name,
        string memory symbol,
        string memory baseUri,
        address owner
    ) external initializer() {
        _name = name;
        _symbol = symbol;
        setBaseURI(_baseUri);
        transferOwnership(owner);
    }

    /** ===================== internal function ===================== */

    function _batchmint(address to,uint amount) internal {
        require(amount != 0, "you must set a amount");
        for(i=0; i<amount;i++){
            _singlemint(to);
        }
    }

    function _singlemint(address to) external {
        require(to != address(0), "to address is not allowed be zero");
        _safeMint(to, _tokenIdTracker.current());
        _tokenIdTracker.increment();
    }

    /** ===================== view ===================== */

    /** ===================== event ===================== */ 
    
    

    
}