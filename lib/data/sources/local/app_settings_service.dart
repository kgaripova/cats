import 'package:cats/core/constants/app_constants.dart';
import 'package:cats/core/models/weight_unit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsService {
  AppSettingsService(this._prefs);

  final SharedPreferences _prefs;
  static const String settingsKeyWeightUnit = 'weightUnit';

  WeightUnit getWeightUnit() {
    final raw = _prefs.getString(settingsKeyWeightUnit);
    if (raw == WeightUnit.imperial.name) return WeightUnit.imperial;
    return WeightUnit.metric;
  }

  Future<void> setWeightUnit(WeightUnit unit) async {
    await _prefs.setString(settingsKeyWeightUnit, unit.name);
  }
}
