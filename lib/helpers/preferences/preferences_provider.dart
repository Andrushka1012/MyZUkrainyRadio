import 'package:myzukrainy/helpers/preferences/base_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesProvider {
  // KEYS
  static const _selectedStation = 'selectedStation';

  late final selectedStation = stringPref(_selectedStation, '', _providePreferences);

  bool _isInitialized = false;
  late final SharedPreferences _preferences;

  /// Initialize [PreferencesProvider] with [SharedPreferences].
  /// Attempt access to [BasePreference] before initialization finished will throw an exception.
  Future<void> initialize() async {
    if (!_isInitialized) {
      _preferences = await SharedPreferences.getInstance();
      _isInitialized = true;
    }
  }

  SharedPreferences _providePreferences() {
    assert(_isInitialized, 'PreferencesProvider was not initialized');
    return _preferences;
  }
}
