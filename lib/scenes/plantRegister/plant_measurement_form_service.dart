import '../Monitoring/plant_monitoring_service.dart';

class PlantMeasurementFormService {
  /// Valida os dados do formulário
  String? validateHeight(String? value) {
    if (value == null || value.isEmpty) {
      return 'Informe a altura';
    }
    final parsed = double.tryParse(value);
    if (parsed == null) {
      return 'Altura deve ser um número válido';
    }
    if (parsed <= 0) {
      return 'Altura deve ser maior que zero';
    }
    return null;
  }

  String? validateTemperature(String? value) {
    if (value == null || value.isEmpty) {
      return 'Informe a temperatura';
    }
    final parsed = double.tryParse(value);
    if (parsed == null) {
      return 'Temperatura deve ser um número válido';
    }
    return null;
  }

  String? validateHumidity(String? value) {
    if (value == null || value.isEmpty) {
      return 'Informe a umidade';
    }
    final parsed = double.tryParse(value);
    if (parsed == null) {
      return 'Umidade deve ser um número válido';
    }
    if (parsed < 0 || parsed > 100) {
      return 'Umidade deve estar entre 0 e 100%';
    }
    return null;
  }

  /// Cria uma nova medição a partir dos dados do formulário
  PlantMeasurement createMeasurement({
    required String heightText,
    required String temperatureText,
    required String humidityText,
    required String notesText,
    required PlantPhase phase,
    required bool watered,
  }) {
    return PlantMeasurement(
      date: DateTime.now(),
      heightCm: double.parse(heightText),
      temperature: double.parse(temperatureText),
      humidity: double.parse(humidityText),
      notes: notesText,
      phase: phase,
      watered: watered,
    );
  }
}
