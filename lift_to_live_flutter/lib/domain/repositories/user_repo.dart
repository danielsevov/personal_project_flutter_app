import '../entities/image.dart';
import '../entities/user.dart';
import '../entities/role.dart';

/// API to the User repository object.
/// Defines method to be implemented.
abstract class UserRepository {
  /// This function is used for fetching a list of Role objects, describing the user role of a user.
  Future<List<Role>> fetchUserRoles(String jwtToken);

  /// This function is used for fetching a User object, containing user details.
  Future<User> fetchUser(String userId, String jwtToken);

  /// This function is used for fetching a Image object, which holds the profile picture of a user.
  Future<MyImage> fetchProfileImage(String userId, String jwtToken);

  /// This function is used for patching a Image object, which holds the picture of a user.
  void patchImage(int id, String userId, String date, String encoded, String type, String jwtToken);

  /// This function is used for posting a Image object, which holds the picture of a user.
  void postImage(String userId, String date, String encoded, String type, String jwtToken);
}
