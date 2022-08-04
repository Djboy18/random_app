import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loadingscreen extends StatelessWidget {
  const Loadingscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      child: Center(
        child: SpinKitSpinningLines(
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}
