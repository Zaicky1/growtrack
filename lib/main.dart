import 'package:flutter/material.dart';
import 'scenes/plantMonitoring/plant_monitoring_factory.dart';

void main() {
  runApp(const GrowTrackApp());
}

class GrowTrackApp extends StatelessWidget {
  const GrowTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GrowTrack',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: PlantMonitoringFactory.make(),
    );
  }
}
