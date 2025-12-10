import 'package:flutter/material.dart';
import '../Monitoring/plant_monitoring_service.dart';
import 'plant_measurement_form_service.dart';

class PlantMeasurementFormViewModel extends ChangeNotifier {
  final PlantMeasurementFormService _service;

  PlantPhase _phase = PlantPhase.vegetative;
  bool _watered = true;

  PlantMeasurementFormViewModel({PlantMeasurementFormService? service})
    : _service = service ?? PlantMeasurementFormService();

  PlantPhase get phase => _phase;
  bool get watered => _watered;

  void setPhase(PlantPhase phase) {
    _phase = phase;
    notifyListeners();
  }

  void setWatered(bool watered) {
    _watered = watered;
    notifyListeners();
  }

  String? validateHeight(String? value) => _service.validateHeight(value);
  String? validateTemperature(String? value) =>
      _service.validateTemperature(value);
  String? validateHumidity(String? value) => _service.validateHumidity(value);

  PlantMeasurement createMeasurement({
    required String heightText,
    required String temperatureText,
    required String humidityText,
    required String notesText,
  }) {
    return _service.createMeasurement(
      heightText: heightText,
      temperatureText: temperatureText,
      humidityText: humidityText,
      notesText: notesText,
      phase: _phase,
      watered: _watered,
    );
  }
}
