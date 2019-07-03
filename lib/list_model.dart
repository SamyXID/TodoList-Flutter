class ListModel {
  String _title;

  String get title => _title;

  ListModel.fromJson(Map<String, dynamic> json) {
    _title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = this._title;
    return data;
  }
}