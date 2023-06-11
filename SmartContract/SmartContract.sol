// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OilSuppliess {
    // Structure to store  information
    struct Supplier {
        string name;
        uint buyerCount;
    }

    // Array of suppliers
    Supplier [] public suppliers;

    // Mapping to keep track of whether an address has already supplied
    mapping(address => bool) public hasBuyer;

    // Function to add a new OilSupplier
    function addSupplier(string memory name) public {
        suppliers.push(Supplier(name, 0));
    }

    // Function to issue an oil contract to an oil supplier
    function oilContractIssued(uint supplierId) public {
        // Check that the sender has not already issuedcontract
        require(!hasBuyer[msg.sender], "You have already issued oil contract with supplier");

        // Check that the supplier ID is valid
        require(supplierId >= 0 && supplierId < suppliers.length, "Invalid OilSupplierID");

        // Increment the buyers count and mark the sender as having contract with supplier
        suppliers[supplierId].buyerCount++;
        hasBuyer[msg.sender] = true;
    }

    // Function to get the name and count of a buyer
    function getSupplier(uint supplierId) public view returns (string memory, uint) {
        return (suppliers[supplierId].name, suppliers[supplierId].buyerCount);
    }
}
