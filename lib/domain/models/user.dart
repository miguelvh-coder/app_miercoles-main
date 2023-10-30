class User {
  User(
      {this.id,
      required this.firstname,
      required this.lastname,
      required this.email,
      required this.school,
      required this.course,
      required this.birthday,
      required this.password,
      required this.diff
      });

  int? id;
  String firstname;
  String lastname;
  String email;
  String school;
  String course;
  String birthday;
  String password;
  String diff;


  String get name => '$firstname $lastname';

  String get emailAddress => email;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstname: json["firstname"] ?? "somefirstName",
        lastname: json["lastname"] ?? "someLastName",
        email: json["email"] ?? "someemail",
        school: json["school"] ?? "somecolegio",
        course: json["course"] ?? "1",
        birthday: json["birthday"] ?? "00/00/0000",
        password: json["password"] ?? "somecontraseña",
        diff: json["diff"] ?? "2",

      );

  Map<String, dynamic> toJson() => {
        "id": id ?? 0,
        "firstname": firstname,
        "lastName": lastname,
        "email": email,
        "school": school,
        "course": course,
        "birthday": birthday,
        "password": password,
        "diff": diff,
      };
}
