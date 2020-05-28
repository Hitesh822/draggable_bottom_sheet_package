# DraggableBottomSheet

This is a bottom sheet that is partially visible onto the screen and can be dragged from there into the screen to occupy the fullscreen.

![Draggable Bottom Sheet gif](https://github.com/Hitesh822/draggable_bottom_sheet_package/blob/master/assets/ezgif.com-gif-maker.gif)

### Get Started

Add dependencies 

`draggable_bottom_sheet:`

import package

`import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';`

### Example
```
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DraggableBottomSheetExample(title: 'Draggable Bottom Sheet Example'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DraggableBottomSheetExample extends StatelessWidget {
  DraggableBottomSheetExample({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    List<IconData> icons = [Icons.ac_unit, Icons.account_balance, Icons.adb, Icons.add_photo_alternate, Icons.format_line_spacing];
    
    return Scaffold(
      body: DraggableBottomSheet(
        backgroundWidget: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(title: Text(title), backgroundColor: Colors.deepOrange,),
          body: Container(
            height: 400,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(vertical: 32),
              itemCount: icons.length,
              itemBuilder: (context, index) => Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Icon(icons[index], color: Colors.white, size: 60,),
              ),
              separatorBuilder: (context, index) => SizedBox(width: 10),
            ),
          ),
        ),
        previewChild: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
          ),
          child: Column(
            children: <Widget>[
              Container(
                width: 40,
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
              SizedBox(height: 8,),
              Text('Drag Me', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
              SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: icons.map((icon){
                  return Container(
                    width: 50,
                    height: 50,
                    margin: EdgeInsets.only(right: 16),
                    child: Icon(icon, color: Colors.pink, size: 40,),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                  );
                }).toList()
              )
            ],
          ),
        ),
        expandedChild: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
          ),
          child: Column(
            children: <Widget>[
              Icon(Icons.keyboard_arrow_down, size: 30, color: Colors.white,),
              SizedBox(height: 8,),
              Text('Hey...I\'m expanding!!!', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
              SizedBox(height: 16,),
              Expanded(
                child: GridView.builder(
                  itemCount: icons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ), 
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Icon(icons[index], color: Colors.pink, size: 40,),
                  )
                ),
              )
            ],
          ),
        ),
        minExtent: 150,
        maxExtent: MediaQuery.of(context).size.height * 0.8,
      )
    );
  }
}
```

### Arguments
Description of DraggableBottomSheet arguments.

| Argument | Value | Description |
| ------ | ------ | ------ | 
| alignment | Alignment | Alignment of the sheet |
| backgroundWidget | Widget | This widget will hide behind the sheet when expanded. |
| blurBackground | Boolean | Whether to blur the background while sheet expnasion (true: modal-sheet, false: persistent-sheet) |
| expandedChild | Widget | Child of expended sheet |
| expansionExtent | Double | Extent from the min-height to change from previewChild to expandedChild |
| maxEntent | Double | Max-extent for sheet expansion |
| minEntent | Double | Min-extent for the sheet, also the original height of the sheet |
| previewChild | Widget | Child to be displayed when sheet is not expended |
| scrollDirection | Axis | Scroll direction of the sheet |
