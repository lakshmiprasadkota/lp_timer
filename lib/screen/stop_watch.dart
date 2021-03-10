import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StopWatchClass extends StatefulWidget {
  @override
  _StopWatchClassState createState() => _StopWatchClassState();
}

class _StopWatchClassState extends State<StopWatchClass> {
  bool startsPressed = true;
  bool stopPressed = true;
  bool resetsPressed = true;
  String  timetodisplay = "00:00:00";
 var swatch = Stopwatch();
 final dur = const Duration(seconds: 1);
 void starttimer(){
   Timer(dur , keepruning);
 }
 void keepruning(){
  if(swatch.isRunning){
    starttimer();
  }
  setState(() {
    timetodisplay = swatch.elapsed.inHours.toString().padLeft(2 ," 0")
        + ":" + (swatch.elapsed.inMinutes%60).toString().padLeft(2,"0")
        + ":" +
      (swatch.elapsed.inSeconds%60).toString().padLeft(2,"0");
  });
 }
  void startstopwatch(){
    setState(() {
      stopPressed = false;
      startsPressed =false;
      resetsPressed = false;

    });
    swatch.start();
    starttimer();

  }
  void stopstopwatch(){
   setState(() {
     stopPressed = true;
     resetsPressed= false;
     startsPressed =true;

   });
   swatch.stop();

  }
  void resetstopwatch(){
setState(() {
  startsPressed = true;
  resetsPressed= true;
});
swatch.reset();
timetodisplay = "00:00:00";
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column
        (
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
      Container(
            padding: EdgeInsets.only(top: 40),
          child: Text(timetodisplay , style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),)),

      // Expanded(
      //
      //     flex: 1,
      //     child: Text("${timeToDisplay}" , style: TextStyle(fontWeight: FontWeight.bold
      //         ,fontSize: 35),)),

       Container(
         padding: EdgeInsets.only(top: 50),
         child: Column(
           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 RaisedButton(

                   onPressed: startsPressed ? startstopwatch : null,
                   padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                   shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(15)
                   ),
                   color: Colors.green,
                   child: Text("Start", style: TextStyle(
                       color: Colors.white
                   ),),),
                 RaisedButton(

                   onPressed: stopPressed ? null : stopstopwatch,
                   padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                   shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(15)
                   ),
                   color: Colors.red,
                   child: Text("Stop", style: TextStyle(
                       color: Colors.white
                   ),),)
               ],),
             SizedBox(height: 40,),
             Container(
               padding: EdgeInsets.only(bottom: 50),
               child: RaisedButton(

                 onPressed: resetsPressed ? null : resetstopwatch,
                 padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                 shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(15)
                 ),
                 color: Colors.red,
                 child: Text("Reset", style: TextStyle(
                     color: Colors.white
                 ),),),
             )
           ],
         )
       ),


    ],),);
  }
}
