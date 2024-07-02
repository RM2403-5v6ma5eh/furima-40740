
window.addEventListener('turbo:load', () => {
   const priceInput = document.getElementById("item-price");
      if (priceInput) {
        priceInput.addEventListener("input", (event) => {
          const inputValue = priceInput.value;
          const addTaxDom = document.getElementById("add-tax-price");
          let taxRate = 0.1;
          addTaxDom.innerHTML = Math.floor(inputValue * taxRate)

          const addProfitDom = document.getElementById("profit");
          let profitRate = 1 - taxRate;
          addProfitDom.innerHTML = Math.floor(inputValue * profitRate)

        });
      } else {
        console.log("Price input element not found.")
      }
});
