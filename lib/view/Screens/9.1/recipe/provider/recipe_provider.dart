import 'package:api_calling/view/Screens/9.1/recipe/helper/recipe_helper.dart';
import 'package:api_calling/view/Screens/9.1/recipe/modal/recipe_modal.dart';
import 'package:flutter/foundation.dart';

class RecipeProvider extends ChangeNotifier {
  RecipeHelper recipeHelper = RecipeHelper();
  RecipeModal? recipeModal;
  String searchImg = '';

  Future<RecipeModal?> fromMap() async {
    try {
      final data = await recipeHelper.fetchApiData();
      if (data.isNotEmpty) {
        recipeModal = RecipeModal.fromJson(data);
        notifyListeners();  // Notify listeners to rebuild widgets
        return recipeModal;
      } else {
        throw Exception('No data received from API');
      }
    } catch (e) {
      print('Error in fromMap: $e');
      return null;
    }
  }

}
