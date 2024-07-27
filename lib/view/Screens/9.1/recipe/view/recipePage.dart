import 'package:api_calling/view/Screens/9.1/recipe/modal/recipe_modal.dart';
import 'package:api_calling/view/Screens/9.1/recipe/provider/recipe_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Recipepage extends StatelessWidget {
  const Recipepage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    RecipeProvider recipeProviderFalse =
        Provider.of<RecipeProvider>(context, listen: false);
    RecipeProvider recipeProviderTrue =
        Provider.of<RecipeProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            'Recipes',
            style: TextStyle(color: Colors.white),
          ),
          leading: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          actions: const [
            Icon(
              Icons.search,
              color: Colors.white,
            )
          ],
        ),
       body: Column(
         children: [
           Padding(
             padding: const EdgeInsets.only(
                 top: 10, bottom: 25, left: 10, right: 10),
             child: Container(
               height: 170,
               width: double.infinity,
               decoration: BoxDecoration(
                   color: Colors.black,
                   borderRadius: BorderRadius.circular(13),
                   image: const DecorationImage(
                     image: AssetImage('assets/images/banner.jpg'),
                     fit: BoxFit.cover,
                     opacity: 0.4,
                   ),
                   boxShadow: const [
                     BoxShadow(
                         color: Colors.grey,
                         offset: Offset(0, 3),
                         // spreadRadius: 1,
                         blurRadius: 2)
                   ]
               ),
               alignment: Alignment.center,
               child: const Text(
                 'My Digital \nRecipe Book',
                 style: TextStyle(
                     color: Colors.white70,
                     fontSize: 25,
                     fontWeight: FontWeight.bold),
               ),
             ),
           ),
           const SizedBox(
             width: 320,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(
                   'All Recipes',
                   textAlign: TextAlign.left,
                   style: TextStyle(color: Colors.white, fontSize: 20),
                 ),
                 Icon(
                   Icons.filter_alt,
                   color: Colors.white,
                 )
               ],
             ),
           ),
           Expanded(
             child: FutureBuilder(
               future: Provider.of<RecipeProvider>(context,listen: false).fromMap() ,
               builder:(context,snapShot) {
                 if (snapShot.hasData) {
                   RecipeModal? re = snapShot.data;
                   return Padding(
                     padding: const EdgeInsets.all(5.0),
                     child: ListView.builder(
                       physics: BouncingScrollPhysics(),
                       itemCount: re!.recipes.length,
                       itemBuilder: (context, index) {
                         return GestureDetector(
                           onTap: () {
                              selectedIndex = index;
                              Navigator.of(context).pushNamed('/details');
                           },

                             child: buildRow(re, index));
                       },
                     ),
                   );
                 } else {
                   return const Center(
                     child: CircularProgressIndicator(color: Colors.white,),
                   );
                 }
               },
             ),
           ),
         ],
       ),
      ),
    );
  }

  Row buildRow(RecipeModal re, int index) {
    return Row(
                           children: [
                             Container(
                               height: 150,
                               width: 150,
                               margin: const EdgeInsets.all(10),
                               decoration: BoxDecoration(
                                 color: Colors.grey[200],
                                 borderRadius: BorderRadius.circular(20),
                                 image: DecorationImage(
                                   image: NetworkImage(re.recipes[index].image),
                                   fit: BoxFit.cover,
                                 ),
                               ),
                             ),
                             Expanded(
                               child: Padding(
                                 padding: const EdgeInsets.all(10.0),
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text(
                                       re.recipes[index].name,
                                       style: const TextStyle(
                                         color: Colors.white,
                                         fontSize: 18,
                                         fontWeight: FontWeight.bold,
                                       ),
                                     ),
                                     const SizedBox(height: 5),
                                     Text(
                                       'Difficulty: ${re.recipes[index].difficulty}',
                                       style: const TextStyle(color: Colors.white70),
                                     ),
                                     const SizedBox(height: 5),
                                     Text(
                                       'Cuisine: ${re.recipes[index].cuisine}',
                                       style: const TextStyle(color: Colors.white70),
                                     ),
                                     const SizedBox(height: 5),
                                     Text(
                                       'Servings: ${re.recipes[index].servings}',
                                       style: const TextStyle(color: Colors.white70),
                                     ),
                                     const SizedBox(height: 5),
                                     Text(
                                       '⭐ 4.2',
                                       style: const TextStyle(color: Colors.white70),
                                     ),


                                   ],
                                 ),
                               ),
                             ),
                           ],
                         );
  }
}
int selectedIndex = 0;