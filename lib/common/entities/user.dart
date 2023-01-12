import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  final String? id;
  final String? name;
  final String? email;
  final String? photoUrl;
  final String? location;
  final String? fcmtokn;
  final Timestamp? addtime;
  UserData({
    this.id,
    this.name,
    this.email,
    this.photoUrl,
    this.location,
    this.fcmtokn,
    this.addtime,
  });
  factory UserData.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UserData(
      id: data?['id'],
      name: data?['name'],
      email: data?["email"],
      photoUrl: data?['photourl'],
      location: data?['location'],
      fcmtokn: data?['fcmtokn'],
      addtime: data?['addtime'],
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (name != null) "name": name,
      if (email != null) "email": email,
      if (photoUrl != null) "photourl": photoUrl,
      if (location != null) "location": location,
      if (fcmtokn != null) "fcmtokn": fcmtokn,
      if (addtime != null) "addtime": addtime,
    };
  }
}

class UserLoginResponceEntity {
  String? accessToken;
  String? displayName;
  String? email;
  String? photoUrl;
  UserLoginResponceEntity({
    this.accessToken,
    this.displayName,
    this.email,
    this.photoUrl,
  });

  factory UserLoginResponceEntity.fromJson(Map<String, dynamic> json) {
    return UserLoginResponceEntity(
      accessToken: json["access_token"],
      displayName: json["display_name"],
      email: json["email"],
      photoUrl: json["photoUrl"],
    );
  }
  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "display_name": displayName,
        "email": email,
        "photoUrl": photoUrl,
      };
}

class MeListItem {
  String? name;
  String? icon;
  String? explain;
  String? route;
  MeListItem({this.explain, this.icon, this.name, this.route});

  factory MeListItem.fromJson(Map<String, dynamic> json) => MeListItem(
        explain: json["name"],
        icon: json["icon"],
        name: json["explain"],
        route: json["route"],
      );
}
