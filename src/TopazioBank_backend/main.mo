import Debug "mo:base/Debug";

actor TopazioBank {
  var currentValue = 300;
  //:= means replace value of that variable
  currentValue := 200;

  let id = 45641651465416541;

  //Debug.print(debug_show(currentValue));
  //Debug.print(debug_show(id));

  //public << allow to call function without need to access actor first
  public func topUpMoney(amount: Nat){
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };
  //topUpMoney()

  public func withdrawMoney(amount: Nat){
    //declare tempValue to be Int for preventing mismatch data type
    let tempValue: Int = currentValue - amount;
    if (tempValue >=0){
      currentValue -= amount;
    Debug.print(debug_show(currentValue));
    }else{ Debug.print("Your deposit is not enough")
    };
  }

};