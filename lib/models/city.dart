import 'package:country_state_city/models/name_provider.dart';

/// Handle city data such as: (name, countryCode, stateCode, latitude, longitude)
class City implements NameProvider {
  @override
  final String name;
  final String countryCode;
  final String stateCode;
  final String? latitude;
  final String? longitude;

  City({
    required this.name,
    required this.countryCode,
    required this.stateCode,
    this.latitude,
    this.longitude,
  });

  static City fromJson(Map<String, dynamic> json) => City(
        name: json['name'],
        countryCode: json['countryCode'],
        stateCode: json['stateCode'],
        latitude: json['latitude'],
        longitude: json['longitude'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'countryCode': countryCode,
        'stateCode': stateCode,
        'latitude': latitude,
        'longitude': longitude,
      };
}
