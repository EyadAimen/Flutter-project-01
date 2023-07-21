import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: const Calculator()
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}


class _CalculatorState extends State<Calculator> {

  // function for displaying the nums and result
  // thia var is for the displaying
  String output = "0";
  String enterdNumbersOputput= "0";
  // this var is for holding the value
  String backEndOutput = "0";
  String operand ="";
  double num1 = 0;
  double num2 = 0;
  buttonPressed(String button){
    if(button == "C"){
      backEndOutput = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
      enterdNumbersOputput = "0";
    }
    else if(button == "+" || button == "-" || button == "x" || button == "/"){
      if(num1 == 0){
        num1 = double.parse(output);
      }
      else{
        if(button == "+"){
          num1 = num1 + double.parse(output);
        }
        if(button == "-"){
          num1 = num1 - double.parse(output);
        }
        if(button == "x"){
          num1 = num1 * double.parse(output);
        }
        if(button == "/"){
          num1 = num1 / double.parse(output);
        }
      }
      if(enterdNumbersOputput[enterdNumbersOputput.length-1] == '='){
        enterdNumbersOputput = output + ' ' + operand;
      }
      operand = button;
      backEndOutput = "0";
      enterdNumbersOputput = enterdNumbersOputput + ' ' + button + ' ';
    }
    else if(button == "."){
      if(backEndOutput.contains(".")){
        return("Already contains decimal point");
      }
      else{
        backEndOutput = backEndOutput + button;
        enterdNumbersOputput = enterdNumbersOputput + button;
      }
    }
    else if(button == "delete"){
      
      // backEndOutput = backEndOutput.substring(0,backEndOutput.length-1);
      if(enterdNumbersOputput.length >=1){
        enterdNumbersOputput = enterdNumbersOputput.substring(0,enterdNumbersOputput.length-1);
      }
      if(backEndOutput.length>=1 && double.parse(backEndOutput) != 0){
        backEndOutput = backEndOutput.substring(0,backEndOutput.length-1);
      }
    }
    else if(button == "="){
      enterdNumbersOputput = enterdNumbersOputput + ' ' + button;
      num2 = double.parse(output);
      if(operand == "+"){
        backEndOutput = (num1 + num2).toString();
      }
      if(operand == "-"){
        backEndOutput = (num1 - num2).toString();
      }
      if(operand == "x"){
        backEndOutput = (num1 * num2).toString();
      }
      if(operand == "/"){
        backEndOutput = (num1 / num2).toString();
      }
      num1 = 0;
      num2 = 0;
      operand = "";
    }
    else{
      if(enterdNumbersOputput[enterdNumbersOputput.length-1] == '='){
        enterdNumbersOputput = "";
      }
      backEndOutput = backEndOutput + button;
      enterdNumbersOputput = enterdNumbersOputput + button;
    }
    setState(() {
      output = double.parse(backEndOutput).toString();
    });
  }
  // for all the nums buttons
Widget numsButton(String num){
  return Expanded(
    child: SizedBox(
        width: 98,
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: MaterialButton(
            color: Colors.grey,
            onPressed: (){buttonPressed(num);},
            child: Text(num,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
            ),
          ),
      )
  );
}

// to build the symbols buttons except the equals one and the delete one
Widget symbolButton(String symbol){
  if(symbol == "C" || symbol == "="){
    return Expanded(
      child: SizedBox(
        width: 98,
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: MaterialButton(
            color: Colors.redAccent,
            onPressed: (){buttonPressed(symbol);},
            child: Text(symbol,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
            ),
          ),
      ),
    );
  }
  else{
    return Expanded(
      child: SizedBox(
        width: 98,
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: MaterialButton(
            color: Colors.blue,
            onPressed: (){buttonPressed(symbol);},
            child: Text(symbol,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
            ),
          ),
      ),
    );
  }
}
  @override
  Widget build(BuildContext context) {
    // this button to clear the display part
    final clearButton = symbolButton("C");

    // this button to delete one num or symbol
    final deleteButton = Expanded(
      child: SizedBox(
        width: 98,
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: MaterialButton(
            color: Colors.blue,
            onPressed: (){buttonPressed("delete");},
            child: const Icon(Icons.backspace_outlined,color: Colors.white,),
            // textAlign: TextAlign.center,
              ),
            ),
          ),
      );
  
    // this button for substraction symbol
    final substractionButton = symbolButton("/");

    // this button for multiplication symbol
    final mulitplicationButton = symbolButton("x");

    // this button for plus symbol
    final addingButton = symbolButton("+");

    // this button for minus symbol
    final minusButton = symbolButton("-");

    // this button for equals symbol
    final equalsButton = symbolButton("=");

    // this button for num 0
    final numZeroButton = numsButton("0");


    // this button for num 1
    final numOneButton = numsButton("1");

    // this button for num 2
    final numTwoButton = numsButton("2");

    // this button for num 3
    final numThreeButton = numsButton("3");

    // this button for num 4
    final numFourButton = numsButton("4");

    // this button for num 5
    final numFiveButton = numsButton("5");

    // this button for num 6
    final numSixButton = numsButton("6");

    // this button for num 7
    final numSevenButton = numsButton("7");

    // this button for num 8
    final numEightButton = numsButton("8");

    // this button for num 9
    final numNineButton = numsButton("9");


    // this button for the decimal point
    final decimalButton = numsButton(".");

    // this button for 00
    final zeroZeroButton = numsButton("00");





    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple Calculator"),
        leading: const Icon(Icons.calculate_outlined),
      ),
      body: Column(
        children: <Widget>[
          // this is the screen that will display the numbers and the answer
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Text>[
                Text(output,style: const TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
                Text(enterdNumbersOputput,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.normal,color: Colors.grey),),
                // Text(output,style: const TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
              ],
            ),
            ),

            // it makes a space between the widgets and make the 2nd column strts at the bottom
            const Spacer(),
            SizedBox(
              width: MediaQuery. of(context). size. width,
              height: MediaQuery.of(context).size.height*0.50,
              child: Row(
                
              children: <Column>[
                Column(
                  children: <Widget>[
                    // this button to clear the display part
                    clearButton,
                    // this button for num 7
                    numSevenButton,
                    // this button for num 4
                    numFourButton,
                    // this button for num 1
                    numOneButton,
                    // this button for decimal point
                    decimalButton,
                  ],
                ),
                Column(
                  children: <Widget>[
                    // this button to delete one number or symbol
                    deleteButton,
                    // this button for num 8
                    numEightButton,
                    // this button for num 5
                    numFiveButton,
                    // this button for num 2
                    numTwoButton,
                    // this button for num 0
                    numZeroButton,
                  ],
                ),
                Column(
                  children: <Widget>[
                    // this button for substraction symbol
                    substractionButton,
                    // this button for num 9
                    numNineButton,
                    // this button for num 6
                    numSixButton,
                    // this button for num 3
                    numThreeButton,
                    // this button for num 00
                    zeroZeroButton,
                  ],
                ),
                Column(
                  children: <Widget>[
                    // this button for multiplication symbol
                    mulitplicationButton,
                    // this button for minus symbol
                    minusButton,
                    // this button for the adding symbol
                    addingButton,
                  // this button for equal symbol
                  // has the size of two buttons
                    equalsButton,
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



