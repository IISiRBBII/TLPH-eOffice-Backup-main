import 'package:eOffice/models/back_office_mockup.dart';
import 'package:eOffice/models/tlbacloffice_setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class adminSetting extends StatefulWidget {
  final List<String> branchList;
  final Function(String?)? onBranchSelected;
  final String? selectedBranch;
  final List<String> CarList;
  final String? selectedCarType;
  final String? selectedCar;
  final Function(String?)? onCarSelected;
  final List<String> ZoomList;
  final Function(String?)? onZoomSelected;
  final String? selectedZoom;
  adminSetting({
    Key? key,
    required this.branchList,
    this.onBranchSelected,
    this.selectedBranch,
    this.selectedCarType,
    this.selectedCar,
    this.onCarSelected,
    this.onZoomSelected,
    required this.CarList,
    required this.ZoomList,
    this.selectedZoom,
  }) : super(key: key);

  @override
  State<adminSetting> createState() => _adminSettingState();
}

class _adminSettingState extends State<adminSetting> {
 
  final TextEditingController _AddRoomController = TextEditingController();
  final TextEditingController _AddFloorController = TextEditingController();
  final TextEditingController _AddSeatController = TextEditingController();
  final TextEditingController _AddCarController = TextEditingController();
  final TextEditingController _AddCarRegisController = TextEditingController();
  final TextEditingController _AddCarTypeController = TextEditingController();
  final TextEditingController _AddZoomController = TextEditingController();
  final TextEditingController _AddUserZoomController = TextEditingController();
  final TextEditingController _AddEmailZoomController = TextEditingController();
  final TextEditingController _EditRoomController = TextEditingController();
  final TextEditingController _EditSeatController = TextEditingController();
  final TextEditingController _EditFloorController = TextEditingController();
  final TextEditingController _EditCarController = TextEditingController();
  final TextEditingController _EditCarRegisController = TextEditingController();
  final TextEditingController _EditCarTypeController = TextEditingController();
  final TextEditingController _EditUserZoomController = TextEditingController();
  final TextEditingController _EditEmailController = TextEditingController();
  
  String? defaultType = '';
  String? _selectedBranch;
  String? _selectedType;
  String? _selectedCarType;
  String? _selectedCar;
  String? _selectedFloor;
  String? _selectedSeat;
  String? _seletedCatType;
  String? _selectedZoom;
  String? zoom;
  String? car;
  String? branch;
  // String? _newRoomName;
  // String? _newFloor;
  // String? _newSeat;
  List<String> lItem = [];
  List<String> lbranch = ['R9', 'R8', 'VM', 'CA'];
  List<String> lroom = [];
  List<String> lCar = [];
  List<String> lCarType = ['SUV', 'SEDAN', 'PickUp', 'Luxury', 'Minivan'];
  List<Map<String, dynamic>> roomData = [];
  List<Map<String, dynamic>> carData = [];
  List<Map<String, dynamic>> zoomData = [];

  List<String> backOffice_setting = [];

  // List<String> lFloor = [
  //   '01',
  //   '02',
  //   '03',
  //   '04',
  //   '05',
  //   '06',
  //   '07',
  //   '08',
  //   '09',
  //   '10',
  // ];

  // List<String> lSeat = [
  //   '01',
  //   '02',
  //   '03',
  //   '04',
  //   '05',
  //   '06',
  //   '07',
  //   '08',
  //   '09',
  //   '10',
  //   '11',
  //   '12',
  //   '13',
  //   '14',
  //   '15',
  //   '16',
  //   '17',
  //   '18',
  //   '19',
  //   '20',
  // ];
 
  String? idroom;
  String? room;
  String? floor;
  String? seat;
  String? idcar;
  String? carregis;
  String? typecar;
  String? idzoom;
  String? namezoom;
  String? emailzoom;
  bool onHoverAdd = false;
  bool onHoverRoom = false;
  bool onHoverCar = false;
  bool onHoverZoom = false;
  String? _selectedRoom;

  backOfficeSettingModel tlbackOffice_Setting = backOfficeSettingModel(
      tlbackoffice_setting_id: '',
      tlbackoffice_setting_site: '',
      tlbackoffice_setting_type: '',
      tlbackoffice_setting_name: '',
      tlbackoffice_setting_subtype: '',
      tlbackoffice_setting_comment: '',
      tlbackoffice_setting_create_datetime: '',
      tlbackoffice_setting_create_by: '',
      tlbackoffice_setting_status: '',
      tlbackoffice_setting_modify_datetime: '',
      tlbackoffice_setting_modify_by: '');

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 205,
        right: 5,
        top: 55,
        bottom: 1,

