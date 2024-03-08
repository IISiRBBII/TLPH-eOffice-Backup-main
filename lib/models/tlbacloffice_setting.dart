// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class backOfficeSettingModel {
String tlbackoffice_setting_id;
String tlbackoffice_setting_site;
String tlbackoffice_setting_type;
String tlbackoffice_setting_name;
String tlbackoffice_setting_subtype;
String tlbackoffice_setting_comment;
String tlbackoffice_setting_create_datetime;
String tlbackoffice_setting_create_by;
String tlbackoffice_setting_status;
String tlbackoffice_setting_modify_datetime;
String tlbackoffice_setting_modify_by;
  backOfficeSettingModel({
    required this.tlbackoffice_setting_id,
    required this.tlbackoffice_setting_site,
    required this.tlbackoffice_setting_type,
    required this.tlbackoffice_setting_name,
    required this.tlbackoffice_setting_subtype,
    required this.tlbackoffice_setting_comment,
    required this.tlbackoffice_setting_create_datetime,
    required this.tlbackoffice_setting_create_by,
    required this.tlbackoffice_setting_status,
    required this.tlbackoffice_setting_modify_datetime,
    required this.tlbackoffice_setting_modify_by,
  });

  backOfficeSettingModel copyWith({
    String? tlbackoffice_setting_id,
    String? tlbackoffice_setting_site,
    String? tlbackoffice_setting_type,
    String? tlbackoffice_setting_name,
    String? tlbackoffice_setting_subtype,
    String? tlbackoffice_setting_comment,
    String? tlbackoffice_setting_create_datetime,
    String? tlbackoffice_setting_create_by,
    String? tlbackoffice_setting_status,
    String? tlbackoffice_setting_modify_datetime,
    String? tlbackoffice_setting_modify_by,
  }) {
    return backOfficeSettingModel(
      tlbackoffice_setting_id: tlbackoffice_setting_id ?? this.tlbackoffice_setting_id,
      tlbackoffice_setting_site: tlbackoffice_setting_site ?? this.tlbackoffice_setting_site,
      tlbackoffice_setting_type: tlbackoffice_setting_type ?? this.tlbackoffice_setting_type,
      tlbackoffice_setting_name: tlbackoffice_setting_name ?? this.tlbackoffice_setting_name,
      tlbackoffice_setting_subtype: tlbackoffice_setting_subtype ?? this.tlbackoffice_setting_subtype,
      tlbackoffice_setting_comment: tlbackoffice_setting_comment ?? this.tlbackoffice_setting_comment,
      tlbackoffice_setting_create_datetime: tlbackoffice_setting_create_datetime ?? this.tlbackoffice_setting_create_datetime,
      tlbackoffice_setting_create_by: tlbackoffice_setting_create_by ?? this.tlbackoffice_setting_create_by,
      tlbackoffice_setting_status: tlbackoffice_setting_status ?? this.tlbackoffice_setting_status,
      tlbackoffice_setting_modify_datetime: tlbackoffice_setting_modify_datetime ?? this.tlbackoffice_setting_modify_datetime,
      tlbackoffice_setting_modify_by: tlbackoffice_setting_modify_by ?? this.tlbackoffice_setting_modify_by,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tlbackoffice_setting_id': tlbackoffice_setting_id,
      'tlbackoffice_setting_site': tlbackoffice_setting_site,
      'tlbackoffice_setting_type': tlbackoffice_setting_type,
      'tlbackoffice_setting_name': tlbackoffice_setting_name,
      'tlbackoffice_setting_subtype': tlbackoffice_setting_subtype,
      'tlbackoffice_setting_comment': tlbackoffice_setting_comment,
      'tlbackoffice_setting_create_datetime': tlbackoffice_setting_create_datetime,
      'tlbackoffice_setting_create_by': tlbackoffice_setting_create_by,
      'tlbackoffice_setting_status': tlbackoffice_setting_status,
      'tlbackoffice_setting_modify_datetime': tlbackoffice_setting_modify_datetime,
      'tlbackoffice_setting_modify_by': tlbackoffice_setting_modify_by,
    };
  }

  factory backOfficeSettingModel.fromMap(Map<String, dynamic> map) {
    return backOfficeSettingModel(
      tlbackoffice_setting_id: map['tlbackoffice_setting_id'] as String,
      tlbackoffice_setting_site: map['tlbackoffice_setting_site'] as String,
      tlbackoffice_setting_type: map['tlbackoffice_setting_type'] as String,
      tlbackoffice_setting_name: map['tlbackoffice_setting_name'] as String,
      tlbackoffice_setting_subtype: map['tlbackoffice_setting_subtype'] as String,
      tlbackoffice_setting_comment: map['tlbackoffice_setting_comment'] as String,
      tlbackoffice_setting_create_datetime: map['tlbackoffice_setting_create_datetime'] as String,
      tlbackoffice_setting_create_by: map['tlbackoffice_setting_create_by'] as String,
      tlbackoffice_setting_status: map['tlbackoffice_setting_status'] as String,
      tlbackoffice_setting_modify_datetime: map['tlbackoffice_setting_modify_datetime'] as String,
      tlbackoffice_setting_modify_by: map['tlbackoffice_setting_modify_by'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory backOfficeSettingModel.fromJson(String source) => backOfficeSettingModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'backOfficeSettingModel(tlbackoffice_setting_id: $tlbackoffice_setting_id, tlbackoffice_setting_site: $tlbackoffice_setting_site, tlbackoffice_setting_type: $tlbackoffice_setting_type, tlbackoffice_setting_name: $tlbackoffice_setting_name, tlbackoffice_setting_subtype: $tlbackoffice_setting_subtype, tlbackoffice_setting_comment: $tlbackoffice_setting_comment, tlbackoffice_setting_create_datetime: $tlbackoffice_setting_create_datetime, tlbackoffice_setting_create_by: $tlbackoffice_setting_create_by, tlbackoffice_setting_status: $tlbackoffice_setting_status, tlbackoffice_setting_modify_datetime: $tlbackoffice_setting_modify_datetime, tlbackoffice_setting_modify_by: $tlbackoffice_setting_modify_by)';
  }

  @override
  bool operator ==(covariant backOfficeSettingModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.tlbackoffice_setting_id == tlbackoffice_setting_id &&
      other.tlbackoffice_setting_site == tlbackoffice_setting_site &&
      other.tlbackoffice_setting_type == tlbackoffice_setting_type &&
      other.tlbackoffice_setting_name == tlbackoffice_setting_name &&
      other.tlbackoffice_setting_subtype == tlbackoffice_setting_subtype &&
      other.tlbackoffice_setting_comment == tlbackoffice_setting_comment &&
      other.tlbackoffice_setting_create_datetime == tlbackoffice_setting_create_datetime &&
      other.tlbackoffice_setting_create_by == tlbackoffice_setting_create_by &&
      other.tlbackoffice_setting_status == tlbackoffice_setting_status &&
      other.tlbackoffice_setting_modify_datetime == tlbackoffice_setting_modify_datetime &&
      other.tlbackoffice_setting_modify_by == tlbackoffice_setting_modify_by;
  }

  @override
  int get hashCode {
    return tlbackoffice_setting_id.hashCode ^
      tlbackoffice_setting_site.hashCode ^
      tlbackoffice_setting_type.hashCode ^
      tlbackoffice_setting_name.hashCode ^
      tlbackoffice_setting_subtype.hashCode ^
      tlbackoffice_setting_comment.hashCode ^
      tlbackoffice_setting_create_datetime.hashCode ^
      tlbackoffice_setting_create_by.hashCode ^
      tlbackoffice_setting_status.hashCode ^
      tlbackoffice_setting_modify_datetime.hashCode ^
      tlbackoffice_setting_modify_by.hashCode;
  }
}
