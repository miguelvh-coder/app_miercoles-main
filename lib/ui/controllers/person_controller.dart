import 'package:get/get.dart';

class PersonController extends GetxController {
  RxInt id = 0.obs;
  RxInt diff = 1.obs;
  RxString email = "".obs;
  RxString firstname = "".obs;
  RxString lastname = "".obs;
  RxString birthday = "".obs;
  RxString course = "".obs;
  RxString password = "".obs;
  RxString school = "".obs;

  setValues(Map<String, dynamic> data) {
    int id = data['id'];
    String diff = data['diff'].toString();
    String email = data['email'].toString();
    String course = data['course'].toString();
    String birthday = data['birthday'].toString();
    String lastname = data['lastname'].toString();
    String password = data['password'].toString();
    String firstname = data['firstname'].toString();
    String school = data['school'].toString();
    this.id.value = id;
    this.diff.value = int.parse(diff);
    this.email.value = email;
    this.course.value = course;
    this.birthday.value = birthday;
    this.lastname.value = lastname;
    this.password.value = password;
    this.firstname.value = firstname;
    this.school.value = school;
  }

  updateDifficult(int a) {
    diff.value = a;
  }
}