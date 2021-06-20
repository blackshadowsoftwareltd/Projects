class UsersModel {
  int id;
  String name;
  String email;
  String roll;
  String address;
  String createdAt;
  String updatedAt;

  UsersModel(
      {this.id,
        this.name,
        this.email,
        this.roll,
        this.address,
        this.createdAt,
        this.updatedAt});

  UsersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    roll = json['roll'];
    address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['roll'] = this.roll;
    data['address'] = this.address;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}