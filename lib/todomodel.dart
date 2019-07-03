class TodoModel {
  int code;
  String status;
  String description;
  ResultModel result;

  TodoModel({this.code, this.status, this.description, this.result});

  TodoModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    description = json['description'];
    result =
        json['result'] != null ? new ResultModel.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['description'] = this.description;
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    return data;
  }
}

class ResultModel {
  List<Entries> entries;
  int count;

  ResultModel({this.entries, this.count});

  ResultModel.fromJson(Map<String, dynamic> json) {
    if (json['entries'] != null) {
      entries = new List<Entries>();
      json['entries'].forEach((v) {
        entries.add(new Entries.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.entries != null) {
      data['entries'] = this.entries.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    return data;
  }
}

class Entries {
  String id;
  String name;
  String description;
  String completed;
  String createdAt;
  String updatedAt;

  Entries(
      {this.id,
      this.name,
      this.description,
      this.completed,
      this.createdAt,
      this.updatedAt});

  Entries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    completed = json['completed'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['completed'] = this.completed;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}