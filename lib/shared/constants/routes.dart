class Routes {

  static const String authService =
  "https://identitytoolkit.googleapis.com/v1/";

  static const String apiKey = "AIzaSyDBkccNWCYLhl2gFjhvjzBZPBsYzn1zdQA";



  //ENTRAR com email e senha
  static String signIn() {
  return authService + "accounts:signInWithPassword?key=" + apiKey;
  }



  //cadastro com email e senha
  static String signUp() {
  return authService + "accounts:signUp?key=" + apiKey;
  }


}

