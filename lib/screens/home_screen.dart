import 'package:flutter/material.dart';
import 'package:webview_wrapper/model/news_model.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home screen'),
      ),
      body: ListView(
        children: [
          for (var item in NEWS_LIST)
              ListTile(
                visualDensity: VisualDensity.comfortable,
                dense: true,
                title: Text(item.title),
                subtitle: Text(item.description),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.pushNamed(context, '/web', arguments: {
                    'url': item.url
                  });
                },
              ),
        ],
      )
    );
  }
}