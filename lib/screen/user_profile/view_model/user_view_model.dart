import 'package:flutter/material.dart';
import 'package:profile_mobile/api/get_api.dart';
import 'package:profile_mobile/screen/user_profile/model/list_user_model.dart';

class UserViewModel extends ChangeNotifier {
  UserViewModel() {
    getAPIListUser();
  }
  bool _loading = false;
  ListUserModel _listUserModel = ListUserModel();

  bool get loading => _loading;
  ListUserModel get listUserModel => _listUserModel;

  setLoading({required bool value}) {
    _loading = value;
    notifyListeners();
  }

  Future setListUserModel({required ListUserModel list}) async {
    _listUserModel = list;
  }

  getAPIListUser() async {
    setLoading(value: true);
    var response = await GetAPI().getUser(countUser: 10);
    if (response != null) {
      await setListUserModel(list: ListUserModel.fromJson(response));
    }
    setLoading(value: false);
  }
}
