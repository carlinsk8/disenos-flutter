import 'package:flutter/material.dart';
// primaryColorLight
// accentColor
// scaffoldBackgroundColor
//textTheme.body1.color
class ThemeChanger with ChangeNotifier{
  bool _darkTheme   = false;
  bool _custonTheme = false;

  ThemeData _currentTheme;

  bool get darkTheme => this._darkTheme;
  bool get custonTheme => this._custonTheme;
  ThemeData get currentTheme => this._currentTheme;

  ThemeChanger(int theme){
    switch(theme){
      case 1://light
        this._darkTheme=false;
        this._custonTheme=false;
        this._currentTheme= ThemeData.light().copyWith(
          accentColor: Colors.pink
        );
      break;
      case 2://Dark
        this._darkTheme=true;
        this._custonTheme=false;
        this._currentTheme= ThemeData.dark().copyWith(
          accentColor: Colors.pink
        );
      break;
      case 3://Dark
        this._darkTheme=false;
        this._custonTheme=true;
      break;
      default:
        this._darkTheme=false;
        this._custonTheme=false;
        this._currentTheme= ThemeData.light();
    }
  }

  set darkTheme(bool value){
    this._darkTheme=value;
    this._custonTheme=false;

    if(value){
      _currentTheme=ThemeData.dark().copyWith(
          accentColor: Colors.pink
        );
    }else{
      _currentTheme=ThemeData.light().copyWith(
          accentColor: Colors.pink
        );
    }

    notifyListeners();
  }

  set custonTheme(bool value){
    this._darkTheme=false;
    this._custonTheme=value;

    if(value){
      _currentTheme=ThemeData.dark().copyWith(
          accentColor: Color(0xff48A0eB),
          primaryColorLight:Colors.white,
          scaffoldBackgroundColor: Color(0xff16202b),
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.white)
          )
         // textTheme.body1.color:Colors.pink,
        );
    }else{
      _currentTheme=ThemeData.light();
    }

    notifyListeners();
  }
}