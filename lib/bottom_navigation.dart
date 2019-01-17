import 'package:flutter/material.dart';
import './pages/about.dart';
import './pages/components/component.dart';
class BottomNavigationWidget extends StatefulWidget {
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final _BottomNavigationColor = Colors.blue;
  int _currentIndex=0;
  var appBarTitle=["组件","关于"];
  var appBarIcon=[Icons.all_inclusive,Icons.blur_on];
  List<Widget> list=List();
  // 导航栏文字选中颜色
  Text getTabTitle(int curIndex){
    if(curIndex==_currentIndex){
      return new Text(appBarTitle[curIndex],
      style: new TextStyle(fontSize: 14.0,color:const Color(0xff845F3F)));
    }else{
      return new Text(appBarTitle[curIndex],
      style: new TextStyle(fontSize: 14.0, color: const Color(0xff696969)));
    }
  }

  // 小图标改变选中颜色
  Icon getIcon(int curIndex){
    if(curIndex==_currentIndex){
      return Icon(appBarIcon[curIndex],color:const Color(0xff845F3F));
    }else{
      return Icon(appBarIcon[curIndex],color:const Color(0xff696969));
    }
  }

  // 初始化方法
  @override
  void initState() {
      list
      ..add(ComponentPage())
      ..add(AboutPage());
      super.initState();
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(icon: getIcon(0),title: getTabTitle(0)),
          new BottomNavigationBarItem(icon: getIcon(1),title: getTabTitle(1)),
        ],
        fixedColor: Colors.orange,
        // 高亮选项
        currentIndex: _currentIndex,
        onTap: (int index){
          setState(() {
            _currentIndex=index;
          });
        },
      ),
    );
  }
}