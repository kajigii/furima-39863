function sales(){
  
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    //手数料率
    const commissionRate = 0.1;
    //販売手数料の計算
    const commission = Math.floor(inputValue * commissionRate);
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = `${commission}`;
    //販売利益
    const profit = inputValue - commission;
    const profitElement = document.getElementById("profit");
    profitElement.innerHTML = `${profit}`;
  });
}

window.addEventListener('turbo:load',  sales)


