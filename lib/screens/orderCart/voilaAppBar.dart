import 'package:OrderManagement/colors.dart';
import 'package:flutter/material.dart';
import 'package:OrderManagement/services/auth.dart';

class VoilaAppBar extends StatefulWidget implements PreferredSizeWidget {
  Size get preferredSize => const Size.fromHeight(65);
  @override
  _VoilaAppBarState createState() => _VoilaAppBarState();
}

class _VoilaAppBarState extends State<VoilaAppBar> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return new AppBar(
      title: Text("Order Cart", style: TextStyle(color: Colors.black)),
      backgroundColor: PrimaryColor,
      automaticallyImplyLeading: true,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        onPressed: () async {
          await _auth.signOut();
        },
      ),
      elevation: 0.0,
      bottom: PreferredSize(
        child: Container(color: SecondaryColor, height: 8.0),
        preferredSize: Size.fromHeight(8.0),
      ),
    );
  }
}
