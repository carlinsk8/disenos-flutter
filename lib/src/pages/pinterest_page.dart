import 'package:disenos/src/theme/theme_changer.dart';
import 'package:disenos/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';


class PinterestPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
        body: Stack(children: <Widget>[
          PinteresGrid(),
          _PinterestMenuLocation(),
        ],),
        //body: PinterestMenu(),
        //body: PinteresGrid(),
   ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mostar = Provider.of<_MenuModel>(context).mostar;
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(bottom: 20.0),
        child: PinterestMenu(
          mostar: mostar,
          backgroundColor: appTheme.scaffoldBackgroundColor,
          activeColor: appTheme.accentColor,
          items: [
            PinterestButton(icon: Icons.pie_chart, onPress: (){print("Icon pie_chart");}),
            PinterestButton(icon: Icons.search, onPress: (){print("Icon search");}),
            PinterestButton(icon: Icons.notifications, onPress: (){print("Icon notifications");}),
            PinterestButton(icon: Icons.supervised_user_circle, onPress: (){print("Icon supervised_user_circle");})
          ],
          // backgroundColor: Colors.green,
          // activeColor: Colors.red,
          // inactiveColor: Colors.grey,
        )
      )
    );
  }
}

class PinteresGrid extends StatefulWidget {

  @override
  _PinteresGridState createState() => _PinteresGridState();
}

class _PinteresGridState extends State<PinteresGrid> {
  final List<int> item = List.generate(200, (index) => index);
  ScrollController controller = new ScrollController();
  double scrollAnterior=0;

  @override
  void initState() {
    controller.addListener(() {
      if (controller.offset > scrollAnterior && controller.offset > 200){
        Provider.of<_MenuModel>(context,listen: false).mostar=false;
      }else{
        Provider.of<_MenuModel>(context,listen: false).mostar=true;
      }
      scrollAnterior = controller.offset;
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int count=2;
    if (MediaQuery.of(context).size.width>500) {
      count = 3;
    }

    return StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: count,
      itemCount: item.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(1, index.isEven ? 1 : 2),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  
    final int index;

  const _PinterestItem(this.index);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(30))
        ),
        child: new Center(
          child: new CircleAvatar(
            backgroundColor: Colors.white,
            child: new Text('$index'),
          ),
        ));
  }
}

class _MenuModel with ChangeNotifier{
  bool _mostrar = true;

  bool get mostar => this._mostrar;
  set mostar(bool valor){
    this._mostrar=valor;
    notifyListeners();
  }
}