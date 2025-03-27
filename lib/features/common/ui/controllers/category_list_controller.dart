import 'package:get/get.dart';
import '../../../../app/urls.dart';
import '../../../../services/network_caller/network_caller.dart';
import '../../data/models/category_list_model.dart';
import '../../data/models/category_model.dart';



class CategoryListController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  CategoryListModel? _categoryListModel;

  List<CategoryModel> get categoryList => _categoryListModel?.categoryList ?? [];

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> getCategoryList() async {
    bool isSuccessful = false;
    _inProgress = true;
    update();
    final NetworkResponse response =
    await Get.find<NetworkCaller>().getRequest(Urls.categoryListUrl);
    if (response.isSuccess) {
      _categoryListModel = CategoryListModel.fromJson(response.responseData);
      isSuccessful = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccessful;
  }
}
