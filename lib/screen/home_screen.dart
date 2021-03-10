import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lp_timer/screen/stop_watch.dart';
import 'package:lp_timer/screen/trimer.dart';

import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: Scaffold(

        appBar: AppBar(
          centerTitle: true,
          title: Text("Lp Timer"),
          bottom: TabBar(
            labelPadding: EdgeInsets.only(bottom: 10),
            tabs: [
              Text("Timer"),
              Text("StopWatch")
            ],

          ),
        ),
   body: TabBarView(
     children: [
       TimerWidget(),
       StopWatchClass()
     ],
   ),
      ),
    );
  }
}
