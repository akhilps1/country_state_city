import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import '../models/state.dart';

Future<List<CountryState>> _loadStates() async {
  final res = await rootBundle
      .loadString('packages/country_state_city/lib/assets/state.json');
  final data = jsonDecode(res) as List;
  return List<CountryState>.from(
    data.map((item) => CountryState.fromJson(item)),
  );
}

/// Get world wide states list.
Future<List<CountryState>> getAllStates() {
  return _loadStates();
}

/// Get the list of states that belongs to a country by the country ISO CODE
Future<List<CountryState>> getStatesOfCountry(String countryCode) async {
  final states = await _loadStates();

  final res = states.where((state) {
    return state.countryCode == countryCode;
  }).toList();
  res.sort((a, b) => a.name.compareTo(b.name));

  return res;
}

/// Get a state from its code and its belonging country code
Future<CountryState?> getStateByCode(
  String countryCode,
  String stateCode,
) async {
  final states = await _loadStates();

  final res = states.where((state) {
    return state.countryCode == countryCode && state.isoCode == stateCode;
  }).toList();

  return res.isEmpty ? null : res.first;
}
