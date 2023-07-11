
import 'package:shared_preferences/shared_preferences.dart';

class Share {

 
  Share({required this.counter});

  int counter = 0;
  String name = "初期値";
  bool isSelected = false;

  // 設定値を取得
void readSetting() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // setState(() {
  counter = await (prefs.getInt('counter') ?? 0) + 1;
  // });
  name = await prefs.getString('name') ?? '';
  isSelected = await prefs.getBool('isSelected') ?? false;
}

// 設定値を保存
void saveSetting() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt('counter', 777);
  await prefs.setString('name', 'Yamada');
  await prefs.setBool('isSelected', true);
  this.counter = (prefs.getInt('counter') ?? 0) + 1;
}

// 設定値を削除
void _deleteSetting() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // 型に関係なくキー名を指定するだけ
  await prefs.remove('counter');
  await prefs.remove('name');
  await prefs.remove('isSelected');
}
}