// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class queueModel {
   String id;
  String type;
  String unitId;
  String branch;
  String carType;
  String unit;
  String day;
  String startTime;
  String startTimeMinute;
  String endTime;
  String endTimeMinute;
  String notation;
  queueModel({
    required this.id,
    required this.type,
    required this.unitId,
    required this.branch,
    required this.carType,
    required this.unit,
    required this.day,
    required this.startTime,
    required this.startTimeMinute,
    required this.endTime,
    required this.endTimeMinute,
    required this.notation,
  });

  queueModel copyWith({
    String? id,
    String? type,
    String? unitId,
    String? branch,
    String? carType,
    String? unit,
    String? day,
    String? startTime,
    String? startTimeMinute,
    String? endTime,
    String? endTimeMinute,
    String? notation,
  }) {
    return queueModel(
      id: id ?? this.id,
      type: type ?? this.type,
      unitId: unitId ?? this.unitId,
      branch: branch ?? this.branch,
      carType: carType ?? this.carType,
      unit: unit ?? this.unit,
      day: day ?? this.day,
      startTime: startTime ?? this.startTime,
      startTimeMinute: startTimeMinute ?? this.startTimeMinute,
      endTime: endTime ?? this.endTime,
      endTimeMinute: endTimeMinute ?? this.endTimeMinute,
      notation: notation ?? this.notation,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'type': type,
      'unitId': unitId,
      'branch': branch,
      'carType': carType,
      'unit': unit,
      'day': day,
      'startTime': startTime,
      'startTimeMinute': startTimeMinute,
      'endTime': endTime,
      'endTimeMinute': endTimeMinute,
      'notation': notation,
    };
  }

  factory queueModel.fromMap(Map<String, dynamic> map) {
    return queueModel(
      id: map['id'] as String,
      type: map['type'] as String,
      unitId: map['unitId'] as String,
      branch: map['branch'] as String,
      carType: map['carType'] as String,
      unit: map['unit'] as String,
      day: map['day'] as String,
      startTime: map['startTime'] as String,
      startTimeMinute: map['startTimeMinute'] as String,
      endTime: map['endTime'] as String,
      endTimeMinute: map['endTimeMinute'] as String,
      notation: map['notation'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory queueModel.fromJson(String source) => queueModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'queueModel(id: $id, type: $type, unitId: $unitId, branch: $branch, carType: $carType, unit: $unit, day: $day, startTime: $startTime, startTimeMinute: $startTimeMinute, endTime: $endTime, endTimeMinute: $endTimeMinute, notation: $notation)';
  }

  @override
  bool operator ==(covariant queueModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.type == type &&
      other.unitId == unitId &&
      other.branch == branch &&
      other.carType == carType &&
      other.unit == unit &&
      other.day == day &&
      other.startTime == startTime &&
      other.startTimeMinute == startTimeMinute &&
      other.endTime == endTime &&
      other.endTimeMinute == endTimeMinute &&
      other.notation == notation;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      type.hashCode ^
      unitId.hashCode ^
      branch.hashCode ^
      carType.hashCode ^
      unit.hashCode ^
      day.hashCode ^
      startTime.hashCode ^
      startTimeMinute.hashCode ^
      endTime.hashCode ^
      endTimeMinute.hashCode ^
      notation.hashCode;
  }
}
