window.addEventListener('load', () => {
  //販売価格の情報取得
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

  
  //販売手数料の表示
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor(inputValue * 0.1);

  //販売利益
  const salesProfit = document.getElementById("profit")
  salesProfit.innerHTML =  Math.floor(inputValue - addTaxDom.innerHTML);

  })
});