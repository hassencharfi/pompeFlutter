 
import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
 import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:pump_control/home_view.dart';
import 'package:pump_control/login_view.dart';
import 'package:pump_control/register_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'dart:async'; 
import 'bar.dart';
import 'custom_appbar.dart';
import 'main.dart'; 
class AlarmPicker extends StatefulWidget {
  @override
  _AlarmPickerState createState() => _AlarmPickerState();
}

class _AlarmPickerState extends State<AlarmPicker> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.0,
      child: Column(
        children: [
          DropdownButton<String>(
            value: selectedDay,
            items: <String>[
              'Monday',
              'Tuesday',
              'Wednesday',
              'Thursday',
              'Friday',
              'Saturday',
              'Sunday'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedDay = newValue!;
              });
            },
          ),
          ListTile(
            title: Text('Start Time'),
            trailing: TextButton(
              onPressed: () async {
                final TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: startTime,
                );
                if (pickedTime != null) {
                  setState(() {
                    startTime = pickedTime;
                  });
                }
              },
              child: Text(startTime.format(context)),
            ),
          ),
          ListTile(
            title: Text('End Time'),
            trailing: TextButton(
              onPressed: () async {
                final TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: endTime,
                );
                if (pickedTime != null) {
                  setState(() {
                    endTime = pickedTime;
                  });
                }
              },
              child: Text(endTime.format(context)),
            ),
          ),
          ListTile(
            title: Text('Select Date'),
            trailing: TextButton(
              onPressed: () async {
                final DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  setState(() {
                    selectedDate = pickedDate;
                  });
                }
              },
              child: Text(DateFormat('yyyy-MM-dd').format(selectedDate)),
            ),
          ),
          ListTile(
            title: Text('Select Time'),
            trailing: TextButton(
              onPressed: () async {
                final TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: selectedTime,
                );
                if (pickedTime != null) {
                  setState(() {
                    selectedTime = pickedTime;
                  });
                }
              },
              child: Text(selectedTime.format(context)),
            ),
          ),
          ListTile(
            title: Text('Select Duration'),
            trailing: DropdownButton<Duration>(
              value: selectedDuration,
              items: <Duration>[
                Duration(minutes: 15),
                Duration(minutes: 30),
                Duration(hours: 1),
                Duration(hours: 2),
                Duration(hours: 3),
                Duration(hours: 4),
                Duration(hours: 6),
                Duration(hours: 8),
                Duration(hours: 12),
                Duration(days: 1),
                Duration(days: 2),
                Duration(days: 3),
                Duration(days: 7),
              ].map<DropdownMenuItem<Duration>>((Duration value) {
                return DropdownMenuItem<Duration>(
                  value: value,
                  child: Text(value.inHours > 1 ? '${value.inHours} hours' : '${value.inMinutes} minutes'),
                );
              }).toList(),
              onChanged: (Duration? newValue) {
                setState(() {
                  selectedDuration = newValue!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