        //------------Background-------------//
        child: Material(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.blue),
              child: Column(children: [
                //--------สาขา----------//
                Row(
                  children: [
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: Container(
                        width: 70,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            'สาขา',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 18,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                    //-------------dropdown-------------//
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: Card(
                        child: Container(
                          width: 175,
                          height: 40,
                          child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                // labelText: 'Choose Branch',
                                labelStyle: TextStyle(color: Colors.blue),
                              ),
                              value:
                                  _selectedBranch, // กำหนดค่าที่เลือกใน dropdown
                              items: lbranch
                                  .map((branch) => DropdownMenuItem(
                                        value: branch,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(branch),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  _onBranchSelected(value);
                                  print(defaultType);

                                  // _selectedBranch = value;
                                });
                              }),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),

                //----------------------btRoomSetting----------------------//
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 162,
                        ),
                        Spacer(),
                        MouseRegion(
                          onEnter: (_) {
                            setState(() {
                              onHoverRoom = true;
                            });
                          },
                          onExit: (_) {
                            setState(() {
                              onHoverRoom = false;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                            ),
                            child: Container(
                              width: 80,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  // BackOfficeMockup;
                                  if (_selectedBranch != null) {
                                    setState(() {
                                      defaultType =
                                          'Room'; // กำหนด defaultType เป็น 'Room'
                                      if (_selectedBranch == 'R9') {
                                        roomData = [
                                          {
                                            'idroom': 'r9r001',
                                            'room': 'Room 1',
                                            'floor': '5',
                                            'seat': '10 ',
                                          },
                                          {
                                            'idroom': 'r9r002',
                                            'room': 'Room 2',
                                            'floor': '6',
                                            'seat': '15 ',
                                          },
                                          {
                                            'idroom': 'r9r003',
                                            'room': 'Room 3',
                                            'floor': '7',
                                            'seat': '20',
                                          },
                                          {
                                            'idroom': 'r9r004',
                                            'room': 'Room 4',
                                            'floor': '7',
                                            'seat': '20',
                                          },
                                          {
                                            'idroom': 'r9r005',
                                            'room': 'Room 5',
                                            'floor': '7',
                                            'seat': '20',
                                          },
                                        ];
                                      } else if (_selectedBranch == 'R8') {
                                        roomData = [
                                          {
                                            'idroom': 'r8r001',
                                            'room': 'Room 1',
                                            'floor': '5',
                                            'seat': '10 ',
                                          },
                                          {
                                            'idroom': 'r8r002',
                                            'room': 'Room 2',
                                            'floor': '6',
                                            'seat': '15 ',
                                          },
                                          {
                                            'idroom': 'r8r003',
                                            'room': 'Room 3',
                                            'floor': '7',
                                            'seat': '20',
                                          },
                                          {
                                            'idroom': 'r8r004',
                                            'room': 'Room 4',
                                            'floor': '7',
                                            'seat': '20',
                                          },
                                        ];
                                      } else if (_selectedBranch == 'VM') {
                                        roomData = [
                                          {
                                            'idroom': 'vmr001',
                                            'room': 'Room 1',
                                            'floor': '5',
                                            'seat': '10 ',
                                          },
                                          {
                                            'idroom': 'vmr002',
                                            'room': 'Room 2',
                                            'floor': '6',
                                            'seat': '15 ',
                                          },
                                          {
                                            'idroom': 'vmr003',
                                            'room': 'Room 3',
                                            'floor': '7',
                                            'seat': '20',
                                          },
                                        ];
                                      } else if (_selectedBranch == 'CA') {
                                        roomData = [
                                          {
                                            'idroom': 'car001',
                                            'room': 'Room 1',
                                            'floor': '5',
                                            'seat': '10 ',
                                          },
                                          {
                                            'idroom': 'car002',
                                            'room': 'Room 2',
                                            'floor': '6',
                                            'seat': '15 ',
                                          },
                                        ];
                                      }
                                    });
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('กรุณาเลือกสาขา'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('OK'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: onHoverRoom
                                      ? Colors.grey[400]
                                      : Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                ),
                                child: Text(
                                  'Room',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 18,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        //--------------------btCarSetting----------------------//
                        MouseRegion(
                          onEnter: (_) {
                            setState(() {
                              onHoverCar = true;
                            });
                          },
                          onExit: (_) {
                            setState(() {
                              onHoverCar = false;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 10,
                            ),
                            child: Container(
                              width: 80,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_selectedBranch != null) {
                                    setState(() {
                                      defaultType = 'Car';
                                      if (_selectedBranch == 'R9') {
                                        carData = [
                                          {
                                            'idcar': 'r9c001',
                                            'carregis': 'จย 1234',
                                            'typecar': 'SUV',
                                          },
                                          {
                                            'idcar': 'r9c002',
                                            'carregis': 'พด 4856',
                                            'typecar': 'SUV',
                                          },
                                          {
                                            'idcar': 'r9c003',
                                            'carregis': 'ดพ 6578',
                                            'typecar': 'SUV',
                                          },
                                          {
                                            'idcar': 'r9c004',
                                            'carregis': 'รน 1526',
                                            'typecar': 'SUV',
                                          },
                                          {
                                            'idcar': 'r9c005',
                                            'carregis': 'ยบ 9284',
                                            'typecar': 'SUV',
                                          },
                                          {
                                            'idcar': 'r9c006',
                                            'carregis': 'พก 1946',
                                            'typecar': 'SUV',
                                          },
                                        ];
                                      } else if (_selectedBranch == 'R8') {
                                        carData = [
                                          {
                                            'idcar': 'r8c001',
                                            'carregis': 'สส 3526',
                                            'typecar': 'Minivan',
                                          },
                                          {
                                            'idcar': 'r8c002',
                                            'carregis': 'ยน 6538',
                                            'typecar': 'SUV',
                                          },
                                          {
                                            'idcar': 'r8c003',
                                            'carregis': 'จย 9183',
                                            'typecar': 'SUV',
                                          },
                                          {
                                            'idcar': 'r8c004',
                                            'carregis': 'ดป 7913',
                                            'typecar': 'SUV',
                                          },
                                        ];
                                      } else if (_selectedBranch == 'VM') {
                                        carData = [
                                          {
                                            'idcar': 'vmc001',
                                            'carregis': 'ยม 8520',
                                            'typecar': 'Sedan',
                                          },
                                          {
                                            'idcar': 'vmc002',
                                            'carregis': 'กก 1125',
                                            'typecar': 'SUV',
                                          },
                                          {
                                            'idcar': 'vmc003',
                                            'carregis': 'ฟก 1522',
                                            'typecar': 'SUV',
                                          },
                                        ];
                                      } else if (_selectedBranch == 'CA') {
                                        carData = [
                                          {
                                            'idcar': 'cac003',
                                            'carregis': 'บบ 4562',
                                            'typecar': 'Pickup',
                                          },
                                          {
                                            'idcar': 'cac002',
                                            'carregis': 'วว 9988',
                                            'typecar': 'SUV',
                                          },
                                        ];
                                      }
                                    });
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('กรุณาเลือกสาขา'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('OK'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: onHoverCar
                                      ? Colors.grey[400]
                                      : Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                ),
                                child: Text(
                                  'Car',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 18,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        //----------------------btZoomSetting----------------------//
                        MouseRegion(
                          onEnter: (_) {
                            setState(() {
                              onHoverZoom = true;
                            });
                          },
                          onExit: (_) {
                            setState(() {
                              onHoverZoom = false;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 10,
                            ),
                            child: Container(
                              width: 80,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_selectedBranch != null) {
                                    defaultType = 'Zoom';
                                    print('$defaultType');

                                    // Clear previous zoomData
                                    setState(() {
                                      zoomData.clear();
                                    });

                                    // Load zoomData based on selectedBranch
                                    setState(() {
                                      if (_selectedBranch == 'R9') {
                                        zoomData.addAll([
                                          {
                                            'idzoom': 'zoom001',
                                            'namezoom': 'Steve',
                                            'emailzoom': 'steve@gmail.com',
                                          },
                                          {
                                            'idzoom': 'zoom002',
                                            'namezoom': 'Christ',
                                            'emailzoom': 'christ@gmail.com',
                                          },
                                          {
                                            'idzoom': 'zoom003',
                                            'namezoom': 'Price',
                                            'emailzoom': 'Price@gmail.com',
                                          },
                                          {
                                            'idzoom': 'zoom004',
                                            'namezoom': 'Mile',
                                            'emailzoom': 'MileZ@hotmail.com',
                                          },
                                          {
                                            'idzoom': 'zoom005',
                                            'namezoom': 'Job',
                                            'emailzoom': 'Jobzoom@hotmail.com',
                                          },
                                        ]);
                                      } else if (_selectedBranch == 'R8') {
                                        zoomData.addAll([
                                          {
                                            'idzoom': 'zoom006',
                                            'namezoom': 'Steve',
                                            'emailzoom': 'Pickup',
                                          },
                                          {
                                            'idzoom': 'zoom007',
                                            'namezoom': 'Steve',
                                            'emailzoom': 'Pickup',
                                          },
                                          {
                                            'idzoom': 'zoom008',
                                            'namezoom': 'Steve',
                                            'emailzoom': 'Pickup',
                                          },
                                          {
                                            'idzoom': 'zoom009',
                                            'namezoom': 'Steve',
                                            'emailzoom': 'Pickup',
                                          },
                                        ]);
                                      } else if (_selectedBranch == 'VM') {
                                        zoomData.addAll([
                                          {
                                            'idzoom': 'zoom010',
                                            'namezoom': 'Steve',
                                            'emailzoom': 'Pickup',
                                          },
                                          {
                                            'idzoom': 'zoom011',
                                            'namezoom': 'Steve',
                                            'emailzoom': 'Pickup',
                                          },
                                          {
                                            'idzoom': 'zoom012',
                                            'namezoom': 'Steve',
                                            'emailzoom': 'Pickup',
                                          },
                                        ]);
                                      } else if (_selectedBranch == 'CA') {
                                        zoomData.addAll([
                                          {
                                            'idzoom': 'zoom013',
                                            'namezoom': 'Steve',
                                            'emailzoom': 'Pickup',
                                          },
                                          {
                                            'idzoom': 'zoom014',
                                            'namezoom': 'Steve',
                                            'emailzoom': 'steve@gmail.com',
                                          },
                                        ]);
                                      }
                                    });
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('เลือกสาขาก่อน'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('OK'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: onHoverZoom
                                      ? Colors.grey[400]
                                      : Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                ),
                                child: Text(
                                  'Zoom',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 18,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Spacer(),
                        //----------------------------BT Add----------------------------------//
                        Padding(
                          padding: const EdgeInsets.only(top: 10, right: 15),
                          child: Container(
                            width:
                                150, // เพิ่มขนาดเพื่อให้ไอคอนและข้อความเข้ากันได้
                            height: 40,
                            child: MouseRegion(
                              onEnter: (_) {
                                setState(() {
                                  onHoverAdd = true;
                                });
                              },
                              onExit: (_) {
                                setState(() {
                                  onHoverAdd = false;
                                });
                              },
                              child: Container(
                                child: ElevatedButton.icon(icon: Icon(Icons.add_circle_rounded,
                                      color: Colors.blue), // ไอคอน "Add"
                                  label: Text('เพิ่มรายการ',
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 18,
                                        color: Colors.blue,
                                      )),
                                  onPressed: () {
                                    if (defaultType == 'Room'){
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text('เพิ่มรายห้องประชุม'),
                                              content: Container(
                                              height: 110,
                                                width:double.infinity,
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Align(
                                                          alignment: Alignment.centerLeft,
                                                          child: Container(
                                                            width: 200,
                                                            color: Colors.grey[200],
                                                            child: TextFormField(
                                                              controller: _AddRoomController,
                                                              decoration: InputDecoration(
                                                                  hintText: 'ชื่อห้องประชุม'),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text('ชั้น:'),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Container(
                                                          width: 75,
                                                          color: Colors.grey[200],
                                                          child: TextFormField(
                                                            controller: _AddFloorController,
                                                            decoration: InputDecoration(
                                                                hintText: 'ชั้น'),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text('ที่นั่ง:'),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Container(
                                                          width: 75,
                                                          color: Colors.grey[200],
                                                          child: TextFormField(
                                                            controller: _AddSeatController,
                                                            decoration: InputDecoration(
                                                                hintText: 'ที่นั่ง'),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top:20),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.end, // จัดวางส่วนที่อยู่ภายใน Row ไปทางขวา
                                                        children: [
                                                          Container(
                                                            width: 100,
                                                            height: 40,
                                                            child: ElevatedButton(
                                                                onPressed: () {
                                                                  String roomName = _AddRoomController.text;
                                                                  String floor = _AddFloorController.text;
                                                                  String seat = _AddSeatController.text;

                                                                  roomData.add({
                                                                    'idroom': 'new_id', // สร้าง ID ใหม่ได้ตามต้องการ
                                                                    'room': roomName,
                                                                    'floor': floor,
                                                                    'seat': seat,
                                                                  });
                                                                  Navigator.of(context).pop();

                                                                  setState(() {
                                                                    
                                                                  });
                                                                },
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                        backgroundColor:
                                                                            Colors
                                                                                .green),
                                                                child: Text(
                                                                  'Save',
                                                                  style: TextStyle(
                                                                      fontSize: 18),
                                                                )),
                                                          ),
                                                          SizedBox(width: 20), // เพิ่มระยะห่างระหว่างปุ่ม
                                                          Container(
                                                              width: 100,
                                                              height: 40,
                                                              child: ElevatedButton(
                                                                  onPressed: () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                          backgroundColor:
                                                                              Colors
                                                                                  .red),
                                                                  child: Text(
                                                                      'Cancel',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              18))),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(20)),
                                              ),
                                            );
                                          },
                                        );
                                    }else if (defaultType == 'Car'){
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text('เพิ่มรายการรถ'),
                                              content: Container(
                                              height: 110,
                                                width:double.infinity,
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Align(
                                                          alignment: Alignment.centerLeft,
                                                          child: Container(
                                                            width: 200,
                                                            color: Colors.grey[200],
                                                            child: TextFormField(
                                                              controller: _AddCarRegisController,
                                                              decoration: InputDecoration(
                                                                  hintText: 'ทะเบียนรถ'),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text('ประเภทรถ:'),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Container(
                                                          width: 200,
                                                          color: Colors.grey[200],
                                                          child: TextFormField(
                                                            controller: _AddCarTypeController,
                                                            decoration: InputDecoration(
                                                                hintText: 'ประเภทรถ'),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top:20),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.end, // จัดวางส่วนที่อยู่ภายใน Row ไปทางขวา
                                                        children: [
                                                          Container(
                                                              width: 100,
                                                              height: 40,
                                                              child: ElevatedButton(
                                                                  onPressed: () {
                                                                    String carRegister = _AddCarRegisController.text;
                                                                    String carType = _AddCarTypeController.text;
                                                                    
                                                                    carData.add({
                                                                      'idcar': 'new_id', // สร้าง ID ใหม่ได้ตามต้องการ
                                                                      'carregis': carRegister,
                                                                      'typecar': carType,
                                                                      
                                                                    });
                                                                    Navigator.of(context).pop();

                                                                    setState(() {
                                                                      
                                                                    });
                                                                  },
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                          backgroundColor:
                                                                              Colors
                                                                                  .green),
                                                                  child: Text(
                                                                    'Save',
                                                                    style: TextStyle(
                                                                        fontSize: 18),
                                                                  )),
                                                            ),
                                                          SizedBox(width: 20), // เพิ่มระยะห่างระหว่างปุ่ม
                                                          Container(
                                                            width: 100,
                                                            height: 40,
                                                            child: ElevatedButton(
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                        backgroundColor:
                                                                            Colors
                                                                                .red),
                                                                child: Text(
                                                                    'Cancel',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18))),
                                                          ),
                                                        ],
                                                      ),
                                                    ),

                                                  ],
                                                ),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(20)),
                                              ),
                                            );
                                          },
                                        );  
                                    } else if (defaultType == 'Zoom'){
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('แก้ไขรายการซูม'),
                                            content: Container(
                                            height: 110,
                                              width:double.infinity,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Align(
                                                        alignment: Alignment.centerLeft,
                                                        child: Container(
                                                          width: 200,
                                                          color: Colors.grey[200],
                                                          child: TextFormField(
                                                            controller: _AddUserZoomController,
                                                            decoration: InputDecoration(
                                                                hintText: 'ชื่อผู้ใช้'),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text('E-mail:'),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Container(
                                                        width: 200,
                                                        color: Colors.grey[200],
                                                        child: TextFormField(
                                                          controller: _AddEmailZoomController,
                                                          decoration: InputDecoration(
                                                              hintText: 'namesample@sample.com'),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top:20),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.end, // จัดวางส่วนที่อยู่ภายใน Row ไปทางขวา
                                                      children: [
                                                        Container(
                                                            width: 100,
                                                            height: 40,
                                                            child: ElevatedButton(
                                                                onPressed: () {
                                                                    String nameZoom = _AddUserZoomController.text;
                                                                    String emailZoom = _AddEmailZoomController.text;
                                                                    
                                                                    zoomData.add({
                                                                      'idzoom': 'new_id', // สร้าง ID ใหม่ได้ตามต้องการ
                                                                      'namezoom': nameZoom,
                                                                      'emailzoom': emailZoom,
                                                                      
                                                                    });
                                                                    Navigator.of(context).pop();

                                                                    setState(() {
                                                                      
                                                                    });
                                                                  },
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                        backgroundColor:
                                                                            Colors
                                                                                .green),
                                                                child: Text(
                                                                  'Save',
                                                                  style: TextStyle(
                                                                      fontSize: 18),
                                                                )),
                                                          ),
                                                        SizedBox(width: 20), // เพิ่มระยะห่างระหว่างปุ่ม
                                                        Container(
                                                          width: 100,
                                                          height: 40,
                                                          child: ElevatedButton(
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                      backgroundColor:
                                                                          Colors.red),
                                                              child: Text(
                                                                  'Cancel',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          18))),
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                ],
                                              ),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20)),
                                            ),
                                          );
                                        },
                                      );

                                    }else {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text('กรุณาเลือกสาขาก่อน'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('OK'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                      
                                    }
                                  },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: onHoverAdd
                                ? Colors.grey[400]
                                : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                          ),                  
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

                //-----------------------bgListview----------------------//
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20, left: 0, right: 0, bottom: 0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: 1650,
                            minHeight: 760,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.white,
                            ),
                            width: 1650,
                            height: 760,
                            child: ListViewhere(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ));
  }

  ListView ListViewhere() {
    if (defaultType != 'Room' &&
        defaultType != 'Car' &&
        defaultType != 'Zoom') {
      return ListView();
    }

    int iCount = 0;
    if (defaultType == 'Room') {
      iCount = roomData.length;
    } else if (defaultType == 'Car') {
      iCount = carData.length;
    } else {
      iCount = zoomData.length;
    }

    return ListView.builder(
      itemCount: iCount,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              //----------------bgListText-------------------//
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                width: 1630,
                height: 40,
                child: Row(
                  children: [
                    if (defaultType == 'Room') ...[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text('${roomData[index]['room']}'),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Expanded(
                        child: Text('ชั้น : '),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text('${roomData[index]['floor']}'),
                          ),
                        ),
                      ),
                      Spacer(),
                      Expanded(
                        child: Text('ที่นั่ง :'),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text('${roomData[index]['seat']}'),
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                    if (defaultType == 'Car') ...[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text('${carData[index]['carregis']}'),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Expanded(
                        child: Text('ประเภทรถ :'),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text('${carData[index]['typecar']}'),
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                    if (defaultType == 'Zoom') ...[
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          width: 20,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text('${zoomData[index]['namezoom']}'),
                          ),
                        ),
                      )),
                      Spacer(),
                      Expanded(
                        child: Text('E-mail : '),
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          width: 100,
                          height: 30,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text('${zoomData[index]['emailzoom']}'),
                          ),
                        ),
                      )),
                    ],
                    //----------------------------------BTEditRoom---------------------------------//
                    IconButton(
                      onPressed: () {
                        if (defaultType == 'Room') {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            _EditRoomController.text = roomData[index]['room']; // แทน currentRoomName ด้วยข้อมูลห้องประชุมปัจจุบัน
                            _EditFloorController.text = roomData[index]['floor']; // แทน currentFloor ด้วยข้อมูลชั้นปัจจุบัน
                            _EditSeatController.text = roomData[index]['seat']; 
                            return AlertDialog(
                              title: Text('แก้ไขรายการห้องประชุม'),
                              content: Container(
                               height: 110,
                                width:double.infinity,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: 200,
                                            color: Colors.grey[200],
                                            child: TextFormField(
                                              controller: _EditRoomController,
                                              decoration: InputDecoration(
                                                  hintText: 'ชื่อห้องประชุม'),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('ชั้น:'),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          width: 75,
                                          color: Colors.grey[200],
                                          child: TextFormField(
                                            controller: _EditFloorController,
                                            decoration: InputDecoration(
                                                hintText: 'ชั้น'),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('ที่นั่ง:'),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          width: 75,
                                          color: Colors.grey[200],
                                          child: TextFormField(
                                            controller: _EditSeatController,
                                            decoration: InputDecoration(
                                                hintText: 'ที่นั่ง'),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top:20),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end, // จัดวางส่วนที่อยู่ภายใน Row ไปทางขวา
                                        children: [
                                          Container(
                                            width: 100,
                                            height: 40,
                                            child: ElevatedButton(
                                                onPressed: () {

                                                  String editedRoom = _EditRoomController.text;
                                                  String editedFloor = _EditFloorController.text;
                                                  String editedSeat = _EditSeatController.text;
                                                  
                                                  Map<String, String> editedRoomData = {
                                                  'idroom': roomData[index]['idroom'], // ใช้ idroom เดิม
                                                  'room': editedRoom,
                                                  'floor': editedFloor,
                                                  'seat': editedSeat,
                                                };

                                                  roomData[index] = editedRoomData;
                                                  
                                                  Navigator.of(context).pop();

                                                  setState(() {
                                                    
                                                  });
                                                },
                                                style: ElevatedButton
                                                    .styleFrom(
                                                        backgroundColor:
                                                            Colors
                                                                .green),
                                                child: Text(
                                                  'Save',
                                                  style: TextStyle(
                                                      fontSize: 18),
                                                )),
                                          ),
                                          SizedBox(width: 20), // เพิ่มระยะห่างระหว่างปุ่ม
                                          Container(
                                              width: 100,
                                              height: 40,
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(
                                                            context)
                                                        .pop();
                                                  },
                                                  style: ElevatedButton
                                                      .styleFrom(
                                                          backgroundColor:
                                                              Colors
                                                                  .red),
                                                  child: Text(
                                                      'Cancel',
                                                      style: TextStyle(
                                                          fontSize:
                                                              18))),
                                            ),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            );
                          },
                        );
                        }
                        //----------------------------------BTEditCar---------------------------------//
                        else if (defaultType == 'Car') {
                          showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            _EditCarRegisController.text = carData[index]['carregis']; // แทน currentRoomName ด้วยข้อมูลห้องประชุมปัจจุบัน
                            _EditCarTypeController.text = carData[index]['typecar']; // แทน currentFloor ด้วยข้อมูลชั้นปัจจุบัน
                             
                            return AlertDialog(
                              title: Text('แก้ไขรายการรถ'),
                              content: Container(
                               height: 110,
                                width:double.infinity,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: 200,
                                            color: Colors.grey[200],
                                            child: TextFormField(
                                              controller: _EditCarRegisController,
                                              decoration: InputDecoration(
                                                  hintText: 'ทะเบียนรถ'),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('ประเภทรถ:'),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          width: 200,
                                          color: Colors.grey[200],
                                          child: TextFormField(
                                            controller: _EditCarTypeController,
                                            decoration: InputDecoration(
                                                hintText: 'ประเภทรถ'),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top:20),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end, // จัดวางส่วนที่อยู่ภายใน Row ไปทางขวา
                                        children: [
                                          Container(
                                              width: 100,
                                              height: 40,
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    String editedcarregis = _EditCarRegisController.text;
                                                    String editedtypecar= _EditCarTypeController.text;
                                                   
                                                  
                                                    Map<String, String> editedCarData = {
                                                    'idcar': carData[index]['idcar'], // ใช้ idroom เดิม
                                                    'carregis': editedcarregis,
                                                    'typecar': editedtypecar,
                                                    
                                                };

                                                  carData[index] = editedCarData;
                                                  
                                                  Navigator.of(context).pop();

                                                  setState(() {
                                                    
                                                  });
                                                  },
                                                  style: ElevatedButton
                                                      .styleFrom(
                                                          backgroundColor:
                                                              Colors
                                                                  .green),
                                                  child: Text(
                                                    'Save',
                                                    style: TextStyle(
                                                        fontSize: 18),
                                                  )),
                                            ),
                                          SizedBox(width: 20), // เพิ่มระยะห่างระหว่างปุ่ม
                                          Container(
                                            width: 100,
                                            height: 40,
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(
                                                          context)
                                                      .pop();
                                                },
                                                style: ElevatedButton
                                                    .styleFrom(
                                                        backgroundColor:
                                                            Colors
                                                                .red),
                                                child: Text(
                                                    'Cancel',
                                                    style: TextStyle(
                                                        fontSize:
                                                            18))),
                                          ),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            );
                          },
                        );
                        //----------------------------------BTEditZoom---------------------------------//
                        }else{
                          showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            _EditUserZoomController.text = zoomData[index]['namezoom']; // แทน currentRoomName ด้วยข้อมูลห้องประชุมปัจจุบัน
                            _EditEmailController.text = zoomData[index]['emailzoom']; 
                            return AlertDialog(
                              title: Text('แก้ไขรายการซูม'),
                              content: Container(
                               height: 110,
                                width:double.infinity,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: 200,
                                            color: Colors.grey[200],
                                            child: TextFormField(
                                              controller: _EditUserZoomController,
                                              decoration: InputDecoration(
                                                  hintText: 'ชื่อผู้ใช้'),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('E-mail:'),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          width: 200,
                                          color: Colors.grey[200],
                                          child: TextFormField(
                                            controller: _EditEmailController,
                                            decoration: InputDecoration(
                                                hintText: '@sample.com'),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top:20),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end, // จัดวางส่วนที่อยู่ภายใน Row ไปทางขวา
                                        children: [
                                          Container(
                                              width: 100,
                                              height: 40,
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                      String editeduserzoom = _EditUserZoomController.text;
                                                      String editedemail= _EditEmailController.text;

                                                      Map<String, String> editedZoomData = {
                                                        'idzoom': zoomData[index]['idzoom'], // ใช้ idroom เดิม
                                                        'namezoom': editeduserzoom,
                                                        'emailzoom': editedemail,
                                                    
                                                      };

                                                    zoomData[index] = editedZoomData;
                                                  
                                                    Navigator.of(context).pop();

                                                    setState(() {
                                                    
                                                    });
                                                  },
                                                  style: ElevatedButton
                                                      .styleFrom(
                                                          backgroundColor:
                                                              Colors
                                                                  .green),
                                                  child: Text(
                                                    'Save',
                                                    style: TextStyle(
                                                        fontSize: 18),
                                                  )),
                                            ),
                                          SizedBox(width: 20), // เพิ่มระยะห่างระหว่างปุ่ม
                                          Container(
                                            width: 100,
                                            height: 40,
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(
                                                          context)
                                                      .pop();
                                                },
                                                style: ElevatedButton
                                                    .styleFrom(
                                                        backgroundColor:
                                                            Colors.red),
                                                child: Text(
                                                    'Cancel',
                                                    style: TextStyle(
                                                        fontSize:
                                                            18))),
                                          ),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            );
                          },
                        );
                        
                        }

                      },
                      tooltip: 'Edit',
                      icon: Icon(
                        Icons.edit_note_rounded,
                        size: 30,
                      ),
                    ),
                    //---------------------------BTDelete-----------------------------------//
                    IconButton(
                      onPressed: () {
                        if (defaultType == 'Room') {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('ลบรายการห้องประชุม'),
                              content:Container(height: 136,width: double.infinity,
                              child: Column(
                                children: [
                                  Icon(Icons.warning_rounded,color: Colors.red,size: 60, ),
                                  Text('ต้องการลบรายการหรือไม่'),
                                   Padding(
                                      padding: const EdgeInsets.only(top:10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end, // จัดวางส่วนที่อยู่ภายใน Row ไปทางขวา
                                        children: [
                                          Container(
                                              width: 100,
                                              height: 40,
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      roomData.removeAt(index);
                                                    });
                                                  Navigator.of(context).pop();
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(
                                                      content: Text('ลบข้อมูลสำเร็จ'),
                                                      backgroundColor: Colors.green,
                                                    ),
                                                  );
                                              },
                                                  style: ElevatedButton
                                                      .styleFrom(
                                                          backgroundColor:
                                                              Colors
                                                                  .green),
                                                  child: Text(
                                                    'Yes',
                                                    style: TextStyle(
                                                        fontSize: 18),
                                                  )),
                                            ),
                                          SizedBox(width: 20), // เพิ่มระยะห่างระหว่างปุ่ม
                                          Container(
                                            width: 100,
                                            height: 40,
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(
                                                          context)
                                                      .pop();
                                                },
                                                style: ElevatedButton
                                                    .styleFrom(
                                                        backgroundColor:
                                                            Colors.red),
                                                child: Text(
                                                    'No',
                                                    style: TextStyle(
                                                        fontSize:
                                                            18))),
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                              )
                                  
                                 
                              
                                // Add more action buttons as needed
                            );
                          },
                        );
                        } else if (defaultType == 'Car'){
                            showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('ลบรายการรถ'),
                              content:Container(height: 136,width: double.infinity,
                              child: Column(
                                children: [
                                  Icon(Icons.warning_rounded,color: Colors.red,size: 60, ),
                                  Text('ต้องการลบรายการหรือไม่'),
                                   Padding(
                                      padding: const EdgeInsets.only(top:10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end, // จัดวางส่วนที่อยู่ภายใน Row ไปทางขวา
                                        children: [
                                          Container(
                                              width: 100,
                                              height: 40,
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      carData.removeAt(index);
                                                    });
                                                  Navigator.of(context).pop();
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(
                                                      content: Text('ลบข้อมูลสำเร็จ'),
                                                      backgroundColor: Colors.green,
                                                    ),
                                                  );
                                                  },
                                                  style: ElevatedButton
                                                      .styleFrom(
                                                          backgroundColor:
                                                              Colors
                                                                  .green),
                                                  child: Text(
                                                    'Yes',
                                                    style: TextStyle(
                                                        fontSize: 18),
                                                  )),
                                            ),
                                          SizedBox(width: 20), // เพิ่มระยะห่างระหว่างปุ่ม
                                          Container(
                                            width: 100,
                                            height: 40,
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(
                                                          context)
                                                      .pop();
                                                },
                                                style: ElevatedButton
                                                    .styleFrom(
                                                        backgroundColor:
                                                            Colors.red),
                                                child: Text(
                                                    'No',
                                                    style: TextStyle(
                                                        fontSize:
                                                            18))),
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                              )
                                  
                                 
                              
                                // Add more action buttons as needed
                            );
                          },
                        );

                        } else{
                          showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('ลบรายการซูม'),
                              content:Container(height: 136,width: double.infinity,
                              child: Column(
                                children: [
                                  Icon(Icons.warning_rounded,color: Colors.red,size: 60, ),
                                  Text('ต้องการลบรายการหรือไม่'),
                                   Padding(
                                      padding: const EdgeInsets.only(top:10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end, // จัดวางส่วนที่อยู่ภายใน Row ไปทางขวา
                                        children: [
                                          Container(
                                              width: 100,
                                              height: 40,
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      zoomData.removeAt(index);
                                                    });
                                                  Navigator.of(context).pop();
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(
                                                      content: Text('ลบข้อมูลสำเร็จ'),
                                                      backgroundColor: Colors.green,
                                                    ),
                                                  );
                                                  },
                                                  style: ElevatedButton
                                                      .styleFrom(
                                                          backgroundColor:
                                                              Colors
                                                                  .green),
                                                  child: Text(
                                                    'Yes',
                                                    style: TextStyle(
                                                        fontSize: 18),
                                                  )),
                                            ),
                                          SizedBox(width: 20), // เพิ่มระยะห่างระหว่างปุ่ม
                                          Container(
                                            width: 100,
                                            height: 40,
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(
                                                          context)
                                                      .pop();
                                                },
                                                style: ElevatedButton
                                                    .styleFrom(
                                                        backgroundColor:
                                                            Colors.red),
                                                child: Text(
                                                    'No',
                                                    style: TextStyle(
                                                        fontSize:
                                                            18))),
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                              )
                                  
                                 
                              
