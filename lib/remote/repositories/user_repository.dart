import 'package:bloc_strange_behavior/remote/models/user.dart';

class UserRepository {
  static final UserRepository instance = UserRepository._internal();

  UserRepository._internal();

  Future<String> getHomeStats() async {
    return "dummy";
  }

  /// Returns current user profile
  Future<User> getCurrentUser() async {
    return User(
        id: 1,
        username: "bartekpacia",
        name: "Bartek",
        email: "barpac02@gmail.com",
        slackUsername: "nope",
        bio: "nope",
        location: "nope",
        occupation: "nope",
        organization: "nope",
        interests: "nope",
        skills: "total null",
        needsMentoring: true,
        availableToMentor: false);
  }

  /// Updates current user's profile
  Future<void> updateUser(User user) async {}
}
