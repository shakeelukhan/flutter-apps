import 'package:shared_preferences/shared_preferences.dart';

class SettingsHelper {
  static late SharedPreferences _prefs;
  late Future<void> _loadSettingsFuture;
  Future<void> get initialized => _loadSettingsFuture;
  SharedPreferences get() => _prefs;

  // Constructor
  SettingsHelper() {
    _loadSettingsFuture = loadSettings(true);
  }

  // Retrieve settings
  Future<void> loadSettings(bool setDefaults) async {
    _prefs = await SharedPreferences.getInstance();
    if (setDefaults) {
      setDefaultValuesIfNotSet();
    }
  }

  // Set defaults if not set
  static setDefaultValuesIfNotSet() {
    _prefs.setInt('session.start_amount', _prefs.getInt('session.start_amount') ?? 100);
    _prefs.setInt('session.balance', _prefs.getInt('session.balance') ?? 100);
    _prefs.setInt('session.goal', _prefs.getInt('session.goal') ?? 200);
    _prefs.setInt('session.unit_size', _prefs.getInt('session.unit_size') ?? 10);
    _prefs.setInt('session.positive_progression_parts', _prefs.getInt('session.positive_progression_parts') ?? 3);
    _prefs.setInt('session.simulation_count', _prefs.getInt('session.simulation_count') ?? 1);
    _prefs.setInt('game.bet_lose_probabiity', _prefs.getInt('game.bet_lose_probabiity') ?? 53);
    _prefs.setInt('game.min_bet_size', _prefs.getInt('game.min_bet_size') ?? 10);
  }
}