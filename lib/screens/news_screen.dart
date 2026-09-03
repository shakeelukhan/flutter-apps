import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:webview_flutter/webview_flutter.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  Map<String, dynamic>? data;
  var newsSelection = "ary-news";

  Future<String> getData() async {
    var response = await http.get(
        Uri.parse(Uri.encodeFull(
            'https://newsapi.org/v2/top-headlines?sources=' + newsSelection)),
        headers: {
          "Accept": "application/json",
          // No live NewsAPI.org key is configured for this archived app
          // (the original key was redacted -- see repo security history).
          // This request will 401; the empty/error response is handled
          // below rather than crashing.
          "X-Api-Key": "REDACTED_NEWSAPI_KEY"
        });
    var localData = json.decode(response.body);
    if (localData is Map<String, dynamic> && localData["articles"] != null) {
      localData["articles"].sort((a, b) {
        // Was `: null` in the missing-timestamp branch -- a comparator
        // must always return an int; a null return would throw the
        // first time this code path was actually exercised.
        if (a["publishedAt"] == null || b["publishedAt"] == null) return 0;
        return DateTime.parse(b["publishedAt"])
            .compareTo(DateTime.parse(a["publishedAt"]));
      });
    }
    if (mounted) {
      setState(() {
        data = localData is Map<String, dynamic> ? localData : null;
      });
    }
    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  void _openArticle(String url) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(),
        body: WebViewWidget(
          controller: WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..loadRequest(Uri.parse(url)),
        ),
      ),
    ));
  }

  Column buildButtonColumn(IconData icon) {
    Color color = Theme.of(context).primaryColor;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(icon, color: color),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final articles = data?["articles"] as List?;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(children: <Widget>[
        Expanded(
          // `data == null` means the fetch hasn't completed yet (show the
          // spinner). Once it has, a response with no "articles" key --
          // e.g. a 401 error body, which is what this always gets without
          // a real NewsAPI key -- must fall through to the empty state,
          // not spin forever. (Was `articles == null` here, which doesn't
          // distinguish "still loading" from "loaded, but no articles".)
          child: data == null
              ? const Center(child: CircularProgressIndicator())
              : articles != null && articles.isNotEmpty
                  ? ListView.builder(
                      itemCount: articles.length,
                      padding: const EdgeInsets.all(8.0),
                      itemBuilder: (BuildContext context, int index) {
                        final article = articles[index];
                        return Card(
                          elevation: 1.7,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(left: 4.0),
                                      child: Text(
                                        timeago.format(DateTime.parse(
                                            article["publishedAt"])),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        article["source"]["name"],
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          _openArticle(article["url"]);
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4.0,
                                                  right: 8.0,
                                                  bottom: 8.0,
                                                  top: 8.0),
                                              child: Text(
                                                article["title"],
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4.0,
                                                  right: 4.0,
                                                  bottom: 4.0),
                                              child: Text(
                                                article["description"] ?? '',
                                                style: TextStyle(
                                                  color: Colors.grey[500],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: SizedBox(
                                            height: 100.0,
                                            width: 100.0,
                                            child: article["urlToImage"] != null
                                                ? Image.network(
                                                    article["urlToImage"],
                                                    fit: BoxFit.cover,
                                                  )
                                                : null,
                                          ),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            GestureDetector(
                                              onTap: () {
                                                Share.share(article["url"]);
                                              },
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                          vertical: 10.0,
                                                          horizontal: 5.0),
                                                  child: buildButtonColumn(
                                                      Icons.share)),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.chrome_reader_mode,
                              color: Colors.grey, size: 60.0),
                          Text(
                            "No articles saved",
                            style: TextStyle(
                                fontSize: 24.0, color: Colors.grey[500]),
                          ),
                        ],
                      ),
                    ),
        )
      ]),
    );
  }
}
