import 'package:flutter/material.dart';
import 'package:growtrack/Designsystem/components/input/input.dart';
import 'package:growtrack/Designsystem/components/input/input_viewmodel.dart';
import 'package:growtrack/Designsystem/components/select/select.dart';
import 'package:growtrack/Designsystem/components/select/select_viewmodel.dart';
import 'package:growtrack/Designsystem/components/switch/switch.dart';
import 'package:growtrack/Designsystem/components/switch/switch_viewmodel.dart';
import 'package:growtrack/Designsystem/components/textarea/textarea.dart';
import 'package:growtrack/Designsystem/components/textarea/textarea_viewmodel.dart';
import 'package:growtrack/Designsystem/components/button/button.dart';
import 'package:growtrack/Designsystem/components/button/button_viewmodel.dart';
import 'package:growtrack/Designsystem/components/label/label.dart';
import 'package:growtrack/Designsystem/components/label/label_viewmodel.dart';
import 'package:growtrack/Designsystem/instantiate.dart';
import '../Monitoring/plant_monitoring_service.dart';
import 'plant_measurement_form_viewmodel.dart';
import 'plant_measurement_form_viewmodel_factory.dart';

class PlantMeasurementFormView extends StatelessWidget {
  const PlantMeasurementFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return const _PlantMeasurementFormContent();
  }
}

class _PlantMeasurementFormContent extends StatefulWidget {
  const _PlantMeasurementFormContent();

  @override
  State<_PlantMeasurementFormContent> createState() =>
      _PlantMeasurementFormContentState();
}

class _PlantMeasurementFormContentState
    extends State<_PlantMeasurementFormContent> {
  final _formKey = GlobalKey<FormState>();

  final _height = TextEditingController();
  final _temp = TextEditingController();
  final _humidity = TextEditingController();
  final _notes = TextEditingController();

  late final PlantMeasurementFormViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = PlantMeasurementFormViewModelFactory.create();
  }

  @override
  void dispose() {
    _height.dispose();
    _temp.dispose();
    _humidity.dispose();
    _notes.dispose();
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nova medição')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Instantiate.component<LabelViewModel>(
                viewModel: LabelViewModel(
                  size: LabelSize.medium,
                  variant: LabelVariant.default_,
                  text: 'Altura (cm)',
                  isRequired: true,
                ),
                builder: (vm) =>
                    GTLabel(text: vm.text, isRequired: vm.isRequired),
              ),
              const SizedBox(height: 8),
              Instantiate.component<InputViewModel>(
                viewModel: InputViewModel(
                  size: InputSize.medium,
                  type: InputType.number,
                  state: InputState.normal,
                  placeholder: 'Altura (cm)',
                ),
                builder: (vm) => GTInput(
                  child: TextFormField(
                    controller: _height,
                    decoration: const InputDecoration(
                      labelText: 'Altura (cm)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: _viewModel.validateHeight,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Instantiate.component<LabelViewModel>(
                viewModel: LabelViewModel(
                  size: LabelSize.medium,
                  variant: LabelVariant.default_,
                  text: 'Temperatura (°C)',
                  isRequired: true,
                ),
                builder: (vm) =>
                    GTLabel(text: vm.text, isRequired: vm.isRequired),
              ),
              const SizedBox(height: 8),
              Instantiate.component<InputViewModel>(
                viewModel: InputViewModel(
                  size: InputSize.medium,
                  type: InputType.number,
                  state: InputState.normal,
                ),
                builder: (vm) => GTInput(
                  child: TextFormField(
                    controller: _temp,
                    decoration: const InputDecoration(
                      labelText: 'Temperatura (°C)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: _viewModel.validateTemperature,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Instantiate.component<LabelViewModel>(
                viewModel: LabelViewModel(
                  size: LabelSize.medium,
                  variant: LabelVariant.default_,
                  text: 'Umidade (%)',
                  isRequired: true,
                ),
                builder: (vm) =>
                    GTLabel(text: vm.text, isRequired: vm.isRequired),
              ),
              const SizedBox(height: 8),
              Instantiate.component<InputViewModel>(
                viewModel: InputViewModel(
                  size: InputSize.medium,
                  type: InputType.number,
                  state: InputState.normal,
                ),
                builder: (vm) => GTInput(
                  child: TextFormField(
                    controller: _humidity,
                    decoration: const InputDecoration(
                      labelText: 'Umidade (%)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: _viewModel.validateHumidity,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Instantiate.component<LabelViewModel>(
                viewModel: LabelViewModel(
                  size: LabelSize.medium,
                  variant: LabelVariant.default_,
                  text: 'Fase da Planta',
                  isRequired: true,
                ),
                builder: (vm) =>
                    GTLabel(text: vm.text, isRequired: vm.isRequired),
              ),
              const SizedBox(height: 8),
              ListenableBuilder(
                listenable: _viewModel,
                builder: (context, _) => Instantiate.component<SelectViewModel>(
                  viewModel: SelectViewModel(
                    size: SelectSize.medium,
                    state: SelectState.normal,
                    options: PlantPhase.values.map((p) => p.name).toList(),
                  ),
                  builder: (svm) => GTSelect<PlantPhase>(
                    value: _viewModel.phase,
                    items: PlantPhase.values
                        .map(
                          (p) =>
                              DropdownMenuItem(value: p, child: Text(p.name)),
                        )
                        .toList(),
                    onChanged: (v) => _viewModel.setPhase(v!),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  ListenableBuilder(
                    listenable: _viewModel,
                    builder: (context, _) =>
                        Instantiate.component<SwitchViewModel>(
                          viewModel: SwitchViewModel(
                            size: SwitchSize.medium,
                            state: _viewModel.watered
                                ? SwitchState.on
                                : SwitchState.off,
                          ),
                          builder: (svm) => GTSwitch(
                            child: Switch(
                              value: _viewModel.watered,
                              onChanged: (v) => _viewModel.setWatered(v),
                            ),
                          ),
                        ),
                  ),
                  const SizedBox(width: 12),
                  const Text('Regou a planta?'),
                ],
              ),
              const SizedBox(height: 16),
              Instantiate.component<LabelViewModel>(
                viewModel: LabelViewModel(
                  size: LabelSize.medium,
                  variant: LabelVariant.default_,
                  text: 'Observações',
                ),
                builder: (vm) => GTLabel(text: vm.text),
              ),
              const SizedBox(height: 8),
              Instantiate.component<TextareaViewModel>(
                viewModel: TextareaViewModel(
                  size: TextareaSize.medium,
                  state: TextareaState.normal,
                  minLines: 1,
                  maxLines: 3,
                ),
                builder: (tvm) => GTTextarea(
                  child: TextFormField(
                    controller: _notes,
                    decoration: const InputDecoration(
                      labelText: 'Observações',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Instantiate.component<ButtonViewModel>(
                viewModel: ButtonViewModel(
                  size: ButtonSize.medium,
                  variant: ButtonVariant.primary,
                  label: 'Salvar',
                ),
                builder: (vm) => GTButton(
                  child: Text(vm.label),
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) return;

                    final measurement = _viewModel.createMeasurement(
                      heightText: _height.text,
                      temperatureText: _temp.text,
                      humidityText: _humidity.text,
                      notesText: _notes.text,
                    );

                    Navigator.pop(context, measurement);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
