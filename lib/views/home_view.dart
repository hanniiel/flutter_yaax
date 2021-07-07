import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_yaax/bloc/bloc_products.dart';
import 'package:flutter_yaax/constants/constants.dart';
import 'package:flutter_yaax/ui/product_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Icon> icons = [
    Icon(Icons.category),
    Icon(Icons.liquor),
    Icon(Icons.coffee),
    Icon(Icons.handyman),
    Icon(Icons.health_and_safety),
  ];
  final List<String> categories = [
    'Orgánico',
    'Miel',
    'Café',
    'Artesanías',
    'Salud',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (_, state) {
          if (state is ProductsStateLoaded) {
            var products = state.products;

            var popular = (products..shuffle()).take(5).toList();
            var arrivals = (products..shuffle()).take(10).toList();
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    height: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, top: 10, bottom: 10),
                          child: Text(
                            'Categorías',
                            style: GoogleFonts.anton(
                              fontWeight: FontWeight.normal,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.only(
                                left: 20, right: 20, bottom: 15),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) {
                              var cat = categories[index];
                              return GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  padding: EdgeInsets.all(3),
                                  margin: EdgeInsets.only(right: 10),
                                  width: 80,
                                  height: 80,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      icons[index],
                                      Text(cat),
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount: 5,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, top: 10, bottom: 10),
                          child: Text(
                            'Populares',
                            style: GoogleFonts.anton(
                              fontWeight: FontWeight.normal,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.only(
                                left: 20, right: 20, bottom: 15),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) {
                              var product = popular[index];
                              return ProductWidget(product);
                            },
                            itemCount: popular.length,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, top: 10, bottom: 10),
                          child: Text(
                            'Nuevos productos',
                            style: GoogleFonts.anton(
                              fontWeight: FontWeight.normal,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.only(
                                left: 20, right: 20, bottom: 15),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) {
                              var product = arrivals[index];
                              return ProductWidget(product);
                            },
                            itemCount: arrivals.length,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else
            return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
