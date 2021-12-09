const order = () => {
  Payjp.setPublicKey(process.env.FURIMA_PAYJP_PUBLIC_KEY);
  const button = document.getElementById("button");
  button.addEventListener('click', (e) => {
    e.preventDefault();
    
    const orderForm = document.getElementById("charge-form");
    const formData = new FormData(orderForm);

    const card = {
      number: formData.get("order_address[number]"),
      cvc: formData.get("order_address[cvc]"),
      exp_month: formData.get("order_address[exp_month]"),
      exp_year: `20${formData.get("order_address[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        console.log(token);
        const renderTokenForm = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token', type='hidden'>`;
        renderTokenForm.insertAdjacentHTML("beforeend", tokenObj);

        document.getElementById("card-number").removeAttribute("name");
        document.getElementById("card-exp-month").removeAttribute("name");
        document.getElementById("card-exp-year").removeAttribute("name");
        document.getElementById("card-cvc").removeAttribute("name");
      }

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener('load', order);