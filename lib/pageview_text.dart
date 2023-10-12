import 'package:flutter/material.dart';
import 'package:page_view_text_guru/appdata_text.dart';
import 'package:page_view_text_guru/display_text.dart';
import 'package:share_plus/share_plus.dart';

class PageViewText extends StatefulWidget {
  const PageViewText({super.key});

  @override
  State<PageViewText> createState() => _PageViewTextState();
}

class _PageViewTextState extends State<PageViewText> {
  var selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Warren Buffet'),
        backgroundColor: Colors.orangeAccent,
        actions: [
          PopupMenuButton<int>(
              itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 1,
                      child: Text('Share'),
                    )
                  ],
              onSelected: (value) {
                if (value == 1) {
                  _shareInfo();
                }
              }),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Container(
                height: 200,
                child: PageView.builder(
                    onPageChanged: (index) {
                      setState(() {
                        selectedindex = index;
                      });
                    },
                    itemCount: appDataText.length,
                    itemBuilder: (context, index) {
                      return DisplayText(appDataText: appDataText[index]);
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: new Text(
                      (selectedindex + 1).toString() +
                          '/' +
                          appDataText.length.toString(),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _shareInfo() {
    print('---------->share');

    Share.share(appDataText[selectedindex].text);
    print(appDataText[selectedindex].text);
  }
}
