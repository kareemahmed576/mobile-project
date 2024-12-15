import 'package:shared_preferences/shared_preferences.dart';

late bool check;

savePref(bool _check,String _name,String _email)async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setBool('check', _check);
  preferences.setString('name', _name);
  preferences.setString('email', _email);
}
