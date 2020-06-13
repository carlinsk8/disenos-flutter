import 'package:disenos/src/chalenge/cuadrado_animado_page.dart';
import 'package:disenos/src/theme/theme_changer.dart';
import 'package:disenos/src/widgets/header.dart';
//import 'package:disenos/src/pages/animaciones_pages.dart';
//import 'package:disenos/src/widgets/header.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeaderPage extends StatelessWidget {
  const HeaderPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final accentColor = Provider.of<ThemeChanger>(context).currentTheme.accentColor;
    return Scaffold(
      body:HeaderWave(color: accentColor,)
    );
  }
}