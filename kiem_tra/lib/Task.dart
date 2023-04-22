import 'dart:core';
import 'package:flutter/material.dart';

enum Repeat { Daily, Weekly, Monthly }

final List<String> remindTime = [
  "10 minutes early",
  "30 minutes early",
  "1 hour early"
];
final List<Color> colorChoice = [
  Colors.red,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.purple
];

class Task {
  String title = "New task";
  DateTime startTime;
  DateTime endTime;
  DateTime deadline;
  bool isFavourite;
  bool isCompleted;
  Repeat repeat;
  Color color;

  Task(
      {required this.title,
      required this.startTime,
      required this.endTime,
      required this.deadline,
      required this.isCompleted,
      required this.isFavourite,
      required this.repeat,
      required this.color});
}

List<Task> tasks = [];
