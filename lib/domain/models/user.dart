class User {
  User(
      {this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.colegio,
      required this.grado,
      required this.fN,
      required this.password,
      required this.difficult
      });

  int? id;
  String firstName;
  String lastName;
  String email;
  String colegio;
  String grado;
  String fN;
  String password;
  String difficult;


  String get name => '$firstName $lastName';

  String get emailAddress => email;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["firstName"] ?? "somefirstName",
        lastName: json["lastName"] ?? "someLastName",
        email: json["email"] ?? "someemail",
        colegio: json["school"] ?? "somecolegio",
        grado: json["course"] ?? "0",
        fN: json["birthday"] ?? "00/00/0000",
        password: json["password"] ?? "somecontraseña",
        difficult: json["diff"] ?? "diffa",

      );

  Map<String, dynamic> toJson() => {
        "id": id ?? 0,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "school": colegio,
        "course": grado,
        "birthday": fN,
        "password": password,
        "dif": difficult,
      };
}
