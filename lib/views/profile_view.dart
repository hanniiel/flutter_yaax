import 'package:flutter/material.dart';
import 'package:flutter_yaax/constants/constants.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            color: Color(0xFF385498),
            child: ListTile(
              leading: Icon(
                Icons.facebook_outlined,
                color: Colors.white,
              ),
              title: Text(
                'Ingresa con Facebok',
                style: kFFGotham.copyWith(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 20),
          MaterialButton(
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            color: Colors.black,
            child: ListTile(
              leading: Icon(
                Icons.invert_colors,
                color: Colors.white,
              ),
              title: Text(
                'Ingresa con Apple',
                style: kFFGotham.copyWith(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 20),
          MaterialButton(
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            color: Color(0xFFDF3929),
            child: ListTile(
              leading: Icon(
                Icons.invert_colors,
                color: Colors.white,
              ),
              title: Text(
                'Ingresa con Google',
                style: kFFGotham.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