                                // Add more action buttons as needed
                            );
                          },
                        );
                        }
                      },
                      tooltip: 'Delete',
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _onBranchSelected(String? value) {
    setState(() {
      _selectedBranch = value;
      _selectedType = null;
      // _selectedRoom = null;
      // _selectedCarType = null; // Reset selected car type
      // _selectedCar = null;
      //  _selectedZoom = null;
      //_RoomDropdown();
    });
  }

  void _onTypeSelected(value) {
    setState(() {
      _selectedType = value;
    });
  }

  void _loadData() {
    setState(() {
      if (_selectedBranch != null && _selectedType != null) {
        // โหลดข้อมูลของสาขาที่เลือกมาแสดง
        // ตัวอย่างเช่นโหลด roomData, carData, zoomData
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('กรุณาเลือกสาขาและประเภท'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    });
  }

  // void _RoomDropdown() {
  //   // setState(() {
  //   if (_selectedBranch == 'R9') {
  //     roomData = [];
  //   } else if (_selectedBranch == 'R8') {
  //     roomData = [];
  //   } else if (_selectedBranch == 'VM') {
  //     roomData = [];
  //   } else if (_selectedBranch == 'CA') {
  //     roomData = [];
  //   }
  //   // });
  // }

  // void _ZoomDropdown() {
  //   // setState(() {
  //   if (_selectedBranch == 'R9') {
  //     zoomData = [];
  //   } else if (_selectedBranch == 'R8') {
  //     zoomData = [];
  //   } else if (_selectedBranch == 'VM') {
  //     zoomData = [];
  //   } else if (_selectedBranch == 'CA') {
  //     zoomData = [];
  //   }
  //   // });
  // }

  // void _CarDropdown(String? carType) {
  //   // setState(() {
  //   if (_selectedBranch == 'R9') {
  //     carData = [];
  //   } else if (_selectedBranch == 'R8') {
  //     carData = [];
  //   } else if (_selectedBranch == 'VM') {
  //     carData = [];
  //   } else if (_selectedBranch == 'CA') {
  //     carData = [];
  //   }
  //   // });
  // }

  // void _onCarTypeSelected(String? value) {
  //   // setState(() {
  //   _selectedCarType = value;
  //   _selectedCar = null; // Reset selected car
  //   // Clear the list of selected times
  //   _CarDropdown(_selectedCarType); // Update car dropdown options
  //   // });
  // }

  // void _updateCarList() {
  //   // setState(() {
  //   if (_selectedBranch == 'R9') {
  //     carData = [];
  //   } else if (_selectedBranch == 'R8') {
  //     carData = [];
  //   } else if (_selectedBranch == 'VM') {
  //     carData = [];
  //   } else if (_selectedBranch == 'CA') {
  //     carData = [];
  //   }
  //   // });
  // }

  void _onRoomSelected(String? value) {
    // setState(() {
    _selectedRoom = value;
    // });
  }

  void _onCarSelected(String? value) {
    // setState(() {
    _selectedCar = value;
    // });
  }

  void _onZoomSelected(String? value) {
    // setState(() {
    _selectedZoom = value;
    // });
  }
}
