// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OrganicFoodTraceability {
    // Define the structure of an organic product
    struct OrganicProduct {
        address producer;
        string productName;
        bool isCertified;
    }

    // Mapping to store organic products
    mapping(uint256 => OrganicProduct) public organicProducts;
    uint256 public productCount;

    // Event to log product registration
    event ProductRegistered(uint256 productId, address producer, string productName, bool isCertified);

    // Modifier to ensure only producers can perform certain actions
    modifier onlyProducer() {
        require(msg.sender == tx.origin, "Only producers can perform this action");
        _;
    }

    // Register an organic product
    function registerOrganicProduct(string memory _productName, bool _isCertified) public onlyProducer {
        productCount++;
        organicProducts[productCount] = OrganicProduct({
            producer: msg.sender,
            productName: _productName,
            isCertified: _isCertified
        });
        
        emit ProductRegistered(productCount, msg.sender, _productName, _isCertified);
    }

    // Verify the authenticity of an organic product
    function verifyOrganicProduct(uint256 _productId) public view returns (bool) {
        require(_productId <= productCount, "Product does not exist");
        return organicProducts[_productId].isCertified;
    }
}
