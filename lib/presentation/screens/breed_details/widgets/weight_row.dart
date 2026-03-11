import 'package:cats/core/extensions/build_context_extension.dart';
import 'package:cats/core/models/weight_unit.dart';
import 'package:cats/data/models/breed_model.dart';
import 'package:cats/data/sources/local/app_settings_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeightRow extends StatefulWidget {
  const WeightRow({super.key, required this.breed});

  final BreedModel breed;

  @override
  State<WeightRow> createState() => _WeightRowState();
}

class _WeightRowState extends State<WeightRow> {
  late WeightUnit _unit;

  @override
  void initState() {
    super.initState();
    _unit = context.read<AppSettingsService>().getWeightUnit();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Row(
      children: [
        Text(
          '${l10n.breedWeight}: ',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        Text(
          _unit == WeightUnit.metric
              ? l10n.weightValue(widget.breed.weight!.metric, 'kg')
              : l10n.weightValue(widget.breed.weight!.imperial, 'lbs'),
        ),
        const SizedBox(width: 12),
        SegmentedButton<WeightUnit>(
          segments: [
            ButtonSegment(
              value: WeightUnit.metric,
              label: Text(l10n.breedWeightMetric),
            ),
            ButtonSegment(
              value: WeightUnit.imperial,
              label: Text(l10n.breedWeightImperial),
            ),
          ],
          selected: {_unit},
          onSelectionChanged: (s) async {
            final unit = s.first;
            setState(() => _unit = unit);
            await context.read<AppSettingsService>().setWeightUnit(unit);
          },
          style: const ButtonStyle(
            visualDensity: VisualDensity.compact,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
      ],
    );
  }
}
