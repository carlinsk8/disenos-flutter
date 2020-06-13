import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BigButton extends StatelessWidget {

  final IconData icon;
  final String text;
  final Color colorPrimary;
  final Color colorSecondary;
  final Function onPress;

  BigButton({
    this.icon = FontAwesomeIcons.carCrash, 
    @required this.text, 
    this.colorPrimary=Colors.blueGrey, 
    this.colorSecondary=Colors.blue, 
    @required this.onPress
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Stack(
        children: <Widget>[
          _BackgroundButton(icon:this.icon,colorPrimary:this.colorPrimary,colorSecondary:this.colorSecondary),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 140.0,width: 40.0,),
              FaIcon(this.icon,color: Colors.white,size: 40.0,),
              SizedBox(width: 20.0,),
              Expanded(child: Text(this.text,style: TextStyle(color: Colors.white, fontSize: 18.0),)),
              FaIcon(FontAwesomeIcons.chevronRight,color: Colors.white,),
              SizedBox(width: 40.0,),
            ],
          )
        ],
      ),
    );
  }
}

class _BackgroundButton extends StatelessWidget {
  final IconData icon;
  final Color colorPrimary;
  final Color colorSecondary;

  const _BackgroundButton({
    this.icon, 
    this.colorPrimary, 
    this.colorSecondary
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -20,
              right: -20,
              child: FaIcon(this.icon , size: 150.0, color:Colors.white.withOpacity(0.2)))
          ],
        ),
      ),

      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(color:Colors.black.withOpacity(0.2),offset: Offset(4,6),blurRadius: 10.0),
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: <Color>[
            this.colorPrimary, 
            this.colorSecondary
            // Color(0xff6989f5),
            // Color(0xff906ef5)
          ]
        )
      ),
   );
  }
}