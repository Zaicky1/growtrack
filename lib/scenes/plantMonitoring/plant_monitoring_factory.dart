import 'package:flutter/widgets.dart';
import 'plant_monitoring_service.dart';
import 'plant_monitoring_view_model.dart';
import 'plant_monitoring_view.dart';

class PlantMonitoringFactory {
  static Widget make() {
    final service = PlantMonitoringServiceImpl();
    final viewModel = PlantMonitoringViewModel(service);
    viewModel.loadDashboard();
    return PlantMonitoringView(viewModel: viewModel);
  }
}
