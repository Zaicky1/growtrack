// plant_monitoring_view_model.dart

import 'package:flutter/foundation.dart';
import 'plant_monitoring_service.dart';
import 'plant_models.dart';

class PlantMonitoringViewModel extends ChangeNotifier {
  final PlantMonitoringService service;

  PlantMonitoringViewModel(this.service);

  bool isLoading = false;
  bool isSaving = false;
  String? errorMessage;

  PlantStatus? status;
  List<PlantMeasurement> measurements = [];
  List<CareTip> tips = [];

  Future<void> loadDashboard() async {
    try {
      isLoading = true;
      notifyListeners();

      measurements = await service.getMeasurements();
      status = await service.getCurrentStatus();
    } catch (e) {
      errorMessage = 'Erro ao carregar dados.';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addMeasurement(PlantMeasurement measurement) async {
    try {
      isSaving = true;
      notifyListeners();

      await service.addMeasurement(measurement);
      await loadDashboard();
    } catch (e) {
      errorMessage = 'Erro ao salvar medição.';
    } finally {
      isSaving = false;
      notifyListeners();
    }
  }

  Future<void> loadTipsForCurrentPhase() async {
    if (status == null) return;

    try {
      isLoading = true;
      notifyListeners();

      tips = await service.fetchCareTips(status!.currentPhase);
    } catch (e) {
      errorMessage = 'Erro ao buscar dicas.';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
