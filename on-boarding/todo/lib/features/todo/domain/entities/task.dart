import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TodoTask extends Equatable {
  final String id;
  final String text;
  final String title;
  final String subtitle;
  final String date;
  final bool isCompleted;

  TodoTask({
    required this.id,
    required this.text,
    required this.title,
    required this.subtitle,
    required this.date,
    this.isCompleted = false,
  });

  @override
  List<Object?> get props => [id, text, title, subtitle, date, isCompleted];
}


