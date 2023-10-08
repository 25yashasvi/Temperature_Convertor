import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const TemperatureConvertor(title: 'TEMPERATURE CONVERTOR'),
    );
  }
}

class TemperatureConvertor extends StatefulWidget {
  const TemperatureConvertor({super.key, required this.title});
  final String title;
  @override
  State<TemperatureConvertor> createState() => _TemperatureConvertorState();

}

class _TemperatureConvertorState extends State<TemperatureConvertor> {
  final TextEditingController textEditingController=TextEditingController();
 double c_temp=0;
  double f_temp=0;
  double k_temp=0;
  double r_temp=0;
double Convertor(c_temp)
  {
    print(c_temp);
    f_temp=c_temp*(9/5)+32;
    k_temp=c_temp+273.15;
    r_temp=c_temp*(9/5)+491.67;
    return f_temp;
  }
 @override
  Widget build (BuildContext context) {
   return  Scaffold(
       appBar: AppBar(

         backgroundColor:Colors.lightBlueAccent,
         centerTitle: true,
         title: Text(widget.title,
           style:TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: 30,
             color:Colors.white

           ),
         ),

       ),
     backgroundColor: Colors.black,
       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           children: <Widget>[
              Container(
                  margin:const EdgeInsets.only(left:50.0,right:50.0,top:50.0),
                child:Row(
           children: <Widget>[
             Container(

               width:200,
               height:40 ,
               padding: const EdgeInsets.all(4.0),
               decoration: BoxDecoration(
                   color: Colors.lightBlueAccent,
                 borderRadius: const BorderRadius.all(Radius.circular(40.0))
               ),
               child:Text('In Fahereneit',
               textAlign: TextAlign.center,
               style:TextStyle(color:Colors.white ,
               fontSize: 25,
                 fontWeight: FontWeight.bold)),

             ),
             SizedBox(
                 width:50
             ),

             Text('$f_temp F',
             style: TextStyle(
               color:Colors.white,
               fontWeight: FontWeight.bold,
               fontSize: 25
             )),
             ]
                )
              ),
             Container(
                 margin:const EdgeInsets.only(left:50.0,right:50.0,top:50.0),
                 child:Row(
                     children: <Widget>[
                       Container(
                         width:200,
                         height:40 ,
                         padding: const EdgeInsets.all(4.0),
                         decoration: BoxDecoration(
                             color: Colors.lightBlueAccent,
                             borderRadius: const BorderRadius.all(Radius.circular(40.0))
                         ),
                         child:Text('In Kelvin',
                             textAlign: TextAlign.center,
                             style:TextStyle(color:Colors.white ,
                                 fontSize: 25,
                                 fontWeight: FontWeight.bold)),

                       ),
                       SizedBox(
                           width:50
                       ),
                       Text('$k_temp K',
                           style: TextStyle(
                               color:Colors.white,
                               fontWeight: FontWeight.bold,
                               fontSize: 25
                           )),
                     ]
                 )
             ),
             Container(
                 margin:const EdgeInsets.only(left:50.0,right:50.0,top:50.0),
                 child:Row(
                     children: <Widget>[
                       Container(

                         width:200,
                         height:40 ,
                         padding: const EdgeInsets.all(4.0),
                         decoration: BoxDecoration(
                             color: Colors.lightBlueAccent,
                             borderRadius: const BorderRadius.all(Radius.circular(40.0))
                         ),
                          child:Text('In Rankine',
                             textAlign: TextAlign.center,
                             style:TextStyle(color:Colors.white ,
                                 fontSize: 25,
                                 fontWeight: FontWeight.bold)),

                       ),
                       SizedBox(
                         width:50
                       ),
                       Text('$r_temp R',
                           style: TextStyle(
                               color:Colors.white,
                               fontWeight: FontWeight.bold,
                               fontSize: 25
                           )),
                     ]
                 )
             ),
            SizedBox(height:50),

             Padding(padding: const EdgeInsets.only(left:50,right:50,bottom:20),
             child:
             TextField(
               controller: textEditingController,
               style:TextStyle(color:Colors.white),
               decoration: InputDecoration(
                labelText:"Please enter the temperature in celcius",
                 labelStyle: TextStyle(color:Colors.lightBlueAccent),
                  prefixIcon: Icon(CupertinoIcons.thermometer),
                  prefixIconColor: Colors.lightBlueAccent,
                  border: OutlineInputBorder(
                    borderRadius : const BorderRadius.all(Radius.circular(60.0)),
                    gapPadding :4.0,
                    borderSide: BorderSide(
                      color:Colors.white,
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius : const BorderRadius.all(Radius.circular(60.0)),
                    gapPadding :4.0,
                    borderSide: BorderSide(
                      color:Colors.white,
                    )
                  ),
                 ),
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true
                ),
                 )
             ),
            Container(
              width:150,
              height:50,
            //   children[]:

           child: FloatingActionButton(onPressed: (){
              Convertor(double.parse(textEditingController.text));
              setState(() {
                f_temp = f_temp;
                c_temp=c_temp;
                k_temp=k_temp;
                print(f_temp);
              });
            },
                child: Text('CONVERT',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                    )),
                backgroundColor: Colors.lightBlueAccent,
            )
            ),
           ],
         ),
       )

   );
 }
}
