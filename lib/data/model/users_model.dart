class UserModel {
  int id;
  String username;
  String email;
  String firstName;
  String lastName;
  String gender;
  String image;
  String token;

  UserModel(
      {required this.id,
        required this.username,
        required this.email,
        required this.firstName,
        required this.lastName,
        required this.gender,
        required this.image,
        required this.token});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      firstName: json['firstName'] ?? 'first name',
      lastName: json['lastName'] ?? 'last name',
      gender: json['gender'] ?? 'male',
      image: json['image'] ?? 'image',
      token: json['token'] ?? 'token');
}

class LoginCredentials{
  String userName;
  String password;
  LoginCredentials({
    required this.userName,
    required this.password
});
  Map<String, String> toJson(){
    return{
      'username': userName, 'password': password
    };
  }
}