class UserEntities {
  final String username;
  final String? image;
  final String firstName;
  final String lastName;
  final String bio;
  final String job;
  final String birthdate;

  UserEntities(
      {required this.username,
      required this.image,
      required this.firstName,
      required this.lastName,
      required this.bio,
      required this.job,
      required this.birthdate});
}
