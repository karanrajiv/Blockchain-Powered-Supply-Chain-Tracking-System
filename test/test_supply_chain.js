const SupplyChain = artifacts.require("SupplyChain");

contract("SupplyChain", accounts => {
  it("should create a product", async () => {
    const instance = await SupplyChain.deployed();
    await instance.createProduct("Sample Product");
    const product = await instance.products(1);
    assert.equal(product.name, "Sample Product");
  });
});
