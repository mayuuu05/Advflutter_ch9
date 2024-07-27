import 'package:api_calling/helper/helper.dart';
import 'package:flutter/cupertino.dart';

import '../modal/pixabay_modal.dart';

class PixabayProvider extends ChangeNotifier {
  ApiHelper apiHelper = ApiHelper();
  PixaBayModal? pixaBayModal;
  String searchImg = '';

  void getImages(String img) {
    searchImg = img;
    notifyListeners();
  }

  Future<PixaBayModal?> fromMap(String img) async {
    final data = await apiHelper.fetchApiData(img);
    pixaBayModal = PixaBayModal.fromjson(data);
    return pixaBayModal;
  }
}
