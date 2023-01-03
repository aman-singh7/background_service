import 'package:hive_flutter/hive_flutter.dart';

import '../constants/strings.dart';

class StorageService {
  /// Service initializer
  static void init() => _box = Hive.box(AppStrings.hiveBoxName);

  // Data
  /// The Hive [Box] which contains all data stored by the app.
  static late final Box _box;

  static Box get box => _box;

  // CRUD methods
  static T? _get<T>(String key) => _box.get(key);

  static void _set<T>(String key, T? value) => _box.put(key, value);

  /// Remove a key from storage.
  static T? delete<T>(String key) {
    final T? value = _box.get(key);
    _box.delete(key);
    return value;
  }

  /// Safely check whether a key exists in storage.
  /// Optionally check if the value is non-null.
  static bool exists(String key, {bool checkForNull = false}) {
    if (!_box.containsKey(key)) return false;
    return !checkForNull || _box.get(key) != null;
  }

  /// Get a stream of [BoxEvent]s performed on a particular [key].
  static Stream<BoxEvent> stream(String key) => _box.watch(key: key);

  // Specific getters and setters

  // Saving state
  static bool? get savingState => _get<bool>(AppStrings.saving);

  static set updateSavingState(bool? value) =>
      _set<bool>(AppStrings.saving, value);
}
