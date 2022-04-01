import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class HomePAGE extends StatefulWidget {
  const HomePAGE({Key? key}) : super(key: key);

  @override
  State<HomePAGE> createState() => _HomePAGEState();
}

class _HomePAGEState extends State<HomePAGE> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Download Image in Gallery"),
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 200,
            child: Image.network(
              "https://tinypng.com/images/social/website.jpg",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () async {
                String url = "https://tinypng.com/images/social/website.jpg";
                final tempdire = await getTemporaryDirectory();
                final path = '${tempdire.path}/myfile.png';
                await Dio().download(url, path);

                await GallerySaver.saveImage(url);
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Download to Gallery")));
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Text(
                  "Download",
                  style: TextStyle(fontSize: 24),
                ),
              ))
        ],
      ),
    );
  }
}
