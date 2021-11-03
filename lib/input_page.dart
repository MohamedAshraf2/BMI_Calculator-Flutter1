import 'package:bmi_calculator/results.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'results.dart';
import 'calculator.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onpress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? KActiveCardColor
                          : KInactiveCardColor,
                      cardChild: IconContent(
                        iconx: FontAwesomeIcons.mars,
                        textx: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onpress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? KActiveCardColor
                          : KInactiveCardColor,
                      cardChild: IconContent(
                        iconx: FontAwesomeIcons.venus,
                        textx: 'FEMALE',
                      ),
                    ),
                  ),
                ],
              )),
          Expanded(
              child: ReusableCard(
                colour: KActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT', style: KLabelTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(), style: KNumStyle),
                        Text(
                          'cm',
                          style: KLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          thumbColor: Color(0xffeb1555),
                          overlayColor: Color(0x29eb1555),
                          activeTrackColor: Color(0xffffffff),
                          inactiveTrackColor: Color(0xff8d8e98),
                          thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 15),
                          overlayShape: RoundSliderOverlayShape(
                              overlayRadius: 30)),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: KActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: KLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: KNumStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            RoundButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: KActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: KLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: KNumStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            RoundButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(buttonTitle: 'Calculate',
          onTap: () {
            Calcouator calc =Calcouator(height, weight);

            Navigator.push(context,
                MaterialPageRoute(builder: (context)  {return ResultsPage(
                  bmiRes:calc.calcoulatBMI() ,
                  resText:calc.getRes() ,
                  intrpretation: calc.getinterpitation(),

                );
                }));
          },)
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
final Function onTap;
final String buttonTitle;

  const BottomButton({ this.onTap, this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25
              ),
          ),
        ),
        color: KBottomColor,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: KBottomContainerHeight,
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  const RoundButton({this.icon, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: RawMaterialButton(
        child: Icon(icon),
        onPressed: onPressed,
        constraints: BoxConstraints.tightFor(
          width: 56,
          height: 56,
        ),
        elevation: 0,
        shape: CircleBorder(),
        fillColor: Color(0xff4c4f5e),
      ),
    );
  }
}
