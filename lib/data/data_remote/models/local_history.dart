import "package:hive/hive.dart";
 
part "local_history.g.dart";

@HiveType(typeId: 1)
class LocalHistorial extends HiveObject{
  @HiveField(0)
  int id;  
  @HiveField(1)
  int time;  
  @HiveField(2)
  String email;  
  @HiveField(3)
  int points; 
  
  

  LocalHistorial({   
    required this.id,
    required this.time,
    required this.email,
    required this.points,
  });

  factory LocalHistorial.fromJson(Map<String, dynamic> json) => LocalHistorial(
        id: json["id"],
        time: json["time"] ?? 1,
        email: json["email"] ?? "someemail@loco.com",
        points: json["points"] ?? 0,
      );


    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "time":time,
        "points": points,
      };
}