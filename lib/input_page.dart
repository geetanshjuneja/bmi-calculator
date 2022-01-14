import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reuseable_card.dart';
import 'card_content.dart';
import 'resukts_page.dart';
import 'calculator_brain.dart';

const Color activeCardColor =  Color(0xFF1D1E33);
const Color inactiveCardColor = Color(0xFF111328);
int height = 180;
int weight = 60;
int age = 12;
const stylish = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);
enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;
  // void updateColor(int gender){
  //   if(gender == 1){
  //     if(maleCardColor == inactiveCardColor ) {
  //       maleCardColor = activeCardColor;
  //       femaleCardColor = inactiveCardColor;
  //     }
  //
  //     else maleCardColor = inactiveCardColor;
  //   }
  //   else{
  //     if(femaleCardColor == inactiveCardColor) {
  //       femaleCardColor = activeCardColor;
  //       maleCardColor = inactiveCardColor;
  //     }
  //
  //     else femaleCardColor = inactiveCardColor;
  //   }
  // }
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        backgroundColor: Color(0xFF0A0E21),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReuseableCard(
                        selectedGender == Gender.male ? activeCardColor : inactiveCardColor ,
                        cardContent(FontAwesomeIcons.mars,'male'),
                    ),
                  ),

                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                       selectedGender = Gender.female;
                      });
                    },
                    child: ReuseableCard(
                      selectedGender == Gender.female ? activeCardColor : inactiveCardColor,
                      cardContent(FontAwesomeIcons.venus,'female'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ReuseableCard(
                Color(0xFF1D1E33),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: estyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: stylish,
                        ),
                        Text(
                          'cm',
                          style: estyle,
                        ),
                      ],
                    ),
                    Expanded(
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Color(0xFF8D8E98),
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFE81555),
                          overlayColor: Color(0x29E81555),
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                        ),
                        child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            onChanged: (double newValue){
                              setState(() {
                                height = newValue.round();
                              });
                            }
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ),
          Expanded(
            child:  Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                      Color(0xFF1D1E33),
                      Column(
                        children: [
                          Text(
                            'WEIGHT',
                            style: estyle,
                          ),
                          Text(
                            weight.toString(),
                            style: stylish,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundedButton(FontAwesomeIcons.minus,
                                    (){
                                 setState(() {
                                   weight--;
                                 });
                                    }
                                ),
                                RoundedButton(FontAwesomeIcons.plus,
                                    (){
                                 setState(() {
                                   weight++;
                                 });
                                    }
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(Color(0xFF1D1E33),
                    Column(
                      children: [
                        Text(
                          'AGE',
                          style: estyle,
                        ),
                        Text(
                          age.toString(),
                          style: stylish,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundedButton(FontAwesomeIcons.minus,
                                      (){
                                    setState(() {
                                      age--;
                                    });
                                  }
                              ),
                              RoundedButton(FontAwesomeIcons.plus,
                                      (){
                                    setState(() {
                                      age++;
                                    });
                                  }
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

          ),
          GestureDetector(
            onTap: (){
              Calculator calc = Calculator(height,weight);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResultPage(calc.bmiCalc(),calc.getResult(),calc.getInterpretation());
              }));
            },
            child: Container(
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25.0,
                  ),
                ),
              ),
              color: Color(0xFFE81555),
              margin: EdgeInsets.all(10.0),
              width: double.infinity,
              height: 80,
            ),
          ),
        ],
      ),



    );
  }
}

class RoundedButton extends StatelessWidget {
  final IconData con;

  final Function onPressed;
  RoundedButton(this.con,this.onPressed);
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(con),
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,
      ),
      fillColor: Color(0xFF4C4F5E),
      elevation: 0.0,
    );
  }
}





