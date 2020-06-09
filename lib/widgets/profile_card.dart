import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle1;
  final String subtitle2;
  final bool isExpanded;
  final VoidCallback onPress;

  const ProfileCard(
      {Key key,
      @required this.image,
      @required this.title,
      @required this.subtitle1,
      this.subtitle2,
      this.onPress,
      @required this.isExpanded})
      : assert(isExpanded != null),
        assert(image != null),
        assert(title != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Card(
        elevation: 10,
        shadowColor: Colors.grey[100],
        margin: EdgeInsets.only(
          top: 0,
          left: 25,
          right: 25,
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: Container(
              height: isExpanded
                  ? MediaQuery.of(context).size.height * 0.25
                  : MediaQuery.of(context).size.height * 0.20,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
//                minRadius: 25,
                      radius: 40,
                      backgroundImage: NetworkImage(image),
//                    maxRadius: 28,
                    ),
                  ),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(subtitle1),
                  if (isExpanded)
                    Divider(
                      endIndent: 10,
                      indent: 10,
                    ),
                  if (isExpanded)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        subtitle2,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                    )
                ],
              ),
            )),
      ),
    );
  }
}
