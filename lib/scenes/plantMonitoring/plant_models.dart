// teste

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
