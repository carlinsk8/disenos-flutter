import 'package:disenos/src/theme/theme_changer.dart';
import 'package:disenos/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    bool isLarge=false;
    if (MediaQuery.of(context).size.height>500) {
      isLarge=true;
    }

    final children=<Widget>[
          Expanded(child: _MySlideShow()),
          Expanded(child: _MySlideShow()),
        ];

    return Scaffold(
      // backgroundColor: Colors.purple,
      body: isLarge?
        Column(children: children,):
        Row(children: children,)
    );
  }
}

class _MySlideShow extends StatelessWidget {
  const _MySlideShow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final darkTheme = Provider.of<ThemeChanger>(context).darkTheme;
    final accentColor = Provider.of<ThemeChanger>(context).currentTheme.accentColor;
    return SlideShow(
      bulletPrimary:15,
      bulletSecondary:10,
      colorPrimary: darkTheme?accentColor:Colors.purpleAccent,
      // colorSecondary: Colors.white,
      slides: <Widget>[
        Center(child: Text("Bienvenidos")),
        SvgPicture.asset("assets/svgs/slide-1.svg"),
        SvgPicture.asset("assets/svgs/slide-2.svg"),
        SvgPicture.asset("assets/svgs/slide-3.svg"),
        SvgPicture.asset("assets/svgs/slide-4.svg"),
        SvgPicture.asset("assets/svgs/slide-5.svg"),
        SvgPicture.asset("assets/svgs/slide-6.svg"),
      ],
    );
  }
}