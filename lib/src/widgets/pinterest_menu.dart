import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class PinterestButton{
  final Function onPress;
  final IconData icon;

  PinterestButton({
    @required this.onPress, 
    @required this.icon
  });
}

class PinterestMenu extends StatelessWidget {

  final bool mostar;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<PinterestButton> items;

  PinterestMenu({
    this.mostar       = true,
    this.backgroundColor= Colors.white,
    this.activeColor  = Colors.black,
    this.inactiveColor = Colors.blueGrey,
    @required this.items
  });

  // final List<PinterestButton> items = [
  //   PinterestButton(icon: Icons.pie_chart, onPress: (){print("Icon pie_chart");}),
  //   PinterestButton(icon: Icons.search, onPress: (){print("Icon search");}),
  //   PinterestButton(icon: Icons.notifications, onPress: (){print("Icon notifications");}),
  //   PinterestButton(icon: Icons.supervised_user_circle, onPress: (){print("Icon supervised_user_circle");})
  // ];



  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: Builder(
        builder: (BuildContext context) { 

          Provider.of<_MenuModel>(context).backgroundColor  = this.backgroundColor;
          Provider.of<_MenuModel>(context).activeColor      = this.activeColor;
          Provider.of<_MenuModel>(context).inactiveColor    = this.inactiveColor;

          return AnimatedOpacity(
            duration: Duration(milliseconds: 200),
            opacity: (mostar)?1:0,
            child: _PinterestMenuBackground(
              child:_MenuItems(items),
            ),
          );
        },
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  
  final Widget child;

  const _PinterestMenuBackground({@required this.child});

  @override
  Widget build(BuildContext context) {
    
    final backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;
    
    return Container(
      child: child,
      width: 250.0,
      height: 60,
      decoration: BoxDecoration(
        color:backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(100)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            //offset: Offset(10,10),
            blurRadius: 10,
            spreadRadius: -5
          )
        ]
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {

  final List<PinterestButton> menuItems;

  const _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length, (index) => _PinterestMenuButton(index,menuItems[index])),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {

  final int index;
  final  PinterestButton item;

  const _PinterestMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {

    final mmodel = Provider.of<_MenuModel>(context);

    return GestureDetector(
      onTap: (){
        Provider.of<_MenuModel>(context,listen: false).itemSelect=index;
        item.onPress();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: mmodel.itemSelect==index?35.0:25.0,
          color: mmodel.itemSelect==index?mmodel.activeColor:mmodel.inactiveColor,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier{

  int _itemSelect =0;
  Color _backgroundColor = Colors.white;
  Color _activeColor=Colors.black;
  Color _inactiveColor=Colors.blueGrey;

  int get itemSelect => this._itemSelect;

  set itemSelect(int value){
    this._itemSelect=value;
    notifyListeners();

  }
  Color get activeColor => this._activeColor;

  set activeColor(Color value){
    this._activeColor=value;

  }
  Color get inactiveColor => this._inactiveColor;

  set inactiveColor(Color value){
    this._inactiveColor=value;

  }
  Color get backgroundColor => this._backgroundColor;

  set backgroundColor(Color value){
    this._backgroundColor=value;

  }
}