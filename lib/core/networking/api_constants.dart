class ApiConstants {
  static const String apiBaseUrl = "https://rdbdwdrjthooaoktussn.supabase.co";
  static const String supabaseAnonKey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJkYmR3ZHJqdGhvb2Fva3R1c3NuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzcxNDU5MzAsImV4cCI6MjA5MjcyMTkzMH0.Fy_YHffMZmBl4LtRRQYWYBPVAb7aJQqNuxLEdLolYMQ";
  static const String login = "/auth/v1/token?grant_type=password";
  static const String signup = "/auth/v1/signup";
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
