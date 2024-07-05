
window.addEventListener('turbo:load', () => {
   // Price input auto-calculation
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
   }
  // Image click event to navigate to the show page
   document.querySelectorAll('.item-img').forEach(function(img) {
    img.addEventListener('click', function() {
      var itemId = img.dataset.id;
      window.location.href = '/items/' + itemId;
    });
  });
});
