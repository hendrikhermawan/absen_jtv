import 'package:flutter/material.dart';
class AttendanceService extends ChangeNotifier {
  DateTime? _checkInTime;
  DateTime? _checkOutTime;

  Future<void> checkIn() async {
    _checkInTime = DateTime.now();
    // Simpan waktu check-in ke database atau penyimpanan lokal
    notifyListeners();
  }

  Future<void> checkOut() async {
    _checkOutTime = DateTime.now();
    // Simpan waktu check-out ke database atau penyimpanan lokal
    notifyListeners();
  }

  DateTime? get checkInTime => _checkInTime;
  DateTime? get checkOutTime => _checkOutTime;
}
