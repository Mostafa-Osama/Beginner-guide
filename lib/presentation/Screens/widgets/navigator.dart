import 'package:flutter/material.dart';

pushReplacement({required context,required Widget screen}){
  return Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>screen));
}

push({required context , required Widget screen}){
  return Navigator.push(context, MaterialPageRoute(builder: (context)=>screen));
}

pop({required context}){
  return Navigator.pop(context);
}