class UserProfileModel {
  String? full_name;
  String? email;
  String? phone_number;
  String? profile_pic;

  UserProfileModel(
      {this.full_name, this.email, this.phone_number, this.profile_pic});

  factory UserProfileModel.fromJson(json) => UserProfileModel(
      full_name: json["full_name"],
      email: json["email"],
      phone_number: json["phone_number"],
      profile_pic: json["profile_pic"]);

  Map<String, dynamic> toJason() {
    return {
      "full_name": full_name,
      "email": email,
      "phone_number": phone_number,
      "profile_pic": profile_pic,
    };
  }
}
