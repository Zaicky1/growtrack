// TODO: Change to English later

import 'dart:async';

// ============================================================================
// MODELS
// ============================================================================

enum PlantPhase {
  seedling, // muda
  vegetative,
  flowering,
  drying,
}

class PlantMeasurement {
  final DateTime date;
  final double heightCm;
  final double temperature;
  final double humidity;
  final String notes;
  final PlantPhase phase;
  final bool watered;

  PlantMeasurement({
    required this.date,
    required this.heightCm,
    required this.temperature,
    required this.humidity,
    required this.notes,
    required this.phase,
    required this.watered,
  });
}

class PlantStatus {
  final PlantPhase currentPhase;
  final DateTime? lastWatering;
  final double? lastHeight;
  final Duration? nextWateringIn;

  PlantStatus({
    required this.currentPhase,
    required this.lastWatering,
    required this.lastHeight,
    required this.nextWateringIn,
  });
}

class CareTip {
  final String title;
  final String description;

  CareTip({required this.title, required this.description});
}

// ============================================================================
// SERVICE
// ============================================================================

abstract class PlantMonitoringService {
  Future<List<PlantMeasurement>> getMeasurements();
  Future<void> addMeasurement(PlantMeasurement measurement);
  Future<PlantStatus> getCurrentStatus();
  Future<List<CareTip>> fetchCareTips(PlantPhase phase);
}

class PlantMonitoringServiceImpl implements PlantMonitoringService {
  final List<PlantMeasurement> _measurements = [];

  @override
  Future<List<PlantMeasurement>> getMeasurements() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return List.unmodifiable(_measurements);
  }

  @override
  Future<void> addMeasurement(PlantMeasurement measurement) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _measurements.add(measurement);
  }

  @override
  Future<PlantStatus> getCurrentStatus() async {
    await Future.delayed(const Duration(milliseconds: 300));

    if (_measurements.isEmpty) {
      return PlantStatus(
        currentPhase: PlantPhase.seedling,
        lastWatering: null,
        lastHeight: null,
        nextWateringIn: null,
      );
    }

    _measurements.sort((a, b) => b.date.compareTo(a.date));
    final last = _measurements.first;

    final nextWatering = last.watered
        ? const Duration(days: 2)
        : const Duration(hours: 12);

    return PlantStatus(
      currentPhase: last.phase,
      lastWatering: last.watered ? last.date : null,
      lastHeight: last.heightCm,
      nextWateringIn: nextWatering,
    );
  }

  @override
  Future<List<CareTip>> fetchCareTips(PlantPhase phase) async {
    await Future.delayed(const Duration(seconds: 1));

    switch (phase) {
      case PlantPhase.seedling:
        return [
          CareTip(
            title: 'Luz suave',
            description:
                'Evite luz muito forte direta nas mudas, use iluminação moderada.',
          ),
          CareTip(
            title: 'Solo úmido',
            description: 'Mantenha o solo levemente úmido sem encharcar.',
          ),
        ];

      case PlantPhase.vegetative:
        return [
          CareTip(
            title: 'Muita luz',
            description:
                'Aumente as horas de luz para estimular o crescimento.',
          ),
          CareTip(
            title: 'Circulação de ar',
            description: 'Use ventilação para fortalecer o caule.',
          ),
        ];

      case PlantPhase.flowering:
        return [
          CareTip(
            title: 'Reduzir umidade',
            description: 'Mantenha a umidade baixa para evitar fungos.',
          ),
          CareTip(
            title: 'Nada de podas fortes',
            description: 'Evite podas agressivas nesta fase.',
          ),
        ];

      case PlantPhase.drying:
        return [
          CareTip(
            title: 'Ambiente escuro',
            description:
                'Na secagem, deixe as flores em local escuro e ventilado.',
          ),
        ];
    }
  }
}
