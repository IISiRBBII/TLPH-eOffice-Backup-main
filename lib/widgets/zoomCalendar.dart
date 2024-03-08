import 'package:eOffice/models/reserveModel.dart';
import 'package:flutter/material.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class zoomCalendarWidget extends StatefulWidget {
  final List<queueModel> lGetQueue;
  final String headerText;

  const zoomCalendarWidget(
      {Key? key, required this.lGetQueue, required this.headerText})
      : super(key: key);

  @override
  State<zoomCalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<zoomCalendarWidget> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 205,
      right: 5,
      top: 55,
      bottom: 1,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          scale: 0.5,
          opacity: 0.11,
          image: AssetImage('assets/images/logo.png'),
        )),
        child: SfCalendar(
          view: CalendarView.week,
          headerHeight: 50,
          showTodayButton: true,
          dataSource: _lGetCalendarDataSource(widget.lGetQueue),
          appointmentBuilder:
              (BuildContext context, CalendarAppointmentDetails details) {
            final Appointment appointment = details.appointments.first;
            if (widget.headerText == 'Meeting Rooms' &&
                appointment.type != 'room') {
              return SizedBox();
            } else if (widget.headerText == 'Car' &&
                appointment.type != 'car') {
              return SizedBox();
            } else if (widget.headerText == 'Zoom' &&
                appointment.type != 'zoom') {
              return SizedBox();
            }
            return JustTheTooltip(
              content: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 130,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 4, bottom: 4),
                        child: Text('ID : ${appointment.id}'),
                      ),
                    ),
                    Container(
                      width: 130,
                      decoration: BoxDecoration(
                          border: Border(top: BorderSide(width: 1))),
                      child: Padding(
                        padding: EdgeInsets.only(top: 4, bottom: 4),
                        child: Text('ผู้จอง : '),
                      ),
                    ),
                    Container(
                      width: 130,
                      decoration: BoxDecoration(
                          border: Border(top: BorderSide(width: 1))),
                      child: Padding(
                        padding: EdgeInsets.only(top: 4, bottom: 4),
                        child: Text('เลข Zoom : ${appointment.unitId}'),
                      ),
                    ),
                    Container(
                      width: 130,
                      decoration: BoxDecoration(
                          border: Border(top: BorderSide(width: 1))),
                      child: Padding(
                        padding: EdgeInsets.only(top: 4, bottom: 4),
                        child: Text('ห้อง Zoom: ${appointment.unit}'),
                      ),
                    ),
                    Container(
                      width: 130,
                      decoration: BoxDecoration(
                          border: Border(top: BorderSide(width: 1))),
                      child: Padding(
                        padding: EdgeInsets.only(top: 4, bottom: 4),
                        child: Text('หมายเหตุ : ${appointment.notation}'),
                      ),
                    )
                  ],
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border(
                    left: BorderSide(width: 5, color: appointment.boxColor),
                    // bottom:
                    //     BorderSide(width: 5, color: appointment.boxColor)
                  ),
                  color: appointment.boxColor.withOpacity(0.5),
                ),
                child: SizedBox(
                  child: widget.lGetQueue.length > 2
                      ? null
                      : Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${appointment.unit}',
                              style: TextStyle(
                                  inherit: false,
                                  fontFamily: 'Mitr',
                                  color: Colors.black,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

CalendarDataSource _lGetCalendarDataSource(List<queueModel> lGetQueue) {
  List<Appointment> appointments = [];

  for (var qu in lGetQueue) {
    if (qu.type == 'zoom') {
      var testDate11 = DateTime.parse(qu.day);
      int yyyy = testDate11.year;
      int mm = testDate11.month;
      int dd = testDate11.day;
      int startTime = int.parse(qu.startTime);
      int startTimeMinute = int.parse(qu.startTimeMinute);
      int endTime = int.parse(qu.endTime);
      int endTimeMinute = int.parse(qu.endTimeMinute);

      appointments.add(Appointment(
        startTime: DateTime(yyyy, mm, dd, startTime, startTimeMinute),
        endTime: DateTime(yyyy, mm, dd, endTime, endTimeMinute),
        subject: '${qu.branch}\n${qu.unitId}\n${qu.unit}\n${qu.notation}',
        notation: qu.notation,
        id: qu.id,
        type: qu.type,
        unitId: qu.unitId,
        unit: qu.unit,
        boxColor: Colors.blue, // เปลี่ยนสีตามต้องการ
      ));
    }
  }
  return AppointmentDataSource(appointments);
}

class AppointmentDataSource extends CalendarDataSource {
  AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments?[index].startTime;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments?[index].endTime;
  }

  @override
  String getSubject(int index) {
    return appointments?[index].subject;
  }
}

class Appointment {
  final DateTime startTime;
  final DateTime endTime;
  final String subject;
  final String notation;
  final String id;
  final String type;
  final String unitId;
  final String unit;
  final Color boxColor;

  Appointment({
    required this.startTime,
    required this.endTime,
    required this.subject,
    required this.notation,
    required this.id,
    required this.type,
    required this.unit,
    required this.unitId,
    required this.boxColor,
  });
}
