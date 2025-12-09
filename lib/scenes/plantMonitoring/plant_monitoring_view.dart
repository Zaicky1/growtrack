import 'package:flutter/material.dart';
import 'plant_monitoring_view_model.dart';
import 'plant_monitoring_form_view.dart';
import 'plant_models.dart';

class PlantMonitoringView extends StatelessWidget {
  final PlantMonitoringViewModel viewModel;

  const PlantMonitoringView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: viewModel,
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(title: const Text('GrowTrack')),
          body: _buildBody(context),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context) {
    final status = viewModel.status;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          if (status != null) _buildStatusCard(status),

          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  child: const Text('Registrar medição'),
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            PlantMeasurementFormView(viewModel: viewModel),
                      ),
                    );

                    if (result != null) {
                      await viewModel.addMeasurement(result);
                    }
                  },
                ),
              ),

              const SizedBox(width: 8),

              Expanded(
                child: ElevatedButton(
                  child: const Text('Ver dicas'),
                  onPressed: () async {
                    await viewModel.loadTipsForCurrentPhase();
                    _showTipsDialog(context);
                  },
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Expanded(child: _buildHistoryList()),
        ],
      ),
    );
  }

  Widget _buildStatusCard(PlantStatus status) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Fase atual: ${status.currentPhase.name}'),
            const SizedBox(height: 8),
            Text('Última rega: ${status.lastWatering ?? 'sem registro'}'),
            Text('Altura atual: ${status.lastHeight ?? 'sem dados'}'),
            if (status.nextWateringIn != null)
              Text('Próxima rega em: ${status.nextWateringIn!.inHours} horas'),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryList() {
    final items = viewModel.measurements;

    if (items.isEmpty) {
      return const Center(child: Text('Nenhuma medição registrada.'));
    }

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (_, i) {
        final m = items[i];
        return ListTile(
          title: Text('${m.heightCm} cm - ${m.temperature}°C'),
          subtitle: Text(m.date.toString()),
          trailing: Icon(
            m.watered ? Icons.water_drop : Icons.water_drop_outlined,
            color: m.watered ? Colors.blue : null,
          ),
        );
      },
    );
  }

  void _showTipsDialog(BuildContext context) {
    final tips = viewModel.tips;

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Dicas'),
          content: SizedBox(
            height: 200,
            child: ListView(
              children: tips
                  .map(
                    (t) => ListTile(
                      title: Text(t.title),
                      subtitle: Text(t.description),
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
