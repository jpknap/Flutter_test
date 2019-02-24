import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


 return new Container(
   color:Colors.blueAccent ,
   child:  ImageRotate(),
    );
  }
}
class ImageRotate extends StatefulWidget {
  @override
  _ImageRotateState createState() => new _ImageRotateState();
}

class _ImageRotateState extends State<ImageRotate>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 2),
    );
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      color: Colors.blueAccent,
      child: new AnimatedBuilder(
        animation: animationController,
        child: new Container(
          height: 150.0,
          width: 150.0,
          child: new Image.asset('assets/images/yolandaSultana.png'),
        ),
        builder: (BuildContext context, Widget _widget) {
          return new Transform.rotate(
            angle: animationController.value * 10,
            child: _widget,
          );
        },
      ),
    );
  }
}