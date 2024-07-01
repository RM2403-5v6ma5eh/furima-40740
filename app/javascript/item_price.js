
window.addEventListener('turbo:load', () => {
   console.log("イベント発火vv");
   const priceInput = document.getElementById("item-price");
   //    console.log(priceInput);
      if (priceInput) {
        priceInput.addEventListener("input", (event) => {
   //   console.log("イベント発火");
          const inputValue = priceInput.value;
   //     console.log(inputValue);

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
