import 'package:online_shopping/product.dart';
import 'package:shared_preferences/shared_preferences.dart';


// remember me
late bool check;
savePref(bool check,String _name,String _email)async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setBool('check', check);
  preferences.setString('name', _name);
  preferences.setString('email', _email);
}
// cart

List<Product> cart_list = [];

// total price

double total_price = 0.0;