import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'bp_reading.g.dart';

@HiveType(typeId: 0)
class BPReading extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final int systolic;

  @HiveField(2)
  final int diastolic;

  @HiveField(3)
  final int pulse;

  @HiveField(4)
  final DateTime recordedAt;

  @HiveField(5)
  final String? notes;

  @HiveField(6)
  final String? position; // Sitting, Standing, Lying

  BPReading({
    required this.id,
    required this.systolic,
    required this.diastolic,
    required this.pulse,
    required this.recordedAt,
    this.notes,
    this.position,
  });

  String get category {
    if (systolic < 120 && diastolic < 80) return "Normal";
    if (systolic < 130 && diastolic < 80) return "Elevated";
    if (systolic < 140 && diastolic < 90) return "Stage 1";
    return "Stage 2 / Crisis";
  }

  Color get categoryColor {
    if (systolic < 120 && diastolic < 80) return Colors.green;
    if (systolic < 130 && diastolic < 80) return Colors.orange;
    return Colors.red;
  }
}