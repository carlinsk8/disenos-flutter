import 'package:disenos/src/theme/theme_changer.dart';
import 'package:disenos/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GraficasCircularesPage extends StatefulWidget {
  const GraficasCircularesPage({Key key}) : super(key: key);

  @override
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  
  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: (){
          setState(() {
            porcentaje+=10;
            if (porcentaje>100) {
              porcentaje=0;
              
            }
          });
        }
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(porcentaje: porcentaje,color:Colors.purple),
              CustomRadialProgress(porcentaje: porcentaje*1.2,color:Colors.pink)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(porcentaje: porcentaje*1.4,color:Colors.orange),
              CustomRadialProgress(
                porcentaje: porcentaje*1.6,
                color:Colors.pink,
                gradient: LinearGradient(
                  colors: [
                    Color(0xffc012ff),
                    Color(0xff6085e8),
                    Colors.red
                  ]
                
                )
              )
            ],
          )
        ],
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  const CustomRadialProgress({
    @required this.porcentaje,
    @required this.color,
    this.gradient
  });
  final Color color;
  final double porcentaje;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    final appTheme= Provider.of<ThemeChanger>(context).currentTheme;
    return Container(
      width: 200.0,
      height: 200.0,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimary: color,
        colorSecondary: appTheme.textTheme.bodyText1.color,
        gradient: gradient,
      ),
    );
  }
}

