// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:eOffice/widgets/adminSetting.dart';
import 'package:eOffice/widgets/carCalendar.dart';
import 'package:eOffice/widgets/myQueue.dart';
import 'package:eOffice/widgets/zoomCalendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:sidebarx/sidebarx.dart';

import 'package:eOffice/models/reserveModel.dart';
import 'package:eOffice/screens/loginScreen.dart';
import 'package:eOffice/widgets/roomCalendar.dart';
import 'package:eOffice/widgets/carReserveBar.dart';
import 'package:eOffice/widgets/roomReserveBar.dart';
import 'package:eOffice/widgets/zoomReserveBar.dart';

class MainMenu extends StatefulWidget {
  final String meeting;
  final String username;
  final String type;
  final String name;

  MainMenu({
    Key? key,
    required this.meeting,
    required this.username,
    required this.type,
    required this.name,
  }) : super(key: key);

  @override
  State<MainMenu> createState() => _menuState();
}

class _menuState extends State<MainMenu> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  DateTime _selectedDateMain = DateTime.now();

  String branch = '';

  String headerText = '';
  String defaultType = '';
  String getSelectType = '';

  List<String> lBranch = ['R9', 'R8', 'VM', 'CA'];
  List<String> lRoom = [];
  List<String> lCar = [];
  List<String> lZoom = [];
  List<String> lSelectedTimes = [];

  List<queueModel> lGetQueue = [];

  @override
  void initState() {
    super.initState();
    headerText = widget.meeting;
  }

  void onTypeSelected(String selectedType) {
    setState(() {
      defaultType = '';
      getSelectType = selectedType;
      headerText = selectedType;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print('สาขา : $branch');
    //print(getQueue);
    //  print('DateFormat : ${widget.dateFormat}');
    return Stack(
      children: [
        Scaffold(
          drawer: SidebarX(controller: _controller),
          body: Row(
            children: [
              sideBar(
                onTypeSelected: onTypeSelected,
                username: widget.username,
                type: widget.type,
                name: widget.name,
              ),
              Column(
                children: [
                  if (headerText != 'Admin')
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, top: 20),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                ),
                                onPressed: () {
                                  _selectDateMain(context);
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Icon(
                                        Icons.calendar_month_sharp,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      DateFormat('yyyy-MM-dd').format(
                                          _selectedDateMain), // Use formatted date string here
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                    ),
                                    onPressed: () {
                                      headerText = 'My Queue';
                                      setState(() {});
                                    },
                                    child: Text(
                                      'My Queue',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                    ),
                                    onPressed: () {
                                      if (headerText == 'Meeting Rooms') {
                                        getSelectType = headerText;
                                        defaultType = getSelectType;
                                      }
                                      defaultType = getSelectType;
                                      setState(() {});
                                      //_toggleReserveDrawer();
                                    },
                                    child: Text(
                                      'จองคิว', //'จองคิว',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 200),
                                    child: Text(
                                      '$headerText',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
        ),
        if (headerText == 'My Queue')
          myQueueCalendarWidget(
            lGetQueue: lGetQueue,
            headerText: '$headerText',
          ),
        if (headerText == 'Meeting Rooms')
          roomCalendarWidget(
            lGetQueue: lGetQueue,
            headerText: '$headerText',
            name: widget.name,
          ),
        if (headerText == 'Car')
          carCalendarWidget(
            lGetQueue: lGetQueue,
            headerText: '$headerText',
          ),
        if (headerText == 'Zoom')
          zoomCalendarWidget(
            lGetQueue: lGetQueue,
            headerText: '$headerText',
          ),
        if (headerText == 'Admin')
          adminSetting(
            branchList: [],
            CarList: [],
            ZoomList: [],
          ),
        if (defaultType == 'Meeting Rooms')
          RoomReserveDrawer(
            selectedDateMain: _selectedDateMain,
            callback: (queue) {
              String? id = queue.id;
              String? type = queue.type;
              String? branch = queue.branch;
              String? unitId = queue.unitId;
              String? unit = queue.unit;
              String? day = queue.day;
              String? startTime = queue.startTime;
              String? startTimeMinute = queue.startTimeMinute;
              String? endTime = queue.endTime;
              String? endTimeMinute = queue.endTimeMinute;
              String? notation = queue.notation;
              // print("Test : $branch");

              defaultType = '';
              setState(() {});
              queueModel newQ = queueModel(
                  id: id,
                  type: type,
                  unitId: unitId,
                  branch: branch,
                  carType: '',
                  unit: unit,
                  day: day,
                  startTime: startTime,
                  startTimeMinute: startTimeMinute,
                  endTime: endTime,
                  endTimeMinute: endTimeMinute,
                  notation: notation);
              lGetQueue.add(newQ);
            },
            name: widget.name,
          ),
        if (defaultType == 'Car')
          carReserveDrawer(
            selectedDateMain: _selectedDateMain,
            callback: (queue) {
              String? id = queue.id;
              String? type = queue.type;
              String? branch = queue.branch;
              String? unitId = queue.unitId;
              String? unit = queue.unit;
              String? carType = queue.carType.isEmpty ? '' : queue.carType;
              String? day = queue.day;
              String? startTime = queue.startTime;
              String? startTimeMinute = queue.startTimeMinute;
              String? endTime = queue.endTime;
              String? endTimeMinute = queue.endTimeMinute;
              String? notation = queue.notation;

              defaultType = '';
              setState(() {});
              // getQueue.add(
              //     'ID: $id,type : $type,Branch: $branch,UnitId: $unitId,Unit: $unit,Cartype : $carType,Day: $day,StartTime: $startTime,StartTimeMinute: $startTimeMinute,EndTime: $endTime,EndTimeMinute: $endTimeMinute');
              //print(getQueue.toList());
              queueModel newQ = queueModel(
                  id: id,
                  type: type,
                  unitId: unitId,
                  branch: branch,
                  carType: carType,
                  unit: unit,
                  day: day,
                  startTime: startTime,
                  startTimeMinute: startTimeMinute,
                  endTime: endTime,
                  endTimeMinute: endTimeMinute,
                  notation: notation);
              lGetQueue.add(newQ);
            },
          ),
        if (defaultType == 'Zoom')
          zoomReserveDrawer(
            selectedDateMain: _selectedDateMain,
            callback: (queue) {
              String? id = queue.id;
              String? type = queue.type;
              String? branch = queue.branch;
              String? unitId = queue.unitId;
              String? unit = queue.unit;
              String? day = queue.day;
              String? startTime = queue.startTime;
              String? startTimeMinute = queue.startTimeMinute;
              String? endTime = queue.endTime;
              String? endTimeMinute = queue.endTimeMinute;
              String? notation = queue.notation;

              defaultType = '';
              setState(() {});
              queueModel newQ = queueModel(
                  id: id,
                  type: type,
                  unitId: unitId,
                  branch: branch,
                  carType: '',
                  unit: unit,
                  day: day,
                  startTime: startTime,
                  startTimeMinute: startTimeMinute,
                  endTime: endTime,
                  endTimeMinute: endTimeMinute,
                  notation: notation);
              lGetQueue.add(newQ);
            },
          ),
      ],
    );
  }

  Future<void> _selectDateMain(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDateMain,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDateMain) {
      setState(() {
        _selectedDateMain = DateTime(pickedDate.year, pickedDate.month,
            pickedDate.day); // Set time to midnight
        String formattedDate = DateFormat('yyyy-MM-dd')
            .format(_selectedDateMain); // Format the DateTime object
        print(formattedDate);
        // Print the formatted date
      });
    }
  }
}

class sideBar extends StatefulWidget {
  final String username;
  final String type;
  final String name;
  sideBar({
    Key? key,
    required this.onTypeSelected,
    required this.username,
    required this.type,
    required this.name,
  }) : super(key: key);
  final Function(String) onTypeSelected;
  @override
  State<sideBar> createState() => _sideBarState();
}

class _sideBarState extends State<sideBar> {
  List<String> lType = ['Meeting Rooms', 'Car', 'Zoom', 'Admin'];
  String selectedType = '';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 200,
          height: double.infinity,
          color: Colors.blue,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              JustTheTooltip(
                  content: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('ชื่อ : ${widget.name}'),
                        Text('ตำแน่ง : ${widget.type}')
                      ],
                    ),
                  ),
                  child: Image.asset('assets/images/profile.png')),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Container(
                    width: 170,
                    child: ElevatedButton(
                      onPressed: () {
                        selectedType = lType[0];
                        widget.onTypeSelected(selectedType);
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8.0), // Adjust border radius as needed
                            side: BorderSide(
                                color: Colors.black), // Define border color
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.hovered))
                              return Color.fromARGB(255, 253, 231, 103);
                            return Color.fromARGB(58, 218, 218, 218);
                          },
                        ),
                      ),
                      child: Text(
                        'Meeting Rooms',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Container(
                    width: 170,
                    child: ElevatedButton(
                      onPressed: () {
                        selectedType = lType[1];
                        widget.onTypeSelected(selectedType);
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8.0), // Adjust border radius as needed
                            side: BorderSide(
                                color: Colors.black), // Define border color
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.hovered))
                              return Color.fromARGB(255, 253, 231, 103);
                            return Color.fromARGB(58, 218, 218, 218);
                          },
                        ),
                      ),
                      child: Text(
                        'Cars',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Container(
                    width: 170,
                    child: ElevatedButton(
                      onPressed: () {
                        selectedType = lType[2];
                        widget.onTypeSelected(selectedType);
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8.0), // Adjust border radius as needed
                            side: BorderSide(
                                color: Colors.black), // Define border color
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.hovered))
                              return Color.fromARGB(255, 253, 231, 103)
                                  .withOpacity(0.8);
                            return Color.fromARGB(58, 218, 218, 218);
                          },
                        ),
                      ),
                      child: Text(
                        'Zooms',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ),
                ),
              ),
              if (widget.type == 'Admin')
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      width: 170,
                      child: ElevatedButton(
                        onPressed: () {
                          selectedType = lType[3];
                          widget.onTypeSelected(selectedType);
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  8.0), // Adjust border radius as needed
                              side: BorderSide(
                                  color: Colors.black), // Define border color
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.hovered))
                                return Color.fromARGB(255, 253, 231, 103)
                                    .withOpacity(0.8);
                              return Color.fromARGB(58, 218, 218, 218);
                            },
                          ),
                        ),
                        child: Text(
                          'Setting',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: EdgeInsets.only(top: 300),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Container(
                    width: 170,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Center(
                                    child: Text('Logout Of Your Account')),
                                content: Row(
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginScreen()),
                                        );
                                      },
                                      child: Text(
                                        'Logout',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    Spacer(),
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Cancel'))
                                  ],
                                ),
                              );
                            });
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8.0), // Adjust border radius as needed
                            side: BorderSide(
                                color: Colors.black), // Define border color
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.hovered))
                              return Color.fromARGB(255, 253, 231, 103);
                            return Color.fromARGB(58, 218, 218, 218);
                          },
                        ),
                      ),
                      child: Text(
                        'Logout',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
