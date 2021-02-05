window.addEventListener('load', function(){

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    
    addTaxPrice = Math.floor(inputValue*0.1)

    addTaxDom.innerHTML = addTaxPrice
  

    const profitPrice = document.getElementById("profit");
    profitPrice.innerHTML = Math.floor(inputValue - addTaxPrice)
    
})})
