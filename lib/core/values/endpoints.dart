abstract class Endpoints {
  static const String baseUrl = "https://exam.elevateegy.com/api/v1";

  static const String signUp = "$baseUrl/auth/signup";

  static const String forgotPassword = "$baseUrl/auth/forgotPassword";
  static const String verifyResetCode = "$baseUrl/auth/verifyResetCode";
  static const String resetPassword = "$baseUrl/auth/resetPassword";
  static const String signIn = "$baseUrl/auth/signin";
  static const String profileData = "$baseUrl/auth/profileData";
  static const String editProfile = "$baseUrl/auth/editProfile";
  static const String getAllSubjects = "$baseUrl/subjects";
  static const String questionsOnExam = "/questions";
  static const String getSubjectExams = "$baseUrl/exams";

}
