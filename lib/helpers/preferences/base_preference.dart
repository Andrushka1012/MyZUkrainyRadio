import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

/// Base wrapper class for single [SharedPreferences] value
///
/// [name] - preference key
/// [defaultValue] - preference defaultValue returned in case when preference was not exhibited earlier
class BasePreference<T> {
  BasePreference._(this.name, this.defaultValue, this._preferencesProvider, this._getFrom, this._setTo);

  final String name;
  final T defaultValue;
  final SharedPreferences Function() _preferencesProvider;

  final T? Function(SharedPreferences pref, String name) _getFrom;
  final Future<bool> Function(SharedPreferences pref, String name, T value) _setTo;

  final StreamController<T> _eventController = StreamController.broadcast();

  /// Reads a value from persistent storage
  T get value => _getFrom(_preferencesProvider(), name) ?? defaultValue;

  /// Saves a T [newValue] to persistent storage in the background.
  set value(T newValue) {
    _setTo(_preferencesProvider(), name, newValue).then((_) => _eventController.add(newValue));
  }

  /// Saves a T [newValue] to persistent storage asynchronously. Returns [Future] with [bool] is operation was successful
  Future<bool> setAsync(T newValue) => _setTo(_preferencesProvider(), name, newValue).then((value) {
        _eventController.add(newValue);
        return value;
      });

  /// Removes an entry from persistent storage.
  Future<bool> remove() => _preferencesProvider().remove(name);

  Stream<T> get changeNotifier => _eventController.stream;
}

/// Creates instance of [BasePreference] for [String] preference
BasePreference<String> stringPref(String name, String defaultValue, SharedPreferences Function() preferencesProvider) =>
    BasePreference._(
        name,
        defaultValue,
        preferencesProvider,
        (SharedPreferences prefs, String name) => prefs.getString(name),
        (SharedPreferences prefs, String name, String value) => prefs.setString(name, value));

/// Creates instance of [BasePreference] for [bool] preference
BasePreference<bool> boolPref(String name, bool defaultValue, SharedPreferences Function() preferencesProvider) =>
    BasePreference._(
        name,
        defaultValue,
        preferencesProvider,
        (SharedPreferences prefs, String name) => prefs.getBool(name),
        (SharedPreferences prefs, String name, bool value) => prefs.setBool(name, value));

/// Creates instance of [BasePreference] for [int] preference
BasePreference<int> intPref(String name, int defaultValue, SharedPreferences Function() preferencesProvider) =>
    BasePreference._(
        name,
        defaultValue,
        preferencesProvider,
        (SharedPreferences prefs, String name) => prefs.getInt(name),
        (SharedPreferences prefs, String name, int value) => prefs.setInt(name, value));

/// Creates instance of [BasePreference] for [double] preference
BasePreference<double> doublePref(String name, double defaultValue, SharedPreferences Function() preferencesProvider) =>
    BasePreference._(
        name,
        defaultValue,
        preferencesProvider,
        (SharedPreferences prefs, String name) => prefs.getDouble(name),
        (SharedPreferences prefs, String name, double value) => prefs.setDouble(name, value));
