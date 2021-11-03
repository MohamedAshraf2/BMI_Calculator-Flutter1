import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';

class ResultsPage extends StatelessWidget {
  final String bmiRes;
  final String resText;
  final String intrpretation;

  const ResultsPage({@required this.bmiRes, @required this.resText,@required this.intrpretation}) ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI Result')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result ',

                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: ReusableCard(
                colour: KActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resText.toUpperCase(),
                      style: TextStyle(
                        color: Color(0xff24d876),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      bmiRes,
                      style:
                          TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      intrpretation,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22),
                    ),
                  ],
                ),

              )),
          BottomButton(buttonTitle: 'RE-Calculate',
          onTap: (){
            Navigator.pop(context);
          },)
        ],

      ),
    );
  }
}
