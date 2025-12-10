import 'package:flutter/material.dart';
import '../resources/shared/app_coordinator.dart';
import '../scenes/Login/login_factory.dart';
import '../scenes/Monitoring/plant_monitoring_factory.dart';

void main() {
  runApp(const GrowTrackApp());
}

class GrowTrackApp extends StatelessWidget {
  const GrowTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    final coordinator = AppCoordinator();

    return MaterialApp(
      title: 'GrowTrack',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      navigatorKey: coordinator.navigatorKey,
      routes: {
        '/login': (context) => LoginFactory.make(coordinator: coordinator),
        '/monitoring': (context) => PlantMonitoringFactory.make(),
      },
      home: LoginFactory.make(coordinator: coordinator),
    );
  }
}
