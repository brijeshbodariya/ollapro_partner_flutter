import 'package:ollapro_partner/model/state_model.dart';


class Repository {
  List<Map> getAll() => stateSelection;

  getLocalByState(String state) => stateSelection
      .map((map) => StateModel.fromJson(map))
      .where((item) => item.state == state)
      .map((item) => item.city)
      .expand((i) => i)
      .toList();

  List<String> getStates() => stateSelection
      .map((map) => StateModel.fromJson(map))
      .map((item) => item.state)
      .toList();

  List stateSelection = [
    {
      "state": "Rajasthan",
      "alias": "Rajasthan",
      "lgas": [
        "Jaipur",
        "Jodhpur"
      ]
    },
    {
      "state": "Gujarat",
      "alias": "Gujarat",
      "lgas": [
        "Ahmedabad",
        "Surat"

      ]
    },
    {
      "state": "Maharastra",
      "alias": "Maharastra",
      "lgas": [
        "Mumbai",
        "Pune"

      ]
    },
  ];
}