import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yaax/constants/constants.dart';
import 'package:flutter_yaax/models/product_entity.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailView extends StatelessWidget {
  static const String id = 'detail_view';
  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text(
              product.name,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            backgroundColor: kColorBrown,
          ),
          SliverToBoxAdapter(
            child: CachedNetworkImage(
              imageUrl: product.image!,
              height: 300,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 80,
              child: Center(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: product.categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      var cat = product.categories[index];
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.all(5),
                        height: 80,
                        width: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.image),
                            Text(
                              cat,
                              style: GoogleFonts.acme(),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Descripción',
                    style: GoogleFonts.anton(fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Text(
                    product.description,
                    style: kFFGotham.copyWith(
                      fontSize: 18,
                      fontWeight: kWeightRegular,
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Técnica',
                    style: GoogleFonts.anton(fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Text(
                    product.technique,
                    style: kFFGotham.copyWith(
                      fontSize: 18,
                      fontWeight: kWeightRegular,
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Origen',
                    style: GoogleFonts.anton(fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Text(
                    product.origin,
                    style: kFFGotham.copyWith(
                      fontSize: 18,
                      fontWeight: kWeightRegular,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kColorBlue,
        onPressed: () {},
        child: Icon(
          Icons.favorite_border_outlined,
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(15),
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Text(
              product.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: kFFGotham.copyWith(
                fontWeight: kWeightBold,
                fontSize: 18,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '\$ ${product.price}',
                  style: kFFAntonio,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: kColorBlue,
                  onPressed: () {},
                  child: Text(
                    'Agregar',
                    style: kFFGotham.copyWith(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
