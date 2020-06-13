// import 'package:disenos/src/models/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlideShow extends StatelessWidget {

  final List<Widget> slides;
  final bool dotsTop;
  final Color colorPrimary;
  final Color colorSecondary;
  final double bulletPrimary;
  final double bulletSecondary;

  SlideShow({
    @required this.slides,
    this.dotsTop=false,
    this.colorPrimary = Colors.blue,
    this.colorSecondary = Colors.grey,
    this.bulletPrimary = 12.0,
    this.bulletSecondary = 12.0
  });


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=> new _SlideShowModel(),
      child: SafeArea(
        child: Center(
            child: Builder(
              builder: (BuildContext context) {  
                Provider.of<_SlideShowModel>(context).colorPrimary=this.colorPrimary;
                Provider.of<_SlideShowModel>(context).colorSecondary=this.colorSecondary;
                Provider.of<_SlideShowModel>(context).bulletPrimary=this.bulletPrimary;
                Provider.of<_SlideShowModel>(context).bulletSecondary=this.bulletSecondary;
                return _EstructSlideShow(dotsTop: dotsTop, slides: slides);
              },
            ),
          ),
      ),
    );
  }
}

class _EstructSlideShow extends StatelessWidget {
  const _EstructSlideShow({
    Key key,
    @required this.dotsTop,
    @required this.slides,
  }) : super(key: key);

  final bool dotsTop;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (this.dotsTop) _Dots(this.slides.length),
        Expanded(
          child: _Slides(this.slides)
        ),
        if (!this.dotsTop) _Dots(this.slides.length),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlide;
  _Dots(
    this.totalSlide,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(totalSlide, (index) => _Dot(index)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  _Dot(
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    final ssModel = Provider.of<_SlideShowModel>(context);
    double size;
    Color color;
    if (ssModel.currentPage>=index -0.5 && ssModel.currentPage < index +0.5) {
      size= ssModel.bulletPrimary;
      color=ssModel.colorPrimary;
    }else{
      size= ssModel.bulletSecondary;
      color=ssModel.colorSecondary;
    }
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      width: size,
      height: size,
      decoration: BoxDecoration(
        color:color,
        shape: BoxShape.circle
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {

  final pageViewController = new PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      Provider.of<_SlideShowModel>(context,listen: false).currentPage = pageViewController.page;
    });
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;
  _Slide( this.slide );

  @override
  Widget build(BuildContext context) {
    //return SvgPicture.asset("assets/svgs/slide-1.svg");
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide,
    );
  }
}

class _SlideShowModel with ChangeNotifier{
  
  double _currentPage = 0;
  Color _colorPrimary= Colors.blue;
  Color _colorSecondary= Colors.grey;
  double _bulletPrimary=12.0;
  double _bulletSecondary=12.0;

  double get currentPage => this._currentPage;
  Color get colorPrimary => this._colorPrimary;
  Color get colorSecondary => this._colorSecondary;
  double get bulletPrimary => this._bulletPrimary;
  double get bulletSecondary => this._bulletSecondary;

  set currentPage(double value){
    this._currentPage = value;
    notifyListeners();
  } 

  set colorPrimary(Color value){
    this._colorPrimary = value;
  }

  set colorSecondary(Color value){
    this._colorSecondary = value;
  }

  set bulletPrimary(double value){
    this._bulletPrimary = value;
  } 

  set bulletSecondary(double value){
    this._bulletSecondary = value;
  } 
}