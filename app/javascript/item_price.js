window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  // console.log(priceInput);
  priceInput.addEventListener("input", () => {
  //  console.log("イベント発火");
    const inputValue = priceInput.value; 
    console.log(inputValue);
    const addTaxDom = document.getElementById("add-tax-price");
    let taxRate = 0.1;
    addTaxDom.innerHTML = Math.floor(inputValue * taxRate)
    const addProfitDom = document.getElementById("profit");
    let profitRate = 1 - taxRate;
    addProfitDom.innerHTML = Math.floor(inputValue * profitRate)
  });
});