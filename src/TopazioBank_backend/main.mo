import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor TopazioBank {
  stable var currentValue = 300: Float;
  //:= means replace value of that variable
  currentValue := 200;

  stable var startTime = Time.now();
  Debug.print(debug_show(startTime));

  let id = 45641651465416541;

  Debug.print(debug_show(currentValue));
  //Debug.print(debug_show(id));
  //public << allow to call function without need to access actor first
  public func topUpMoney(amount: Float){
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };
  //topUpMoney()

  public func withdrawMoney(amount: Float){
    //declare tempValue to be Int for preventing mismatch data type
    let tempValue: Float = currentValue - amount;
    if (tempValue >=0){
      currentValue -= amount;
    Debug.print(debug_show(currentValue));
    }else{ Debug.print("Your deposit is not enough")
    };
  };

  //test

  public query func checkBalance(): async Float{
    return currentValue;
  };

  public func compound(){
    let currentTime = Time.now();
    //NS = nanosecond
    
    let periodNS = currentTime - startTime;
    let periodS = periodNS/1000000000;
    currentValue := currentValue*(1.01**Float.fromInt(periodS));
    startTime := currentTime;
  }
};

