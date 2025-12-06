import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {

  static double _defaultLat = 8.85577417427599;
  static double _defaultLng = 38.81151398296511;

  CameraPosition _defaultLocation =
      CameraPosition(target: LatLng(_defaultLat, _defaultLng), zoom: 15 );

  final String mapLink =
  "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2588.57148441007!2d71.1293774!3d40.5742161!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x38bae3ab86eb6f81%3A0x7a3d2df3900b1de7!2zMTct06_RgNGC0LAg0LzQsNC60YLQsNCx!5e1!3m2!1sen!2s!4v1765039415728!5m2!1sen!2s";

  final String googleLink = '''
    https://maps.app.goo.gl/pgbkia6meF4dPiiL8
  ''';

  Future<void> openMap() async {
    final link = Uri.parse(googleLink);

    if(await canLaunchUrl(link)){
      await launchUrl(link);
    }
  }

  late final WebViewController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(mapLink));

    // Only required for Android (webview_flutter_android)
    if (_controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (_controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
  }

  MapType hozirMap = MapType.normal;

  void _changeMap(){
    setState(() {
      hozirMap = hozirMap == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact"),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(55),
              child: Image.asset(
                "assets/logo.png",
                height: 180,
              ),
            ),
          ),
          SizedBox(height: 20,),
          Text(
            "Apple Uzbekistan Do'koni",
            style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20
            ),
          ),

          SizedBox(height: 10,),

          Text('''
jsdhvdividshdisdsisdisf sdojcdoscdsocdosdosc 
jsdhvdividshdisdsisdisf sdojcdoscdsocdosdosc
jsdhvdividshdisdsisdisf sdojcdoscdsocdosdosc
              ''',
            style: TextStyle(fontSize: 15, height: 1.5),
          ),
          SizedBox(height: 15,),

          Divider(),

          SizedBox(height: 15,),

          _info(Icons.phone, "+998 91 056 27 12"),
          _info(Icons.email, "abutechedu@gmail.com"),
          _info(Icons.language, "abutechuz.vercel.app"),

          SizedBox(height: 25,),

          Text(
            "Bizning Manzil",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold
            ),
          ),

          SizedBox(height: 15,),

          // Container(
          //   height: 300,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(15),
          //     color: Colors.grey.shade200
          //   ),
          //   clipBehavior: Clip.hardEdge,
          //   child: WebViewWidget(
          //     controller: _controller
          //   ),
          // ),

          GoogleMap(
            mapType: hozirMap,
            initialCameraPosition: _defaultLocation
          ),
          Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            clipBehavior: Clip.hardEdge,
            child: GoogleMap(
              mapType: hozirMap,
              initialCameraPosition: _defaultLocation,
              myLocationEnabled: false,
              zoomControlsEnabled: false,
            ),
          ),

          SizedBox(height: 20,),
          
          ElevatedButton(
              onPressed: openMap,
              child: Text("Google Mapsdan ochish")
          ),

          SizedBox(height: 30,)

        ],
      ),
    );
  }

  Widget _info(IconData icon, String text){
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.deepPurple,
          ),
          SizedBox(width: 15,),
          Text(
            text,
            style: TextStyle(
              fontSize: 16
            ),
          )
        ],
      ),
    );
  }
}
