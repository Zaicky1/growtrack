import 'package:flutter/material.dart';
import 'package:growtrack/Designsystem/components/button/button.dart';
import 'package:growtrack/Designsystem/components/button/button_viewmodel.dart';
import 'package:growtrack/Designsystem/components/card/card.dart';
import 'package:growtrack/Designsystem/components/dialog/dialog.dart';
import 'package:growtrack/Designsystem/instantiate.dart';
import 'package:growtrack/resources/shared/styles.dart';
import 'plant_monitoring_view_model.dart';
import '../plantRegister/plant_monitoring_form_view.dart';
import 'plant_monitoring_service.dart';

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
                child: Instantiate.component<ButtonViewModel>(
                  viewModel: ButtonViewModel(
                    size: ButtonSize.medium,
                    variant: ButtonVariant.primary,
                    label: 'Registrar medição',
                  ),
                  builder: (vm) => GTButton(
                    child: Text(vm.label),
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const PlantMeasurementFormView(),
                        ),
                      );

                      if (result != null) {
                        await viewModel.addMeasurement(result);
                      }
                    },
                  ),
                ),
              ),

              const SizedBox(width: 8),

              Expanded(
                child: Instantiate.component<ButtonViewModel>(
                  viewModel: ButtonViewModel(
                    size: ButtonSize.medium,
                    variant: ButtonVariant.secondary,
                    label: 'Ver dicas',
                    isLoading: viewModel.isLoading,
                  ),
                  builder: (vm) => GTButton(
                    child: vm.isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Text(vm.label),
                    onPressed: vm.isLoading
                        ? null
                        : () async {
                            await viewModel.loadTipsForCurrentPhase();
                            if (context.mounted) {
                              _showTipsDialog(context);
                            }
                          },
                  ),
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
    return GTCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fase atual: ${status.currentPhase.name}',
              style: heading5Regular,
            ),
            const SizedBox(height: 8),
            Text(
              'Última rega: ${status.lastWatering ?? 'sem registro'}',
              style: paragraph1Regular,
            ),
            Text(
              'Altura atual: ${status.lastHeight ?? 'sem dados'}',
              style: paragraph1Regular,
            ),
            if (status.nextWateringIn != null)
              Text(
                'Próxima rega em: ${status.nextWateringIn!.inHours} horas',
                style: paragraph1Regular,
              ),
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
        return GTCard(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${m.heightCm} cm - ${m.temperature}°C',
                      style: heading5Regular,
                    ),
                    const SizedBox(height: 4),
                    Text(m.date.toString(), style: paragraph1Regular),
                  ],
                ),
              ),
              Icon(
                m.watered ? Icons.water_drop : Icons.water_drop_outlined,
                color: m.watered ? Colors.blue : Colors.grey,
              ),
            ],
          ),
        );
      },
    );
  }

  void _showTipsDialog(BuildContext context) {
    final tips = viewModel.tips;

    showDialog(
      context: context,
      builder: (context) {
        return GTDialog(
          title: const Text('Dicas de Cuidados'),
          content: SizedBox(
            height: 200,
            child: tips.isEmpty
                ? const Center(child: Text('Nenhuma dica disponível'))
                : ListView(
                    children: tips
                        .map(
                          (t) => GTCard(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(t.title, style: heading5Regular),
                                const SizedBox(height: 8),
                                Text(t.description, style: paragraph1Regular),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }
}
