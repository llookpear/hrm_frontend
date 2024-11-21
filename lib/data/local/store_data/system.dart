import 'package:hive/hive.dart';
part 'system.g.dart';

@HiveType(typeId: 1)
class StoreSystemData extends HiveObject {
  @HiveField(0)
  String? accessToken;

  @HiveField(1)
  String? companyID;

  @HiveField(2)
  String? lastUsernameLogin;

  @HiveField(3)
  String languageCode = 'en';

  @HiveField(4)
  String countryCode = 'US';



  Future<void> reset() async {
    accessToken = null;
    companyID = null;
    await save();
  }


  @override
  String toString() {
    return 'StoreSystemData{accessToken: $accessToken, companyID: $companyID, lastUsernameLogin: $lastUsernameLogin, languageCode: $languageCode, countryCode: $countryCode}';
  }

}
