import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:untitled3/repository/repository.dart';
import 'package:untitled3/repository/repository_errors.dart';
import '../model/statistics.dart';
import '../model/user.dart';

class FireBaseRepository extends Repository {
  @override
  Future<Statistics> getStatistics(User user) async {
    var statistics = await FirebaseFirestore.instance
        .collection("statistics")
        .where('userId', isEqualTo: user.id)
        .get()
        .then((querySnapshot) async {
      for (var element in querySnapshot.docs) {
        return Statistics.fromJson(element.data());
      }
    });
    if (statistics == null) {
      throw DataLoadingFailure(
          message: "data not loaded",
          dataType: "Statistics",
          details: user.nickname);
    }
    return statistics;
  }

  @override
  Future<User> getUser(String name) async {
    var user = await FirebaseFirestore.instance
        .collection("users")
        .where('nickname', isEqualTo: name)
        .get()
        .then((querySnapshot) async {
      for (var element in querySnapshot.docs) {
        if (element.data()["nickname"] == name) {
          return User.fromJson(element.data());
        }
      }
    });
    if (user == null) {
      throw DataLoadingFailure(
          message: "data not loaded", dataType: "user", details: name);
    }
    return user;
  }

  @override
  void updateStatistics(Statistics statistics) async {
    await FirebaseFirestore.instance
        .collection("statistics")
        .doc(statistics.id)
        .update(statistics.toJson());
  }

  @override
  void saveStatistics(Statistics statistics) async {
    final docStat =
        FirebaseFirestore.instance.collection("statistics").doc(statistics.id);
    await docStat.set(statistics.toJson());
  }

  @override
  void saveUser(User user) async {
    final docUser = FirebaseFirestore.instance.collection("users").doc(user.id);
    await docUser.set(user.toJson());
  }

  @override
  Future<bool> ensureThatNotNew(String name) async {
    bool isNew = false;
    await FirebaseFirestore.instance
        .collection("users")
        .where('nickname', isEqualTo: name)
        .get()
        .then((querySnapshot) async {
      for (var element in querySnapshot.docs) {
        isNew = element.data()["nickname"] == name;
      }
      return true;
    });
    return isNew;
  }
}
