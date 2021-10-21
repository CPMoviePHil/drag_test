import 'package:drag_test/youtube_iframe_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Scaffold(body: HomePage()));
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  Widget youtubeWidget() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      width: width,
      height: height,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          child: Stack(
            children: [
              YoutubeIframeWidget(),
            ],
          ),
        ),
      ),
    );
  }
  double width = 240.0, height = 135.0;
  late Offset position ;

  @override
  void initState() {
    super.initState();
    position = Offset(0.0, height + 120);
  }

  @override
  Widget build(BuildContext context) {
    Widget yWidget = youtubeWidget();
    return Stack(
      children: <Widget>[
        Positioned(
          left: position.dx,
          top: position.dy - height + 20,
          child: Draggable(
            child: yWidget,
            feedback: yWidget,
            onDraggableCanceled: (Velocity velocity, Offset offset){
              setState(() => position = offset);
            },
          ),
        ),
      ],
    );
  }
}
