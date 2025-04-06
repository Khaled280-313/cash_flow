class Endpoint {
  static const String baseUrl = 'https://food-api-omega.vercel.app/api/v1/';
  static const String endpointSignIn = "user/signin";
  static const String endpointSignUp = "user/signup";
  static String getUserDataAndIdEndpoint(id) {
    return "user/get-user/$id";
  }
}

class ApiKey {
  static const String status = 'status';
  static const String errorMessage = 'ErrorMessage';
  static const String email = 'email';
  static const String password = 'password';
  static const String confirmPassword = 'confirmPassword';
  static const String id = 'id';
  static const String name = 'name';
  static const String phone = 'phone';
  static const String profilePic = 'profilePic';
  static const String location = 'location';
  static const String token = 'token';
  static const String massage = 'massage';
}
