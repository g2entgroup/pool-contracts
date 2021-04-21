interface ICollection_Factory {
    function create(string memory name, string memory symbol, string baseURI, address owner) external returns (address);

    function getcollection(address owner) external view returns (address);

    function getlength() external view returns (uint);
    
}