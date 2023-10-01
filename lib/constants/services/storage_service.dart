import '../values/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late final SharedPreferences sharedPreferences;
  Future<StorageService> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

//[[[[[[[[[]]]]]]]]]
  Future<bool> setString(String key, String value) async {
    return await sharedPreferences.setString(key, value);
  }

  bool getIsLogIn() {
    return sharedPreferences
                .getString(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME) ==
            null
        ? false
        : true;
  }

//[[[[[[[[[]]]]]]]]]
}
