import 'package:api_calling/view/Screens/9.1/recipe/view/recipePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../modal/recipe_modal.dart';
import '../provider/recipe_provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: FutureBuilder(
          future: Provider.of<RecipeProvider>(context, listen: false).fromMap(),
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              RecipeModal? re = snapShot.data;
              return Stack(
                children: [
                  Image.network(
                    re!.recipes[selectedIndex].image,
                    width: double.infinity,
                    height: 330,
                    fit: BoxFit.cover,
                  ),

                  DraggableScrollableSheet(
                    initialChildSize: 0.6,
                    minChildSize: 0.6,
                    maxChildSize: 1.0,
                    builder: (context, scrollController) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 16.0),
                                Text(
                                  re.recipes[selectedIndex].name,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Difficulty: ${re.recipes[selectedIndex].difficulty}',
                                      style: const TextStyle(color: Colors.white70),
                                    ),
                                    Text(
                                      '⏱ ${re.recipes[selectedIndex].cookTimeMinutes} - ${re.recipes[selectedIndex].prepTimeMinutes} min',
                                      style: const TextStyle(color: Colors.white70),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Cuisine: ${re.recipes[selectedIndex].cuisine}',
                                      style: const TextStyle(color: Colors.white70),
                                    ),
                                    Text(
                                      '⭐ 4.2',
                                      style: const TextStyle(color: Colors.white70),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Servings: ${re.recipes[selectedIndex].servings}',
                                  style: const TextStyle(color: Colors.white70),
                                ),const SizedBox(height: 16),Divider(),
                                const SizedBox(height: 16),
                                Text(
                                  'Instructions',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: re.recipes[selectedIndex].instructions.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                                      child: Text(
                                        'Step ${index + 1} - ${re.recipes[selectedIndex].instructions[index]}',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white60,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'Ingredients (${re.recipes[selectedIndex].ingredients.length})',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Card(
                                  color: Colors.grey[900],
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: re.recipes[selectedIndex].ingredients.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                                          child: Text(
                                            '${re.recipes[selectedIndex].ingredients[index]}',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white70,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
