import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewWrapper extends StatefulWidget {

  @override
  _WebViewWrapperState createState() => _WebViewWrapperState();
}

class _WebViewWrapperState extends State<WebViewWrapper> {
  bool loading;
  WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    this.setState(() {
      loading = false;
    });
    if(Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;

    return SafeArea(child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0))
      ),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 50.0),
            child: WebView(
              initialUrl: args['url'],
              debuggingEnabled: true,
              onWebViewCreated: (webController) {
                this._webViewController = webController;
              },
              onPageStarted: (event) {
                this.setState(() {
                  loading = true;
                });
              },
              onPageFinished: (event) {
                this.setState(() {
                  loading = false;
                });
              },
            ),
          ),
          if(!this.loading) 
            Positioned(
              height: 50.0,
              bottom: 0,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 10.0),
                  Material(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.white,
                      iconSize: 30.0,
                      tooltip: 'Go back',
                      onPressed: () async {
                        if(await this._webViewController.canGoBack()){
                          this._webViewController.goBack();
                        }
                        return;
                      },
                    )
                  ),
                  SizedBox(width: 10.0,),
                  Material(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_forward),
                      color: Colors.white,
                      iconSize: 30.0,
                      tooltip: 'Go forward',
                      onPressed: ()async {
                        if(await this._webViewController.canGoForward()) {
                          this._webViewController.goForward();
                        }
                        return;
                      },
                    )
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width/1.8),
                  Material(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    child: IconButton(
                      icon: const Icon(Icons.share, color: Colors.white),
                      onPressed: (){
                        // Todo: share of do something else here
                      },

                    )

                  )
                ],
              ),
            ),
          
          if(this.loading) 
            Positioned(
              top: MediaQuery.of(context).size.height/ 2.25,
              left: MediaQuery.of(context).size.width / 2.25,
              child: Material(
                child: CircularProgressIndicator(
                  strokeWidth: 2.0,
                  backgroundColor: Colors.red,
                ),
              ),
            ),

          if(!this.loading)
            Positioned(
              top: 0,
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              child: Material(
                color: Colors.transparent,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 10.0),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: IconButton(
                        color: Colors.white,
                        iconSize: 30.0,
                        icon: Icon(Icons.close),
                        tooltip: 'Close',
                        onPressed: () => Navigator.pop(context),
                      )
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width/1.4),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                      ),
                      child: IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.refresh),
                        iconSize: 30.0,
                        tooltip: 'refresh',
                        onPressed: () async => this._webViewController.reload(),
                      )
                    )
                  ],
                )
              ),
            ),
        ],
      ),
    ),);
  }
}