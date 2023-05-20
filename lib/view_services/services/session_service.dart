class SessionController{
  static final SessionController _sesion =SessionController._internal();
  String?userid;
  factory SessionController(){
    return _sesion;
  }
  SessionController._internal(){

  }
}