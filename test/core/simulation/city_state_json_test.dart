import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:transport_minister/core/simulation/catalog/bus_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/project_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/technology_catalog.dart';
import 'package:transport_minister/core/simulation/engine/city_commands.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';

import 'simulation_test_kit.dart';

void main() {
  test('a played city survives a JSON round trip', () {
    const commands = CityCommands();
    var city = newBaku().copyWith(
      technologies: {TechnologyId.minibusContract, TechnologyId.articulatedContract},
      diplomacyPoints: 12,
    );
    city = applied(
      commands.buyBus(city, model: BusModelId.megaLink, district: DistrictId.windHeights),
    );
    city = applied(
      commands.startProject(city, ProjectType.bikeLanes, district: DistrictId.flameHills),
    );
    city = applied(commands.takeLoan(city, 500000));
    city = runDays(city, 12).state;

    final restored = CityState.fromJson(
      jsonDecode(jsonEncode(city.toJson())) as Map<String, dynamic>,
    );

    expect(restored, city);
  });
}
