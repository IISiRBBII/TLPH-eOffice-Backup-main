// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class backOffice {
  String tlbackoffice_id;
  String tlbackoffice_setting_type;
  String tlbackoffice_setting_id;
  String tlbackoffice_site;
  String tlbackoffice_setting_subtype;
  String tlbackoffice_setting_comment;
  String tlbackoffice_reserve_date;
  String tlbackoffice_starthour;
  String tlbackoffice_startminute;
  String tlbackoffice_endhour;
  String tlbackoffice_endminute;
  String tlbackoffice_comment;
  String tlbackoffice_create_datetime;
  String tlbackoffice_create_by;
  String tlbackoffice_create_by_fullname;
  String tlbackoffice_status;
  String tlbackoffice_modify_datetime;
  String tlbackoffice_modify_by;
  backOffice({
    required this.tlbackoffice_id,
    required this.tlbackoffice_setting_type,
    required this.tlbackoffice_setting_id,
    required this.tlbackoffice_site,
    required this.tlbackoffice_setting_subtype,
    required this.tlbackoffice_setting_comment,
    required this.tlbackoffice_reserve_date,
    required this.tlbackoffice_starthour,
    required this.tlbackoffice_startminute,
    required this.tlbackoffice_endhour,
    required this.tlbackoffice_endminute,
    required this.tlbackoffice_comment,
    required this.tlbackoffice_create_datetime,
    required this.tlbackoffice_create_by,
    required this.tlbackoffice_create_by_fullname,
    required this.tlbackoffice_status,
    required this.tlbackoffice_modify_datetime,
    required this.tlbackoffice_modify_by,
  });

  backOffice copyWith({
    String? tlbackoffice_id,
    String? tlbackoffice_setting_type,
    String? tlbackoffice_setting_id,
    String? tlbackoffice_site,
    String? tlbackoffice_setting_subtype,
    String? tlbackoffice_setting_comment,
    String? tlbackoffice_reserve_date,
    String? tlbackoffice_starthour,
    String? tlbackoffice_startminute,
    String? tlbackoffice_endhour,
    String? tlbackoffice_endminute,
    String? tlbackoffice_comment,
    String? tlbackoffice_create_datetime,
    String? tlbackoffice_create_by,
    String? tlbackoffice_create_by_fullname,
    String? tlbackoffice_status,
    String? tlbackoffice_modify_datetime,
    String? tlbackoffice_modify_by,
  }) {
    return backOffice(
      tlbackoffice_id: tlbackoffice_id ?? this.tlbackoffice_id,
      tlbackoffice_setting_type: tlbackoffice_setting_type ?? this.tlbackoffice_setting_type,
      tlbackoffice_setting_id: tlbackoffice_setting_id ?? this.tlbackoffice_setting_id,
      tlbackoffice_site: tlbackoffice_site ?? this.tlbackoffice_site,
      tlbackoffice_setting_subtype: tlbackoffice_setting_subtype ?? this.tlbackoffice_setting_subtype,
      tlbackoffice_setting_comment: tlbackoffice_setting_comment ?? this.tlbackoffice_setting_comment,
      tlbackoffice_reserve_date: tlbackoffice_reserve_date ?? this.tlbackoffice_reserve_date,
      tlbackoffice_starthour: tlbackoffice_starthour ?? this.tlbackoffice_starthour,
      tlbackoffice_startminute: tlbackoffice_startminute ?? this.tlbackoffice_startminute,
      tlbackoffice_endhour: tlbackoffice_endhour ?? this.tlbackoffice_endhour,
      tlbackoffice_endminute: tlbackoffice_endminute ?? this.tlbackoffice_endminute,
      tlbackoffice_comment: tlbackoffice_comment ?? this.tlbackoffice_comment,
      tlbackoffice_create_datetime: tlbackoffice_create_datetime ?? this.tlbackoffice_create_datetime,
      tlbackoffice_create_by: tlbackoffice_create_by ?? this.tlbackoffice_create_by,
      tlbackoffice_create_by_fullname: tlbackoffice_create_by_fullname ?? this.tlbackoffice_create_by_fullname,
      tlbackoffice_status: tlbackoffice_status ?? this.tlbackoffice_status,
      tlbackoffice_modify_datetime: tlbackoffice_modify_datetime ?? this.tlbackoffice_modify_datetime,
      tlbackoffice_modify_by: tlbackoffice_modify_by ?? this.tlbackoffice_modify_by,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tlbackoffice_id': tlbackoffice_id,
      'tlbackoffice_setting_type': tlbackoffice_setting_type,
      'tlbackoffice_setting_id': tlbackoffice_setting_id,
      'tlbackoffice_site': tlbackoffice_site,
      'tlbackoffice_setting_subtype': tlbackoffice_setting_subtype,
      'tlbackoffice_setting_comment': tlbackoffice_setting_comment,
      'tlbackoffice_reserve_date': tlbackoffice_reserve_date,
      'tlbackoffice_starthour': tlbackoffice_starthour,
      'tlbackoffice_startminute': tlbackoffice_startminute,
      'tlbackoffice_endhour': tlbackoffice_endhour,
      'tlbackoffice_endminute': tlbackoffice_endminute,
      'tlbackoffice_comment': tlbackoffice_comment,
      'tlbackoffice_create_datetime': tlbackoffice_create_datetime,
      'tlbackoffice_create_by': tlbackoffice_create_by,
      'tlbackoffice_create_by_fullname': tlbackoffice_create_by_fullname,
      'tlbackoffice_status': tlbackoffice_status,
      'tlbackoffice_modify_datetime': tlbackoffice_modify_datetime,
      'tlbackoffice_modify_by': tlbackoffice_modify_by,
    };
  }

  factory backOffice.fromMap(Map<String, dynamic> map) {
    return backOffice(
      tlbackoffice_id: map['tlbackoffice_id'] as String,
      tlbackoffice_setting_type: map['tlbackoffice_setting_type'] as String,
      tlbackoffice_setting_id: map['tlbackoffice_setting_id'] as String,
      tlbackoffice_site: map['tlbackoffice_site'] as String,
      tlbackoffice_setting_subtype: map['tlbackoffice_setting_subtype'] as String,
      tlbackoffice_setting_comment: map['tlbackoffice_setting_comment'] as String,
      tlbackoffice_reserve_date: map['tlbackoffice_reserve_date'] as String,
      tlbackoffice_starthour: map['tlbackoffice_starthour'] as String,
      tlbackoffice_startminute: map['tlbackoffice_startminute'] as String,
      tlbackoffice_endhour: map['tlbackoffice_endhour'] as String,
      tlbackoffice_endminute: map['tlbackoffice_endminute'] as String,
      tlbackoffice_comment: map['tlbackoffice_comment'] as String,
      tlbackoffice_create_datetime: map['tlbackoffice_create_datetime'] as String,
      tlbackoffice_create_by: map['tlbackoffice_create_by'] as String,
      tlbackoffice_create_by_fullname: map['tlbackoffice_create_by_fullname'] as String,
      tlbackoffice_status: map['tlbackoffice_status'] as String,
      tlbackoffice_modify_datetime: map['tlbackoffice_modify_datetime'] as String,
      tlbackoffice_modify_by: map['tlbackoffice_modify_by'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory backOffice.fromJson(String source) => backOffice.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'backOffice(tlbackoffice_id: $tlbackoffice_id, tlbackoffice_setting_type: $tlbackoffice_setting_type, tlbackoffice_setting_id: $tlbackoffice_setting_id, tlbackoffice_site: $tlbackoffice_site, tlbackoffice_setting_subtype: $tlbackoffice_setting_subtype, tlbackoffice_setting_comment: $tlbackoffice_setting_comment, tlbackoffice_reserve_date: $tlbackoffice_reserve_date, tlbackoffice_starthour: $tlbackoffice_starthour, tlbackoffice_startminute: $tlbackoffice_startminute, tlbackoffice_endhour: $tlbackoffice_endhour, tlbackoffice_endminute: $tlbackoffice_endminute, tlbackoffice_comment: $tlbackoffice_comment, tlbackoffice_create_datetime: $tlbackoffice_create_datetime, tlbackoffice_create_by: $tlbackoffice_create_by, tlbackoffice_create_by_fullname: $tlbackoffice_create_by_fullname, tlbackoffice_status: $tlbackoffice_status, tlbackoffice_modify_datetime: $tlbackoffice_modify_datetime, tlbackoffice_modify_by: $tlbackoffice_modify_by)';
  }

  @override
  bool operator ==(covariant backOffice other) {
    if (identical(this, other)) return true;
  
    return 
      other.tlbackoffice_id == tlbackoffice_id &&
      other.tlbackoffice_setting_type == tlbackoffice_setting_type &&
      other.tlbackoffice_setting_id == tlbackoffice_setting_id &&
      other.tlbackoffice_site == tlbackoffice_site &&
      other.tlbackoffice_setting_subtype == tlbackoffice_setting_subtype &&
      other.tlbackoffice_setting_comment == tlbackoffice_setting_comment &&
      other.tlbackoffice_reserve_date == tlbackoffice_reserve_date &&
      other.tlbackoffice_starthour == tlbackoffice_starthour &&
      other.tlbackoffice_startminute == tlbackoffice_startminute &&
      other.tlbackoffice_endhour == tlbackoffice_endhour &&
      other.tlbackoffice_endminute == tlbackoffice_endminute &&
      other.tlbackoffice_comment == tlbackoffice_comment &&
      other.tlbackoffice_create_datetime == tlbackoffice_create_datetime &&
      other.tlbackoffice_create_by == tlbackoffice_create_by &&
      other.tlbackoffice_create_by_fullname == tlbackoffice_create_by_fullname &&
      other.tlbackoffice_status == tlbackoffice_status &&
      other.tlbackoffice_modify_datetime == tlbackoffice_modify_datetime &&
      other.tlbackoffice_modify_by == tlbackoffice_modify_by;
  }

  @override
  int get hashCode {
    return tlbackoffice_id.hashCode ^
      tlbackoffice_setting_type.hashCode ^
      tlbackoffice_setting_id.hashCode ^
      tlbackoffice_site.hashCode ^
      tlbackoffice_setting_subtype.hashCode ^
      tlbackoffice_setting_comment.hashCode ^
      tlbackoffice_reserve_date.hashCode ^
      tlbackoffice_starthour.hashCode ^
      tlbackoffice_startminute.hashCode ^
      tlbackoffice_endhour.hashCode ^
      tlbackoffice_endminute.hashCode ^
      tlbackoffice_comment.hashCode ^
      tlbackoffice_create_datetime.hashCode ^
      tlbackoffice_create_by.hashCode ^
      tlbackoffice_create_by_fullname.hashCode ^
      tlbackoffice_status.hashCode ^
      tlbackoffice_modify_datetime.hashCode ^
      tlbackoffice_modify_by.hashCode;
  }
}
