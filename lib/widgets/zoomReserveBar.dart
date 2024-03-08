import 'package:eOffice/models/reserveModel.dart';
import 'package:eOffice/screens/menu.dart';
//import 'package:eOffice/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class zoomReserveDrawer extends StatefulWidget {
  final DateTime selectedDateMain;
  final Function(queueModel) callback;

  const zoomReserveDrawer({
    Key? key,
    required this.selectedDateMain,
    required this.callback,
  }) : super(key: key);

  @override
  _ReserveDrawerState createState() => _ReserveDrawerState();
}

class _ReserveDrawerState extends State<zoomReserveDrawer> {
  final TextEditingController _additionalInfoController =
      TextEditingController();
  late DateTime _selectedDate;
  String type = 'zoom';

  List<String> selectedTimes = [];
  //String _defaultType = 'Zoom';

  String unitId = '';
  String _selectedBranch = 'เลือกสาขา';
  String _selectedZoom = 'เลือก Zoom';
  String _selectedStartTime = '';
  String _selectedStartTimeMinute = '';
  String _selectedEndTime = '';
  String _selectedEndTimeMinute = '';
  String notation = '';
  List<String> lBranch = ['เลือกสาขา', 'R9', 'R8', 'VM', 'CA'];
  List<String> lZoom = [];
  List<String> lStartTime = [
    '',
    '00',
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
  ];
  List<String> lStartTimeMinute = ['', '00', '30'];
  List<String> lEndTime = [''];
  List<String> lEndTimeMinute = ['', '00', '30'];

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.selectedDateMain;
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: ModalRoute.of(context)!.animation!,
        curve: Curves.easeInOut,
      )),
      child: Align(
        alignment: Alignment.centerRight,
        child: Material(
          child: Container(
            width: 300,
            color: Colors.blue,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Container(
                  height: 80,
                  child: DrawerHeader(
                    child: Row(
                      children: [
                        IconButton(
                            color: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainMenu(
                                          meeting: 'Zoom', username: '', type: '', name: '',
                                        
                                        )),
                              );
                            },
                            icon: Icon(Icons.arrow_back_ios_rounded)),
                        SizedBox(
                          width: 35,
                        ),
                        Center(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 5, bottom: 5),
                              child: Text('Zoom',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10, top: 4, bottom: 4),
                              child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    labelText: 'Choose Branch',
                                    labelStyle: TextStyle(color: Colors.blue),
                                  ),
                                  value:
                                      _selectedBranch, // กำหนดค่าที่เลือกใน dropdown
                                  items: lBranch
                                      .map((branch) => DropdownMenuItem(
                                            value: branch,
                                            child: Text(branch),
                                          ))
                                      .toList(),
                                  onChanged: _onBranchSelected),
                            ),
                          ),
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 10, top: 4, bottom: 4),
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                labelText: 'Choose Zoom',
                                labelStyle: TextStyle(color: Colors.blue),
                              ),
                              value: _selectedZoom,
                              items: lZoom
                                  .map((Zoom) => DropdownMenuItem(
                                        value: Zoom,
                                        child: Text(Zoom),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedZoom = value!;
                                });
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10, top: 4, bottom: 4),
                                child: Text(
                                  'Choose Date',
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                            onPressed: () {
                              _selectDate(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 65.0),
                              child: Row(
                                children: [
                                  Text(
                                    '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Icon(
                                      Icons.calendar_month_sharp,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'เวลา',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 100,
                                      child: Card(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0,
                                              right: 10,
                                              top: 4,
                                              bottom: 4),
                                          child:
                                              DropdownButtonFormField<String>(
                                            decoration: InputDecoration(
                                              labelStyle:
                                                  TextStyle(color: Colors.blue),
                                            ),
                                            value: _selectedStartTime,
                                            items: lStartTime
                                                .map((startTime) =>
                                                    DropdownMenuItem(
                                                      value: startTime,
                                                      child: Text(startTime),
                                                    ))
                                                .toList(),
                                            onChanged: (value) {
                                              setState(() {
                                                _onStartTimeSelected(value);
                                                _selectedStartTimeMinute =
                                                    lStartTimeMinute[1];
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 100,
                                      child: Card(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0,
                                              right: 10,
                                              top: 4,
                                              bottom: 4),
                                          child:
                                              DropdownButtonFormField<String>(
                                            decoration: InputDecoration(
                                              labelStyle:
                                                  TextStyle(color: Colors.blue),
                                            ),
                                            value: _selectedStartTimeMinute,
                                            items: lStartTimeMinute
                                                .map((startTimeMinute) =>
                                                    DropdownMenuItem(
                                                      value: startTimeMinute,
                                                      child:
                                                          Text(startTimeMinute),
                                                    ))
                                                .toList(),
                                            onChanged: (value) {
                                              setState(() {
                                                _selectedStartTimeMinute =
                                                    value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'ถึง',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 100,
                                      child: Card(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0,
                                              right: 10,
                                              top: 4,
                                              bottom: 4),
                                          child:
                                              DropdownButtonFormField<String>(
                                            decoration: InputDecoration(
                                              labelStyle:
                                                  TextStyle(color: Colors.blue),
                                            ),
                                            value: _selectedEndTime,
                                            items: lEndTime
                                                .map((EndTime) =>
                                                    DropdownMenuItem(
                                                      value: EndTime,
                                                      child: Text(EndTime),
                                                    ))
                                                .toList(),
                                            onChanged: (value) {
                                              setState(() {
                                                _selectedEndTime = value!;
                                                _selectedEndTimeMinute =
                                                    lEndTimeMinute[1];
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 100,
                                      child: Card(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0,
                                              right: 10,
                                              top: 4,
                                              bottom: 4),
                                          child:
                                              DropdownButtonFormField<String>(
                                            decoration: InputDecoration(
                                              labelStyle:
                                                  TextStyle(color: Colors.blue),
                                            ),
                                            value: _selectedEndTimeMinute,
                                            items: lEndTimeMinute
                                                .map((EndTimeMinute) =>
                                                    DropdownMenuItem(
                                                      value: EndTimeMinute,
                                                      child:
                                                          Text(EndTimeMinute),
                                                    ))
                                                .toList(),
                                            onChanged: (value) {
                                              setState(() {
                                                _selectedEndTimeMinute = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 8.0, left: 5, right: 5),
                            child: TextFormField(
                              controller: _additionalInfoController,
                              decoration: InputDecoration(
                                labelText: 'หมายเหตุ',
                                labelStyle: TextStyle(color: Colors.blue),
                              ),
                              onChanged: (value) {
                                // Update additional information variable as the user types
                                setState(() {
                                  notation = value;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 200,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.hovered)) {
                                    return Color.fromARGB(255, 89, 250, 110)
                                        .withOpacity(0.8);
                                  }
                                  return Colors.white;
                                },
                              ),
                              foregroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.hovered)) {
                                    return Colors.white;
                                  }
                                  return Colors.blue;
                                },
                              ),
                            ),
                            onPressed: () {
                              if (_selectedBranch == 'เลือกสาขา') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        backgroundColor: Colors.red,
                                        content: Text('กรุณาเลือกสาขา')));
                              } else if (_selectedZoom == 'เลือก Zoom') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        backgroundColor: Colors.red,
                                        content: Text('กรุณาเลือกห้อง')));
                              } else if (_selectedStartTime == '') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        backgroundColor: Colors.red,
                                        content: Text('กรุณาเลือกเวลาเริ่ม')));
                              } else if (_selectedEndTime == '') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text('กรุณาเลือกเวลาสิ้นสุด')));
                              } else if (notation == '') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        backgroundColor: Colors.red,
                                        content: Text('กรุณากรอกหมายเหตุ')));
                              } else {
                                String id = Uuid().v4().substring(0, 5);
                                queueModel queue = queueModel(
                                  id: id,
                                  type: type,
                                  branch: _selectedBranch,
                                  unit: _selectedZoom,
                                  day: DateFormat('yyyy-MM-dd')
                                      .format(_selectedDate),
                                  startTime: _selectedStartTime,
                                  startTimeMinute: _selectedStartTimeMinute,
                                  endTime: _selectedEndTime,
                                  endTimeMinute: _selectedEndTimeMinute,
                                  unitId: '',
                                  carType: '',
                                  notation: notation,
                                );
                                widget.callback(queue);

                                setState(() {
                                  _selectedBranch = ''; // Reset selected branch
                                  _selectedZoom = ''; // Reset selected room
                                  _selectedDate = DateTime
                                      .now(); // Reset selected date to today

                                  selectedTimes
                                      .clear(); // Clear the list of selected times
                                });

                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      Future.delayed(Duration(seconds: 3), () {
                                        Navigator.of(context).pop(true);
                                      });
                                      return AlertDialog(
                                          title: Column(
                                        children: [
                                          Center(
                                              child: Text(
                                            "จองคิวสำเร็จ",
                                            style: TextStyle(fontSize: 30),
                                          )),
                                          SizedBox(height: 16),
                                          Icon(
                                            Icons.check_circle_outline_rounded,
                                            color: Colors.green,
                                            size: 100,
                                          )
                                        ],
                                      ));
                                    });
                              }
                              ;
                            },
                            child: Text(
                              'Confirm',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onStartTimeSelected(String? value) {
    setState(() {
      _selectedStartTime = value!;

      int start = int.parse(value);
      int end = (start + 1) % 24;

      if (start == 23) {
        _selectedEndTime = '23';
        lEndTime = ['23'];
        lEndTimeMinute = ['30', '59'];
        _selectedEndTimeMinute = lEndTimeMinute[0];
      } else {
        _selectedEndTime = end.toString().padLeft(2, '0');
        lEndTime = List.generate(24 - start, (index) => (start + index) % 24)
            .map((hour) => hour.toString().padLeft(2, '0'))
            .toList();
        lEndTimeMinute = ['00', '30'];
        _selectedEndTimeMinute = lEndTimeMinute[0];
      }
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate.isAfter(now) ? _selectedDate : now,
      firstDate: now,
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = DateTime(pickedDate.year, pickedDate.month,
            pickedDate.day); // Set time to midnight
        String formattedDate = DateFormat('yyyy-MM-dd')
            .format(_selectedDate); // Format the DateTime object
        print(formattedDate); // Print the formatted date
      });
    }
  }

  void _onBranchSelected(String? value) {
    setState(() {
      _selectedBranch = value!;
      _selectedZoom = 'เลือก Zoom'; // Reset selected zoom

      selectedTimes.clear(); // Clear the list of selected times

      if (_selectedBranch == 'R9') {
        lZoom = [
          'เลือก Zoom',
          'Zoom 1',
          'Zoom 2',
          'Zoom 3',
          'Zoom 4',
          'Zoom 5'
        ];
      } else if (_selectedBranch == 'R8') {
        lZoom = ['เลือก Zoom', 'Zoom 1', 'Zoom 2', 'Zoom 3', 'Zoom 4'];
      } else if (_selectedBranch == 'VM') {
        lZoom = ['เลือก Zoom', 'Zoom 1', 'Zoom 2', 'Zoom 3'];
      } else if (_selectedBranch == 'CA') {
        lZoom = ['เลือก Zoom', 'Zoom 1', 'Zoom 2'];
      }
    });
  }
}
