import 'package:eOffice/models/tlbacloffice_setting.dart';

class BackOfficeMockup {
  final ldata;
  List<Map<String, String>> room = [
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
  ];

  BackOfficeMockup( this.ldata) {
    // เก็บข้อมูลจากลิสต์ room ไปยังโมเดล backOfficeSettingModel
    for (Map<String, String> roomData in room) {
      backOfficeSettingModel roomModel = backOfficeSettingModel(
        tlbackoffice_setting_id: roomData['idroom'] ?? '',
        tlbackoffice_setting_type: 'Room',
        tlbackoffice_setting_name: roomData['room'] ?? '',
        tlbackoffice_setting_subtype: '',
        tlbackoffice_setting_comment: '',
        tlbackoffice_setting_create_datetime: '',
        tlbackoffice_setting_create_by: '',
        tlbackoffice_setting_status: '',
        tlbackoffice_setting_modify_datetime: '',
        tlbackoffice_setting_modify_by: '',
        tlbackoffice_setting_site: '+',
      );

      // ทำอะไรกับ roomModel ต่อไป
    }
  }
}
