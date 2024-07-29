import 'package:api_calling/view/Screens/9.1/e_commerce/helper/e_commerce_helper.dart';
import 'package:api_calling/view/Screens/9.1/e_commerce/modal/e_commerce_modal.dart';
import 'package:flutter/cupertino.dart';



class ECommerceProvider extends ChangeNotifier
{
  ECommerceHelper eCommerceHelper = ECommerceHelper();
  ECommerceModal? eCommerceModal;

  Future<ECommerceModal?> fromJson()
  async {
    final data = await eCommerceHelper.fetchData();
    eCommerceModal = ECommerceModal.fromJson(data);
    notifyListeners();
    return eCommerceModal;

  }

}