import 'package:get/get.dart';

import '../../../../app/urls.dart';
import '../../../../services/network_caller/network_caller.dart';
import '../../data/models/banner_list_model.dart';
import '../../data/models/banner_model.dart';

class HomeBannerListController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  CategoryListModel? _bannerListModel;

  List<CategoryModel> get bannerList => _bannerListModel?.categoryList ?? [];

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> getHomeBannerList() async {
    bool isSuccessful = false;
    _inProgress = true;
    update();
    final NetworkResponse response =
        await Get.find<NetworkCaller>().getRequest(Urls.bannerListUrl);
    if (response.isSuccess) {
      _bannerListModel = CategoryListModel.fromJson(response.responseData);
      isSuccessful = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccessful;
  }
}
