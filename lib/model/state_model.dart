class StateModel {
  String state;
  String alias;
  List<String> city;

  StateModel({this.state, this.alias, this.city});

  StateModel.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    alias = json['alias'];
    city = json['lgas'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['alias'] = this.alias;
    data['lgas'] = this.city;
    return data;
  }
}