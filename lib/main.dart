import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
runApp(Calc());
});
  
}

class Calc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calc',
      home: MyHomePage(title: 'Calc'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
      String expression = "";
      String equation = "0";
      String result = "0";
      getPressed(String value) {
        setState(() {
          if (value == "=") {
           
            expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');

        try{
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        }catch(e){
          result = "Error";
        }

      


        }else if(value =="c"){

          equation = "0";
          result = "0";

        }else{
          if(equation == "0"){
            equation = value;
         }else{
            equation = equation+value;
      }
          
        }
        });
        


}


  @override
  Widget build(BuildContext context) {
 return Scaffold(
   backgroundColor: Colors.grey[300],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,       
        title: Text(
  'CALCULATOR',
  style: GoogleFonts.lato(
    textStyle: TextStyle(color: Colors.white, letterSpacing: 8),
  ),
),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,        
        children: [  
           Padding(
            padding: const EdgeInsets.only(left:12,right: 15,bottom: 20),
             child: Container(
                 child: Column(
                 mainAxisAlignment: MainAxisAlignment.end,
                 crossAxisAlignment: CrossAxisAlignment.end,
                 children: [
                  Text(
  equation,
  style: GoogleFonts.lato(
    textStyle: TextStyle(color: Colors.black,fontSize: 38, letterSpacing: 2),
  ),
),],
               ),
               color:Colors.grey[300],
               height:250
             ),
           ),        
           Padding(
             padding: const EdgeInsets.only(left:12,right: 15,bottom: 3),
             child: Container(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.end,
                 crossAxisAlignment: CrossAxisAlignment.end,
                 children: [
                  Text(
  result,
  style: GoogleFonts.lato(
    textStyle: TextStyle(color: Colors.black,fontSize: 55, letterSpacing: 2),
  ),
), ],
               ),
               color:Colors.grey[300],
               height:150
             ),
           ),
           Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topRight:Radius.circular(40),topLeft:Radius.circular(40)),
                             color:Colors.grey,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  _button("7",Colors.black,Colors.white),
                                  _button("8",Colors.black,Colors.white),
                                  _button("9",Colors.black,Colors.white),
                                  _button("÷",Colors.grey[400],Colors.black),
                                ],
                              ),
                               Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  _button("4",Colors.black,Colors.white),
                                  _button("5",Colors.black,Colors.white),
                                  _button("6",Colors.black,Colors.white),
                                  _button("×",Colors.grey[400],Colors.black),
                                ],
                              ),
                               Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  _button("1",Colors.black,Colors.white),
                                  _button("2",Colors.black,Colors.white),
                                  _button("3",Colors.black,Colors.white),
                                  _button("-",Colors.grey[400],Colors.black),
                                ],
                              ),
                               Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  _button("c",Colors.orange,Colors.black),                                  
                                  _button("0",Colors.black,Colors.white),
                                  _button("=",Colors.white,Colors.black),                                  
                                  _button("+",Colors.grey[400],Colors.black),
                                  
                                ],
                              ),
                            ],
                          ),
                          ),
           )
          
        ],
      ),
      );
  }
  Widget _button(String value,
  Color buttoncolor,Color fontcolor){
    return InkWell(
      onTap:()=>getPressed(value),
                    child: Container(
                    height:70,
                    width:70,
                    child:Center(child: Text(
        value,
        style: GoogleFonts.lato(
          textStyle: TextStyle(fontSize: 27,
            color: fontcolor),
        ),
      ),),
                    decoration:BoxDecoration(
                      color: buttoncolor,                                    
                      shape: BoxShape.circle)
                  ),
                );
       
        }
            
      }