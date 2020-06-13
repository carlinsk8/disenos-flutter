import 'package:flutter/material.dart';
import 'package:disenos/src/pages/grafica_circulares_page.dart';
import 'package:disenos/src/pages/pinterest_page.dart';
import 'package:disenos/src/pages/sliver_list_page.dart';
import 'package:disenos/src/chalenge/cuadrado_animado_page.dart';
import 'package:disenos/src/pages/headers_pages.dart';
import 'package:disenos/src/pages/emergency_page.dart';
import 'package:disenos/src/pages/slideshow_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.slideshare,'SlideShow',SlideshowPage()),
  _Route(FontAwesomeIcons.ambulance,'Emergencia',EmergencyPage()),
  _Route(FontAwesomeIcons.heading,'Encabezados',HeaderPage()),
  _Route(FontAwesomeIcons.peopleCarry,'Cuadro Animado',CuadradoAnimetePage()),
  _Route(FontAwesomeIcons.circleNotch,'Barra de progreso',GraficasCircularesPage()),
  _Route(FontAwesomeIcons.pinterest,'Pinterest',PinterestPage()),
  _Route(FontAwesomeIcons.mobile,'Slivers',SliverListPage()),
];



class _Route{
  final IconData icon;
  final String titulo;
  final Widget page;

  _Route(this.icon, this.titulo, this.page);
}