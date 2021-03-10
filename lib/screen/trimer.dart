import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lp_timer/screen/home_screen.dart';
import 'package:numberpicker/numberpicker.dart';
import 'dart:async';

class TimerWidget extends StatefulWidget {
  @override
  _TimerState createState() => _TimerState();

  static Timer periodic(Duration duration, Timer timer) {}
}

class _TimerState extends State<TimerWidget> {
  int hour = 0;
  int min = 0;
  int sec =0;
  bool started =true;
  bool stopped = true;
  bool resetted = true;
  int time = 0;
  bool checkTimer = true;
 String timeToDisplay = " " ;
 int timeStore = 0;
 int stopChecks = 0;




  void startToReset(){
    setState(() {
      started = false;
      stopped = false;
      resetted = false;
    });
    debugPrint(time.toString());
    time = ((hour * 60 * 60) +(min *60) +sec);
    Timer.periodic(Duration(seconds: 1), (Timer t){
      setState(() {

         if(time < 1 || checkTimer == false){
           t.cancel();
           checkTimer = true;
           Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));

         }else{
           time = time -1;

         }
         timeStore = time+1;
         timeToDisplay =time.toString();
      });
    }
  );

  }
  void start(){
    setState(() {
      started = false;
      stopped = false;
      resetted = false;
    });
    debugPrint(time.toString());
    time = ((hour * 60 * 60) +(min *60) +sec);
    Timer.periodic(Duration(seconds: 1), (Timer t){
      setState(() {
        if(stopChecks >=1 ){
          time = timeStore -1;
        }
        if(time < 1 || checkTimer == false){
          t.cancel();
          checkTimer = true;
          timeToDisplay= " ";

        }else{
          time = time -1;
        }
        timeStore = time+1;
        timeToDisplay =time.toString();
      });
    }
    );

  }

  void startToStop(){
    setState(() {
      started = false;
      stopped = false;
      resetted = false;
    });
    debugPrint(time.toString());
    time = ((hour * 60 * 60) +(min *60) +sec);
    Timer.periodic(Duration(seconds: 1), (Timer t){
      setState(() {
        if(stopChecks >=1 ){
          time = timeStore -1;

        }
        if(time < 1 || checkTimer == false){
          t.cancel();
          checkTimer = true;
          timeToDisplay= " ";
        }else{
          time = time -1;
        }
        timeStore = time+1;
        timeToDisplay =time.toString();
      });
    }
    );

  }

  void stop() {
setState(() {
  started = true;
  stopped = true;
  resetted = false;
  checkTimer = false;
  stopChecks = stopChecks + 1;
});
  }
  void reset() {
    setState(() {
      started = true;
      stopped = true;
      resetted = true;
      checkTimer = false;
      timeToDisplay = " ";

    });
  }
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Column(children: [
      Expanded(
          flex: 6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("HH" , style: TextStyle(fontSize: 18,
                      fontWeight: FontWeight.bold),),
                  SizedBox(height: 15,),
                  NumberPicker.integer(initialValue: hour,
                      minValue: 0,
                      maxValue: 24,
                    listViewWidth: 60,
                    onChanged: (val){
                    setState(() {
                      hour = val;
                    });
                    },
                      )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("MM" , style: TextStyle(fontSize: 18,
                      fontWeight: FontWeight.bold),),
                  SizedBox(height: 15,),
                  NumberPicker.integer(initialValue: min,
                    minValue: 0,
                    maxValue: 24,
                    listViewWidth: 60,
                    onChanged: (val){
                      setState(() {
                        min = val;
                      });
                    },
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("SS" , style: TextStyle(fontSize: 18,
                  fontWeight: FontWeight.bold),),
                  SizedBox(height: 15,),
                  NumberPicker.integer(initialValue: sec,
                    minValue: 0,
                    maxValue: 24,
                    listViewWidth: 60,
                    onChanged: (val){
                      setState(() {
                        sec = val;
                      });
                    },
                  )
                ],
              ),
            ],
          )),

      Expanded(

          flex: 1,
          child: Text("${timeToDisplay}" , style: TextStyle(fontWeight: FontWeight.bold
          ,fontSize: 35),)),

      Expanded(
          flex: 3,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(

                    onPressed: started ? start : null,
                    padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    color: Colors.green,
                    child: Text("Start", style: TextStyle(
                        color: Colors.white
                    ),),),
                  RaisedButton(

                    onPressed: stopped ? null : stop,
                    padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    color: Colors.red,
                    child: Text("Stop", style: TextStyle(
                        color: Colors.white
                    ),),)
                ],),
              SizedBox(height: 50,),
              RaisedButton(

                onPressed: resetted ? null : reset,
                padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                ),
                color: Colors.red,
                child: Text("Reset", style: TextStyle(
                    color: Colors.white
                ),),)
            ],
          )),

    ],),);
  }
}
