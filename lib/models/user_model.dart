class UserModel {
  final String id;
  final String email;
  final String fullName;
  final String aboutMe;
  final String photoUrl;
  final String profession;
  final int phoneNumber;
  final DateTime registeredOn;

  UserModel(
      {this.id,
      this.email,
      this.phoneNumber,
      this.fullName,
      this.aboutMe,
      this.photoUrl,
      this.profession,
      this.registeredOn});
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "email": email,
      "fullName": fullName,
      "phoneNumber": phoneNumber,
      "aboutMe": aboutMe,
      "photoUrl": photoUrl,
      "profession": profession,
      "registeredOn": registeredOn
    };
  }

  UserModel.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        email = map['email'],
        fullName = map['fullName'],
        phoneNumber = map['phoneNumber'],
        aboutMe = map['aboutMe'],
        photoUrl = map['photoUrl'],
        profession = map['profession'],
        registeredOn = map['registeredOn'];
}
