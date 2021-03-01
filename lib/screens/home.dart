import 'package:flutter/material.dart';
import 'package:bmi_app/constants/app_constants.dart';
import 'package:bmi_app/widgets/left_bar.dart';
import 'package:bmi_app/widgets/right_bar.dart';



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _HeightController = TextEditingController();
  TextEditingController _WeightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator",
        style: TextStyle(
          fontWeight: FontWeight.w900,
          color: accentHexColor
        ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: _HeightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w900,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height",
                      helperText: "Enter in Meters \nEg:1.50",
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(0.8),
                      ),
                        helperStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withOpacity(0.8),
                        ),
                    ),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _WeightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w900,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Weight",
                      helperText: "Enter in Kg\nEg:65",
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(0.8),
                      ),
                      helperStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 30,),
            GestureDetector(
              onTap: (){
                double _h = double.parse(_HeightController.text);
                double _w = double.parse(_WeightController.text);
                setState(() {
                  _bmiResult = _w / (_h * _h);
                  if(_bmiResult>25){
                    _textResult = "You are Over Weight";
                  }else if(_bmiResult>=18.5 && _bmiResult<=25){
                    _textResult = "You have Normal Weight";
                  }else{
                    _textResult = "You have Under Weight";
                  }
                });
              },
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                    side: BorderSide(color: accentHexColor)),
                color: Colors.transparent,
                textColor: Colors.white,
                child: Text("Calculate",
                    style: TextStyle(fontSize: 22,
                      color: accentHexColor,
                    )),
              ),
            ),
            SizedBox(height: 30,),
            Container(
              child: Text(_bmiResult.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 90,
                  fontWeight: FontWeight.bold,
                  color: accentHexColor,
                ),),
            ),
            SizedBox(height: 20,),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(

                child: Text(_textResult,
                  style: TextStyle(
                    fontSize: 32 ,
                    fontWeight: FontWeight.bold,
                    color: accentHexColor,
                  ),),
              ),
            ),
            SizedBox(height: 10,),
            LeftBar(barWidth: 40),
            SizedBox(height: 20,),
            LeftBar(barWidth: 70),


            SizedBox(height: 10,),
            RightBar(barWidth: 40),
            SizedBox(height: 20,),
            RightBar(barWidth: 70),
            SizedBox(height: 20,),

            Container(
              child: Text(
                '© Developed By Arun Sreenivas',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize:15,
                color: Colors.white),
              ),
            ),
          ],

        ),

      ),
    );
  }
}
