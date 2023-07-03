// class Register {
//   String? username;
//   String? email;
//   String? gender;
//   String? country;
//   String? password;
//   String? passwordConfirmation;
//   bool publicEmail = false;
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['name'] = username;
//     data['email'] = email;
//     data['gender'] = gender;
//     data['password'] = password;
//     data['password_confirmation'] = passwordConfirmation;
//     data['public_email'] = publicEmail;
//     data['email'] = email;
//     return data;
//   }
// }



class Register {
  late String username;
  late String email;
  late String gender;
  late String country;
  late String password;
  late String passwordConfirmation;
  bool publicEmail = false;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.username;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['password'] = this.password;
    data['password_confirmation'] = this.passwordConfirmation;
    data['public_email'] = this.publicEmail;
    data['email'] = this.email;
    return data;
  }
}