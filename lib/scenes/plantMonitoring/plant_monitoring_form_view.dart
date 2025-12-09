import 'package:flutter/material.dart';
import 'plant_monitoring_view_model.dart';
import 'plant_models.dart';

class PlantMeasurementFormView extends StatefulWidget {
  final PlantMonitoringViewModel viewModel;

  const PlantMeasurementFormView({super.key, required this.viewModel});

  @override
  State<PlantMeasurementFormView> createState() =>
      _PlantMeasurementFormViewState();
}

class _PlantMeasurementFormViewState extends State<PlantMeasurementFormView> {
  final _formKey = GlobalKey<FormState>();

  final _height = TextEditingController();
  final _temp = TextEditingController();
  final _humidity = TextEditingController();
  final _notes = TextEditingController();

  PlantPhase _phase = PlantPhase.vegetative;
  bool _watered = true;

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
              TextFormField(
                controller: _height,
                decoration: const InputDecoration(labelText: 'Altura (cm)'),
                keyboardType: TextInputType.number,
                validator: (v) =>
                    v == null || v.isEmpty ? 'Informe a altura' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _temp,
                decoration: const InputDecoration(
                  labelText: 'Temperatura (°C)',
                ),
                keyboardType: TextInputType.number,
                validator: (v) =>
                    v == null || v.isEmpty ? 'Informe a temperatura' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _humidity,
                decoration: const InputDecoration(labelText: 'Umidade (%)'),
                keyboardType: TextInputType.number,
                validator: (v) =>
                    v == null || v.isEmpty ? 'Informe a umidade' : null,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<PlantPhase>(
                value: _phase,
                items: PlantPhase.values
                    .map((p) => DropdownMenuItem(value: p, child: Text(p.name)))
                    .toList(),
                onChanged: (v) => setState(() => _phase = v!),
              ),
              SwitchListTile(
                title: const Text('Regou a planta?'),
                value: _watered,
                onChanged: (v) => setState(() => _watered = v),
              ),
              TextFormField(
                controller: _notes,
                decoration: const InputDecoration(labelText: 'Observações'),
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                child: const Text('Salvar'),
                onPressed: () {
                  if (!_formKey.currentState!.validate()) return;

                  final measurement = PlantMeasurement(
                    date: DateTime.now(),
                    heightCm: double.parse(_height.text),
                    temperature: double.parse(_temp.text),
                    humidity: double.parse(_humidity.text),
                    notes: _notes.text,
                    phase: _phase,
                    watered: _watered,
                  );

                  Navigator.pop(context, measurement);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
