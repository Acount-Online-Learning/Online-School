import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

final Color defaultColor= HexColor('#6C5CE7');
final Color defaultColorContainer=  Colors.grey.withOpacity(.1);
double width(context,size)=>MediaQuery.of(context).size.width*size;
double height(context,size)=>MediaQuery.of(context).size.height*size;
