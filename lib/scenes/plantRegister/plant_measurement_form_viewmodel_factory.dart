import 'plant_measurement_form_viewmodel.dart';
import 'plant_measurement_form_service.dart';

/// Factory para criar instâncias de PlantMeasurementFormViewModel e suas dependências
class PlantMeasurementFormViewModelFactory {
  /// Cria uma nova instância do ViewModel
  static PlantMeasurementFormViewModel create() {
    final service = PlantMeasurementFormService();
    return PlantMeasurementFormViewModel(service: service);
  }
}
