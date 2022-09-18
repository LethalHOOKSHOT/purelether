import '../model/statistics.dart';
import '../model/user.dart';

abstract class Repository {
  Future<User> getUser(String name);

  Future<Statistics> getStatistics(User user);

  void updateStatistics(Statistics statistics);

  void saveUser(User user);

  void saveStatistics(Statistics statistics);

  Future<bool> ensureThatNotNew(String name);
}
