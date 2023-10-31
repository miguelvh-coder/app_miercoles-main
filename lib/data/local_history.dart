import 'package:app_oper/data/data_remote/models/local_history.dart';
import 'package:app_oper/domain/models/history.dart';
import 'package:hive/hive.dart';

//local history
class Localhistory {
  Future<bool> saveSession(History history) async {
    final box = await Hive.openBox('history');
    await box.add(history);
    return Future.value(true);
  }

  Future<void> addElement(LocalHistorial entry) async {
    Hive.box('history').add(LocalHistorial(
        id: entry.id,
        time: entry.time,
        email: entry.email,
        points: entry.points));
  }

  Future<List> getHis(String email) async {
    final box = await Hive.openBox('history');
    List<dynamic> data = [];
    for (var i = 0; i < box.length; i++) {
      final item = box.getAt(i);
      if (item.email == email) {
        data.add(item);
      }
    }
    return data;
  }
  Future<List> getAll() async {
    final box = await Hive.openBox('history');
    List<dynamic> data = [];
    for (var i = 0; i < box.length; i++) {
      final item = box.getAt(i);
      data.add(item);
    }
    return data;
  }
  Future<bool> verifyhis(int id) async {
    final box = await Hive.openBox('history');
    for (var i = 0; i < box.length; i++) {
      final item = box.getAt(i);
      if (item.id == id) {
        return Future.value(true);
      }
    }
    return Future.value(false);
  }
}