import 'package:flutter/material.dart';

class Component extends StatelessWidget {
  final double height;
  final double width;
  final String image;
  final String title;
  final VoidCallback onPress;

  const Component(
      {Key key,
      this.height,
      this.width,
      @required this.image,
      @required this.title,
      @required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 10,
        shadowColor: Colors.grey[200].withOpacity(.2),
        child: Container(
          height: height,
          width: width,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(image),
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyText2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
