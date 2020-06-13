import 'package:animate_do/animate_do.dart';
import 'package:disenos/src/widgets/big_button.dart';
import 'package:flutter/material.dart';
import 'package:disenos/src/widgets/header.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemBoton {

  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton( this.icon, this.texto, this.color1, this.color2 );
}

class EmergencyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    bool isLarge=false;
    if (MediaQuery.of(context).size.height>550) {
      isLarge=true;
    }
    final items = <ItemBoton>[
      new ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      new ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      new ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      new ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
      new ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      new ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      new ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      new ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
      new ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      new ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      new ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      new ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
    ];

List<Widget> itemMap = items.map(
  (e) => FadeInLeft(
    duration: Duration(milliseconds: 250),
      child: BigButton(
      icon: e.icon,
      text: e.texto,
      colorPrimary: e.color1,
      colorSecondary: e.color2,
      onPress: (){print(e.texto);},
    ),
  )
).toList();
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top:isLarge?220:10),
            child: SafeArea(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  if(isLarge)
                    SizedBox(height: 50,),
                  ...itemMap
                ],
              ),
            ),
          ),
          if(isLarge)
            PageHeader()
        ],
      ),
   );
  }
}

class BigButtonTemp extends StatelessWidget {
  const BigButtonTemp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BigButton(
      onPress: (){print("object");},
      text: "More Actident",
      icon: FontAwesomeIcons.plus,
      colorPrimary: Colors.pink,
      colorSecondary: Colors.purple.withOpacity(0.6),
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        IconHeader(
          icon: FontAwesomeIcons.plus,
          title: "Haz Solicitado",
          subTitle: "Asistencia Médica",
          colorPrimary: Color(0xff526bf6),
          colorScondary: Color(0xff67acf2),
        ),
        Positioned(
          top: 30,
          right: 0,
          child: RawMaterialButton(
            shape: CircleBorder(),
            padding: EdgeInsets.all(15.0),
            onPressed: (){},
            child: FaIcon(FontAwesomeIcons.ellipsisV,color:Colors.white)
          )
        )
      ],
    );
  }
}