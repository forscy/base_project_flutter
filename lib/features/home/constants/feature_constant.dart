import 'package:base_project_flutter/features/home/models/feature_item_model.dart';
import 'package:flutter/material.dart';
List<FeatureItemModel> featuresMahasiswa = [
  FeatureItemModel(
    icon: Icons.check_circle,
    title: 'Kehadiran',
    color: const Color.fromARGB(255, 243, 33, 89),
    route:'',
  ),
  FeatureItemModel(
    icon: Icons.event_note,
    title: 'Aktivitas',
    color: Colors.blue,
    route:'',
  ),
  FeatureItemModel(
    icon: Icons.description,
    title: 'Materi',
    color: Colors.green,
    route:'',
  ),
  FeatureItemModel(
    icon: Icons.assignment,
    title: 'Resume',
    color: Colors.orange,
    route:'',
  ),
  FeatureItemModel(
    icon: Icons.menu_book,
    title: 'Hafalan',
    color: Colors.purple,
    route:'',
  ),
  FeatureItemModel(
    icon: Icons.fact_check,
    title: 'Konfirmasi Hafalan',
    color: Colors.teal,
    route:'',
  ),
  FeatureItemModel(
    icon: Icons.bar_chart,
    title: 'Nilai',
    color: Colors.red,
    route:'',
  ),
  FeatureItemModel(
    icon: Icons.groups,
    title: 'Kelompok',
    color: Colors.indigo,
    route:'',
  ),
];

List<FeatureItemModel> featuresAdmin = [
  FeatureItemModel(
    icon: Icons.dashboard,
    title: 'Dashboard',
    color: Colors.blue,
    route:'',
  ),
  FeatureItemModel(
    icon: Icons.people,
    title: 'Kelola User',
    color: Colors.green,
    route:'',
  ),
  FeatureItemModel(
    icon: Icons.event_note,
    title: 'Kelola Aktivitas',
    color: Colors.orange,
    route:'',
  ),
  FeatureItemModel(
    icon: Icons.groups,
    title: 'Kelola Kelompok',
    color: Colors.purple,
    route:'',
  ),
];

List<FeatureItemModel> featuresPanitia = [
  FeatureItemModel(
    icon: Icons.dashboard,
    title: 'Dashboard',
    color: Colors.blue,
    route:'',
  ),
  FeatureItemModel(
    icon: Icons.fact_check,
    title: 'Konfirmasi Absensi',
    color: Colors.green,
    route:'',
  ),
  FeatureItemModel(
    icon: Icons.file_present,
    title: 'Kelola File',
    color: Colors.orange,
    route:''
  ),
];

// Get feature list based on user role
List<FeatureItemModel> getFeatureList(String role) {
  switch (role) {
    case 'mahasiswa':
      return featuresMahasiswa;
    case 'admin':
      return featuresAdmin;
    case 'panitia':
      return featuresPanitia;
    default:
      return [];
  }
}