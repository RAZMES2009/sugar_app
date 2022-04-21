import 'package:localstorage/localstorage.dart';

class JsonHelper {
  static final LocalStorage storage = LocalStorage('sugar_app.json');

  static Future<void> saveToStorage(data) async {
    await storage.setItem('AUrdf@#4SD', data);
  }

  static fetchData() {
    return storage.getItem('AUrdf@#4SD');
  }

  static Future<void> clearAllData() async {
    await storage.clear();
  }
}
