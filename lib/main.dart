import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_yaax/bloc/bloc_products.dart';
import 'package:flutter_yaax/repositories/product_repository.dart';
import 'package:flutter_yaax/views/detail_view.dart';
import 'package:flutter_yaax/views/menu_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => ProductNodeRepository())
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ProductsBloc>(
            lazy: false,
            create: (context) =>
                ProductsBloc(context.read<ProductNodeRepository>())
                  ..add(ProductsEvent.LOAD),
          )
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => MenuView(),
            DetailView.id: (context) => DetailView(),
          },
        ),
      ),
    );
  }
}
