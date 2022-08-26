import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  final List<IconData> icons = const [
    Icons.message,
    Icons.call,
    Icons.mail,
    Icons.notifications,
    Icons.settings,
  ];

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return Scaffold(
          body: DraggableBottomSheet(
            minExtent: 150,
            useSafeArea: false,
            curve: Curves.easeIn,
            previewWidget: _previewWidget(),
            expandedWidget: _expandedWidget(),
            backgroundWidget: _backgroundWidget(),
            maxExtent: MediaQuery.of(context).size.height * 0.8,
            onDragging: (pos) {},
          ),
        );
      }),
    );
  }

  Widget _backgroundWidget() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Draggable Bottom Sheet Example'),
        backgroundColor: Colors.deepOrange,
      ),
      body: SizedBox(
        height: 400,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(vertical: 32),
          itemCount: icons.length,
          itemBuilder: (context, index) => Container(
            height: 200,
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icons[index], color: Colors.white, size: 60),
          ),
          separatorBuilder: (context, index) => const SizedBox(width: 10),
        ),
      ),
    );
  }

  Widget _previewWidget() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: 40,
            height: 6,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Drag Me',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: icons.map((icon) {
                return Container(
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: Colors.pink, size: 40),
                );
              }).toList())
        ],
      ),
    );
  }

  Widget _expandedWidget() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: <Widget>[
          const Icon(Icons.keyboard_arrow_down, size: 30, color: Colors.white),
          const SizedBox(height: 8),
          const Text(
            'Hey...I\'m expanding!!!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              itemCount: icons.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icons[index], color: Colors.pink, size: 40),
              ),
            ),
          )
        ],
      ),
    );
  }
}
