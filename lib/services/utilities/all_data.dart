import 'dart:convert';

import 'package:covid_tracker_app/models/world_states_model.dart';
import 'package:covid_tracker_app/services/api_services.dart';
import 'package:http/http.dart' as http;

class WorldSatesData {
  Future<WorldStatesModel> fetchWorldStatesData() async {
    final response = await http.get(
      Uri.parse(AppUrl.worldStatesApi),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }
}
