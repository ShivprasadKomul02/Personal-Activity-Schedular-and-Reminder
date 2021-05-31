import 'package:flutter/material.dart';
import 'package:flutter_todolist/dataprovider.dart';
import 'package:flutter_todolist/empty.dart';

import 'package:flutter_todolist/home.dart';
import 'package:flutter_todolist/taskclasss.dart';
import 'package:flutter_todolist/todomodel.dart';
import 'databasehelper.dart';
import 'util.dart';

class Modal {
  List<String> subTasks = <String>[];
  DateTime selectedDate;
  TextEditingController inputcontroler = TextEditingController();
  String newtaskname;
  ToDoModel toDoModel = new ToDoModel();
  var _statusesList = ["Pending", "Completed"];
  var selectedStatus = "Pending";

  // getTasks() async {
  //   final tasks = await dbprovider.dataBase.getTask();
  //   print(tasks);
  //   return tasks;
  // }

  mainBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height - 80,
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: <Widget>[
              Positioned(
                top: MediaQuery.of(context).size.height / 25,
                left: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.elliptical(175, 30),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 2 - 340,
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          child: Image.asset('assets/images/fab-delete.png'),
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: <Color>[
                                CustomColors.PurpleLight,
                                CustomColors.PurpleDark,
                              ],
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: CustomColors.PurpleShadow,
                                blurRadius: 10.0,
                                spreadRadius: 5.0,
                                offset: Offset(0.0, 0.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(height: 10),
                          Text(
                            'Add new task',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            child: TextFormField(
                              controller: inputcontroler,
                              autofocus: true,
                              style: TextStyle(
                                  fontSize: 18, fontStyle: FontStyle.normal),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Enter Task Name"),
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: 60,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  width: 1.0,
                                  color: CustomColors.GreyBorder,
                                ),
                                bottom: BorderSide(
                                  width: 1.0,
                                  color: CustomColors.GreyBorder,
                                ),
                              ),
                            ),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              children: <Widget>[
                                Center(
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        height: 10.0,
                                        width: 10.0,
                                        margin: EdgeInsets.only(right: 4),
                                        decoration: BoxDecoration(
                                          color: CustomColors.YellowAccent,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 10),
                                        child: Text('Personal'),
                                      ),
                                    ],
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Text(
                                      'Work',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                      color: CustomColors.GreenIcon,
                                      boxShadow: [
                                        BoxShadow(
                                          color: CustomColors.GreenShadow,
                                          blurRadius: 5.0,
                                          spreadRadius: 3.0,
                                          offset: Offset(0.0, 0.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        height: 10.0,
                                        width: 10.0,
                                        margin: EdgeInsets.only(right: 4),
                                        decoration: BoxDecoration(
                                          color: CustomColors.PurpleIcon,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 10),
                                        child: Text('Meeting'),
                                      ),
                                    ],
                                  ),
                                ),
                                Center(
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        height: 10.0,
                                        width: 10.0,
                                        margin: EdgeInsets.only(right: 4),
                                        decoration: BoxDecoration(
                                          color: CustomColors.BlueIcon,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 10),
                                        child: Text('Study'),
                                      ),
                                    ],
                                  ),
                                ),
                                Center(
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        height: 10.0,
                                        width: 10.0,
                                        margin: EdgeInsets.only(right: 4),
                                        decoration: BoxDecoration(
                                          color: CustomColors.OrangeIcon,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 10),
                                        child: Text('Shopping'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          // Container(
                          //   width: MediaQuery.of(context).size.width / 1.2,
                          //   child: Text(
                          //     'Choose date',
                          //     textAlign: TextAlign.left,
                          //     style: TextStyle(fontSize: 12),
                          //   ),
                          // ),
                          SizedBox(height: 10),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            child: Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                    Icons.calendar_today,
                                    color: Colors.lightBlue,
                                  ),
                                  iconSize: 40,
                                  tooltip: "Select Date and Time",
                                  onPressed: () async {
                                    final selectedDate =
                                        await _selectDateTime(context);
                                    if (selectedDate == null) return;
                                    print(selectedDate);
                                    final selectedTime =
                                        await _selectTime(context);
                                    if (selectedTime == null) return;
                                    print(selectedTime);
                                  },
                                )
                              ],
                            ),
                          ),

                          SizedBox(height: 10),
                          // RaisedButton(
                          //   onPressed: () {
                          //     subTasks.add('New subtask');
                          //     //print(subTasks.toString());
                          //   },
                          //   textColor: Colors.white,
                          //   padding: const EdgeInsets.all(0.0),
                          //   shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(8.0),
                          //   ),
                          //   child: Container(
                          //     width: 120,
                          //     height: 40,
                          //     decoration: const BoxDecoration(
                          //       gradient: LinearGradient(
                          //         colors: <Color>[
                          //           CustomColors.BlueLight,
                          //           CustomColors.BlueDark,
                          //         ],
                          //       ),
                          //       borderRadius: BorderRadius.all(
                          //         Radius.circular(8.0),
                          //       ),
                          //       boxShadow: [
                          //         BoxShadow(
                          //           color: CustomColors.BlueShadow,
                          //           blurRadius: 2.0,
                          //           spreadRadius: 1.0,
                          //           offset: Offset(0.0, 0.0),
                          //         ),
                          //       ],
                          //     ),
                          //     padding:
                          //         const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          //     // child: Center(
                          //     //   child: const Text(
                          //     //     'Add subtask',
                          //     //     style: TextStyle(
                          //     //         fontSize: 12,
                          //     //         fontWeight: FontWeight.w500),
                          //     //   ),
                          //     // ),
                          //   ),
                          // ),
                          SizedBox(height: 10),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: 150,
                            child: ListView.builder(
                              itemCount: subTasks.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  margin: const EdgeInsets.only(bottom: 5.0),
                                  child: TextFormField(
                                    initialValue: subTasks[index],
                                    autofocus: false,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.grey[850],
                                    ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(50.0),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                          width: 2.0,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(50.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 25),
                          RaisedButton(
                            onPressed: () {
                              toDoModel.title = inputcontroler.text.toString();

                              toDoModel.status = selectedStatus;
                              toDoModel.date = selectedDate.toString();

                              DataBaseHelper dataBaseHelper = DataBaseHelper();

                              if (toDoModel.id == null)
                                dataBaseHelper.insert(toDoModel);
                              // else
                              //   dataBaseHelper.updateItem(toDoModel);
                              // // Taskclass newtask = Taskclass(
                              //     taskname: newtaskname,
                              //     creationDate: selectedDate);
                              // dbprovider.dataBase.addNewTask(newtask);

                              // Navigator.pop(context, true);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Empty()),
                              );
                              // Navigator.pop(context);
                            },
                            textColor: Colors.white,
                            padding: const EdgeInsets.all(0.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: 60,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: <Color>[
                                    CustomColors.BlueLight,
                                    CustomColors.BlueDark,
                                  ],
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: CustomColors.BlueShadow,
                                    blurRadius: 2.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(0.0, 0.0),
                                  ),
                                ],
                              ),
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              child: Center(
                                child: const Text(
                                  'Add task',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

Future<TimeOfDay> _selectTime(BuildContext context) {
  final now = DateTime.now();
  return showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: now.hour, minute: now.minute));
}

Future<DateTime> _selectDateTime(BuildContext context) => showDatePicker(
    context: context,
    initialDate: DateTime.now().add(Duration(seconds: 1)),
    firstDate: DateTime.now(),
    lastDate: DateTime(2100));
