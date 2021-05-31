import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:flutter_todolist/appBars.dart';
import 'package:flutter_todolist/bottomNavigation.dart';
import 'package:flutter_todolist/databasehelper.dart';
import 'package:flutter_todolist/fab.dart';
import 'package:flutter_todolist/todomodel.dart';

class Empty extends StatefulWidget {
  Empty({Key key}) : super(key: key);

  _EmptyState createState() => _EmptyState();
}

class _EmptyState extends State<Empty> {
  var bottomNavigationBarIndex = 0;
  DataBaseHelper dbhelper = new DataBaseHelper();
  List<ToDoModel> todolist;
  int count = 0;

//Notification
  FlutterLocalNotificationsPlugin localnotification;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var androidInitilize = new AndroidInitializationSettings('launcher_icon');
    var iosInitilize = new IOSInitializationSettings();
    var initializationsetting = new InitializationSettings(
        android: androidInitilize, iOS: iosInitilize);
    localnotification = new FlutterLocalNotificationsPlugin();
    localnotification.initialize(initializationsetting);
    showNotification();
  }

  Future showNotification() async {
    var androidDetails = new AndroidNotificationDetails(
        "Channel Id", "Local Notification", "Description",
        importance: Importance.high);
    var iosdetails = new IOSNotificationDetails();
    var gerneralnotificationdetails =
        new NotificationDetails(android: androidDetails, iOS: iosdetails);
    await localnotification.show(
        0, "PBL Project report", "Due today", gerneralnotificationdetails);
  }

  @override
  Widget build(BuildContext context) {
    updatelistview();
    if (todolist == null) {
      todolist = new List();
    }
    //var floatingActionButtonLocation;
    return Scaffold(
      appBar: emptyAppbar(),
      body: populatelistview(),

      //  Center(
      //   child: Container(
      //     width: MediaQuery.of(context).size.width / 1.2,
      //     child: Column(
      //       children: <Widget>[
      //         Expanded(
      //           flex: 8,
      //           child: Hero(
      //             tag: 'Clipboard',
      //             child: Image.asset('assets/images/Clipboard-empty.png'),
      //           ),
      //         ),
      //         Expanded(
      //           flex: 3,
      //           child: Column(
      //             children: <Widget>[
      //               Text(
      //                 'No tasks',
      //                 style: TextStyle(
      //                     fontSize: 22,
      //                     fontWeight: FontWeight.w500,
      //                     color: CustomColors.TextHeader),
      //               ),
      //               SizedBox(height: 15),
      //               Text(
      //                 'You have no tasks to do.',
      //                 style: TextStyle(
      //                     fontSize: 17,
      //                     fontWeight: FontWeight.w400,
      //                     color: CustomColors.TextBody,
      //                     fontFamily: 'Times new Roman'),
      //                 textAlign: TextAlign.center,
      //               ),
      //             ],
      //           ),
      //         ),
      //         Expanded(
      //           flex: 1,
      //           child: Container(),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: customFab(context),
      bottomNavigationBar:
          BottomNavigationBarApp(context, bottomNavigationBarIndex),
    );
  }

  updatelistview() async {
    todolist = await dbhelper.getModelsFromMapList();
    setState(() {
      todolist = todolist;
      count = todolist.length;
      print(count);
    });
  }

  ListView populatelistview() {
    bool _value = false;
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            child: new Container(
              padding: new EdgeInsets.all(10.0),
              child: new Column(
                children: <Widget>[
                  new CheckboxListTile(
                    value: _value,
                    // selected: _value,
                    activeColor: Colors.green,
                    checkColor: Colors.white,
                    title: new Text(this.todolist[index].title),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (bool value) {
                      // setState(() {

                      //   _value = value;
                      // });
                    },
                    // onChanged:(bool val){ItemChange(val, index);}
                  )
                ],
              ),
            ),
          );
        });
  }
  // itemBuilder: (context, index) {
  //   return Card(
  //     color: CustomColors.GreenLight,
  //     child: ListTile(
  //       title: Text(this.todolist[index].title),
  //     ),
  //   );
  // }

}
