// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SupplyChain {
    enum State { Created, InTransit, Delivered }

    struct Product {
        uint id;
        string name;
        State state;
    }

    mapping(uint => Product) public products;
    uint public productCounter;

    event StateChanged(uint id, State state);

    function createProduct(string memory name) public {
        productCounter++;
        products[productCounter] = Product(productCounter, name, State.Created);
        emit StateChanged(productCounter, State.Created);
    }

    function updateState(uint id, State state) public {
        require(id <= productCounter, "Invalid product ID");
        products[id].state = state;
        emit StateChanged(id, state);
    }
}
