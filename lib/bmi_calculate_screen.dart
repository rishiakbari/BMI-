import 'package:flutter/material.dart';

class BmiCalScreen extends StatefulWidget {
  const BmiCalScreen({super.key});

  @override
  State<BmiCalScreen> createState() => _BmiCalScreenState();
}

class _BmiCalScreenState extends State<BmiCalScreen> {

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFF0A0E21),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Your BMI',
          style: TextStyle(
            color: Color(0xFFedf2f4),
            ),
            ),
        backgroundColor:const  Color(0xFFef233c),
      ),    
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('BMI',style: TextStyle(
              color: Color(0xFFedf2f4),
              fontSize: 30, fontWeight: FontWeight.w600,
            ),),
        
            TextField(
              controller: wtController,
              decoration: const InputDecoration(
                label: Text('Enter your Weight(in Kgs)'),
                prefixIcon: Icon(Icons.line_weight),
              ),
              keyboardType: TextInputType.number,
            ),
        
            const SizedBox(height: 11,),
        
            TextField(
              controller: ftController,
              decoration: const InputDecoration(
                label: Text('Enter your Height(in feet)'),
                prefixIcon: Icon(Icons.height),
              ),
              keyboardType: TextInputType.number,
            ),
        
            const SizedBox(height: 11,),
            
            TextField(
              controller: inController,
              decoration: const InputDecoration(
                label: Text('Enter your Height(in Inch)'),
                prefixIcon: Icon(Icons.height),
              ),
              keyboardType: TextInputType.number,
            ),
        
            const SizedBox(height: 16,),
        
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:const  Color(0xFFef233c)
              ),
              onPressed: (){
        
                var wt = wtController.text.toString();
                var ft = ftController.text.toString();
                var inch = inController.text.toString();
        
                if(wt!=" " && ft!=" " && inch!=" "){
        
                  var iwt = int.parse(wt);
                  var ift = int.parse(ft);
                  var iInch = int.parse(inch);
        
                  var tInch = (ift*12) + iInch;
        
                  var tCm = tInch*2.54;
        
                  var tM = tCm/100;
        
                  var bmi = iwt / (tM*tM);
        
                  var msg = "";
        
                  if(bmi>25){
                    msg = "You are OverWeight!!";
                   const Color(0xFFe76f51);
                  }else if(bmi<18){
                    msg = "You are UnderWeight!!";
                   const Color(0xFF2a9d8f);
                  }else{
                    msg = "You are Healthy!!";
                   const Color(0xFFef476f);
                  }
        
                  setState(() {
                    result = "$msg \n Your BMI is : ${ bmi.toStringAsFixed(2) }";
                  });
                }else{
                  setState(() {
                      result="Please fill all the required blanks!!";
                  });
                }
              }, 
            child: const Text('Calculate',style: TextStyle(color: Color(0xFFedf2f4)),),
            ),
           const SizedBox(height: 20,),
        
            Text(result,style:const  TextStyle(fontSize: 16,color: Color(0xFFedf2f4), ),)
          ],
        ),
      ),
    );
  }
}