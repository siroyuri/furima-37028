function commission () {
  
  const itemPrice = document.getElementById("item-price")
  itemPrice.addEventListener('keyup', () => {
    const price = itemPrice.value
    const priceTax = Math.floor(price * 0.1)
    const priceProfit = Math.floor(price - priceTax)

    const tax = document.getElementById("add-tax-price")
    const profit = document.getElementById("profit")
    const taxLocaleString = priceTax.toLocaleString();
    const profitLocalString = priceProfit.toLocaleString();
    tax.innerHTML = `${taxLocaleString}`;
    profit.innerHTML = `${profitLocalString}`;
  });
};

window.addEventListener('load', commission);