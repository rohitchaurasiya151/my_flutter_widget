import 'package:get/get.dart';
import '../../common/apis/news.dart';
import '../../common/entity/news.dart';

class NewsDioController extends GetxController {
  var newsPageList =
      Rx<NewsPageListResponseEntity>(NewsPageListResponseEntity());

  @override
  void onInit() {
    super.onInit();
    print("onInit");
  }

  @override
  void onClose() {
    super.onClose();
    print("onClose");
  }

  getPageList() async {
    newsPageList.value = await NewsAPI.newsPageList();
  }
}
