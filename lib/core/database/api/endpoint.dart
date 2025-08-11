class Endpoint {
  static const String baseUrl = 'http://3.88.193.90:8080';

// AuthenticationController
  static const String registerEndpoint = "/api/register";
  static const String loginEndpoint = "/api/login";
  static const String logoutEndpoint = "/api/logout";
  static const String logoutAllEndpoint = "/api/logout-all";

// CategoryController
  static const String getAllUserCategoriesEndpoint =
      "/api/category/categories/user";
  static const String createUserCategoryEndpoint =
      "/api/category/categories/user";

// CurrencyController
  static const String getAllCurrenciesEndpoint = "/api/currency/currencies";
  static const String addCurrencyEndpoint = "/api/currency/currencies";

// FamilyController
  static const String getAllFamiliesEndpoint = "/api/families";
  static const String getFamilyByIdEndpoint = "/api/families/{id}";
  static const String getFamilyByCodeEndpoint = "/api/families/{code}";
  static const String getMyFamiliesEndpoint = "/api/families/my_families";

// UserController
  static const String getAllUsersEndpoint = "/api/users";
  static const String getMyProfileEndpoint = "/api/users/me";
  static const String getUserProfileEndpoint = "/api/users/{username}";

  // static String getUserDataAndIdEndpoint(id) {
  //   return "user/get-user/$id";
  // }
}

class ApiKey {
  static const status = "status";
  static const String message = "message";
  static const String token = "token";

  //For Register  and Login
  // الحقول المطلوبة
  static const String username = "username";
  static const String password = "password";
  //For Register
  static const String email = "email";
  static const String firstName = "firstName";
  static const String lastName = "lastName";

// الحقول الاختيارية
  static const String profileImage = "profileImage"; // Base64
  static const String bio = "bio";
  static const String job = "job";
  static const String birthDate = "birthDate"; // yyyy-MM-dd
  // for Category
  static const String categoryName = "categoryName";
  static const String type = "type"; // "EXPENSE" أو "INCOME"

// for Currency
  static const String isoCode = "isoCode";
  static const String name = "name";
  static const String symbol = "symbol";

// حقول الاستجابة
  static const String id = "id";
  static const String familyName = "familyName";
  static const String description = "description";
// static const String profileImage = "profileImage";
  static const String familyCode = "familyCode";
  static const String creationDate = "creationDate";
  static const String creator = "creator";
  static const String members = "members";

// حقول العضو (Member)
  static const String memberId = "id";
  static const String memberUsername = "username";
  static const String memberRole = "role";

// for user
// static const String username = "username";
  static const String image = "image";
// static const String firstName = "firstName";
// static const String lastName = "lastName";
// static const String bio = "bio";
// static const String job = "job";
  static const String birthdate = "birthdate";
  static const String joinDate = "joinDate";
  static const String families = "families";
 

// حقول العائلة في الملف الشخصي
  static const String familyId = "id";
// static const String familyName = "familyName";
  static const String role = "role";
}
