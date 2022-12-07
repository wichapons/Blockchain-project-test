import { TopazioBank_backend } from "../../declarations/TopazioBank_backend";

window.addEventListener("load",async ()=>{
  var currentMoney = await TopazioBank_backend.checkBalance();
  //rounding to 2 decimal points
  document.getElementById("value").innerText = Math.round(currentMoney*100)/100;
}
);

  document.querySelector("form").addEventListener("submit", async function(event){
    event.preventDefault();
    const button = event.target.querySelector("#submit-btn");
    //parseFloat => change to float number
    const depositAmount = parseFloat (document.getElementById("input-amount").value);
    const withdrawAmount = parseFloat (document.getElementById("withdrawal-amount").value);
    button.setAttribute("disabled",true);

    if (document.getElementById("input-amount").value.length != 0){
      await TopazioBank_backend.topUpMoney(depositAmount);
    } else (window.alert("Please fill in your deposit amount"));
    
    if(document.getElementById("withdrawal-amount").value.length != 0){
      await TopazioBank_backend.topUpMoney(withdrawAmount);
    } else (window.alert("Please fill in your withdrawal amount"));

    var currentMoney = await TopazioBank_backend.checkBalance();
    document.getElementById("value").innerText = Math.round(currentMoney*100)/100;

    button.removeAttribute("disabled");
    document.getElementById("input-amount").value=("");
    document.getElementById("withdrawal-amount").value=("");
  });
