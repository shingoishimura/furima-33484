window.addEventListener('load', function(){

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    
    addTaxPrice = inputValue*0.1
    
    if (addTaxPrice < 1){

    addTaxPrice = 0
    }

    else { 

    }

    addTaxDom.innerHTML = addTaxPrice
  

    const profitPrice = document.getElementById("profit");
    profitPrice.innerHTML = inputValue - addTaxPrice
    
})})