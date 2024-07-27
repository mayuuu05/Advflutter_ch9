import 'dart:ffi';
import 'dart:ui';
import 'package:api_calling/modal/pixabay_modal.dart';
import 'package:api_calling/provider/pixabay_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:image_downloader/image_downloader.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PixabayProvider pixabayProviderFalse = Provider.of<PixabayProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: const Icon(
            Icons.pageview,
            color: Colors.green,
            size: 30,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0.4,
          title: const Text('Pixabay',style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold
          ),),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 10,
                right: 10
              ),
              child: TextField(
                cursorColor: Colors.green,
                onSubmitted: (value) {
                  pixabayProviderFalse.getImages(value);
                },
                controller: txtSearchImages,
                decoration: InputDecoration(

                  label: const Text('Search Images',style: TextStyle(
                    color: Colors.grey
                  ),),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 25,
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: Provider.of<PixabayProvider>(context, listen: false)
                    .fromMap(Provider.of<PixabayProvider>(context, listen: true).searchImg),
                builder: (context, snapShot) {
                  if (snapShot.hasData) {
                    PixaBayModal? image = snapShot.data;
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: image!.hits.length,
                        itemBuilder: (context, index) {
                          int likes = image.hits[index].likes;
                          bool isLiked = false;
                          return StatefulBuilder(
                            builder: (context, setState) {
                              return Container(
                                height: 200,
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: NetworkImage(image.hits[index].largeImageURL),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      bottom: 10,
                                      left: 10,
                                      right: 10,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                          child: Container(
                                            padding: const EdgeInsets.all(8.0),
                                            color: Colors.black.withOpacity(0.3),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    const Icon(Icons.remove_red_eye, color: Colors.white),
                                                    const SizedBox(width: 5),
                                                    Text(
                                                      '${image.hits[index].views}',
                                                      style: const TextStyle(color: Colors.white),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    IconButton(
                                                      icon: const Icon(Icons.download, color: Colors.white),
                                                      onPressed: ()  {
                                                      },
                                                    ),
                                                    const SizedBox(width: 5),
                                                    Text(
                                                      '${image.hits[index].downloads}',
                                                      style: const TextStyle(color: Colors.white),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    IconButton(
                                                      icon: Icon(
                                                        Icons.thumb_up,
                                                        color: isLiked ? Colors.red : Colors.white,
                                                      ),
                                                      onPressed: () {
                                                      },
                                                    ),
                                                    const SizedBox(width: 5),
                                                    Text(
                                                      '${image.hits[index].likes}',
                                                      style: const TextStyle(color: Colors.white),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
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
}

TextEditingController txtSearchImages = TextEditingController();
