import 'package:transport_minister/core/simulation/engine/simulation_clock.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';

class CitySave {
  const CitySave({required this.city, required this.anchor});

  final CityState city;
  final TimeAnchor anchor;
}
