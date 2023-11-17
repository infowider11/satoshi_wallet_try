import 'dart:io' show Platform;
import 'dart:math';
import 'package:device_apps/device_apps.dart';
import 'package:device_apps/device_apps.dart' as dev;
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController walletController = TextEditingController();
  Uri url = Uri.parse('');

  Future<void> _openOtherAppOrPlayStore({appId,appPackage}) async {
    // String otherAppPackage='com.livingroomofsatoshi.wallet';
  final String androidUrl = "https://play.google.com/store/apps/details?id=$appPackage&hl=en&gl=US";
  final String appleUrl ="https://apps.apple.com/app/id$appId";
  try {
    ///checks if the app is installed on your mobile device
    // bool isInstalled = await DeviceApps.isAppInstalled(otherAppPackage);
    // String temp = 'walletofsatoshi://lnurl1dp68gurn8ghj7ampd3kx2ar0veekzar0wd5xjtnrdakj7tnhv4kxctttdehhwm30d3h82unvwqhhvctsd9j8qct5dqenwlytqu2';
    String temp = 'walletofsatoshi://lnbc1pj4dc8app5ta2z0pxecscc9pelg6j6vtnwgtpla8vtf3va37fym9m7m376ptmqdqqcqzzsxqyz5vqsp58tpzd8qw9j9ym2506wy3qhyugr976qslnrzja7fgwxxwsehldx2s9qyyssq28qv0pkhwqw5duhee7f2tu5nhm4uy2sv84zyrfpplqcemx92kkqyvsdyxz7w50l7ce0zanx9j3gmg97kkh4y90vvwas9q3khgmml85qp5kpqs2';
    bool isInstalled = await DeviceApps.isAppInstalled(temp);
    bool abc = await DeviceApps.isAppInstalled(temp);
    print('the abc is ${abc}');
    if (isInstalled) {

      print('opening app.... with $temp');
      DeviceApps.openApp(temp,);
      // var abc = DevToolsDeepLinkProperty('fsdf', appPackage);
      // abc.

      // DeviceApps.openApp(otherAppPackage,);
    } else {
      ///if the app is not installed it lunches google play store so you can install it from there
      final url = Uri.parse(
          Platform.isAndroid
              // ? "market://details?id=$otherAppPackage"
              ? temp
              : appleUrl
    );
      launchUrl(url,);
    }
  } catch (e) {
    log(e.hashCode);
  }
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:   Row(
          children: [
            Text('S.No.',style: TextStyle(
                color: Colors.black,fontSize: 16
            ),),
            SizedBox(width: 100,),
            Text('Name',style: TextStyle(
                color: Colors.black,fontSize: 16
            ),),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
        child: Column(
          children: [
            ListTile(
              onTap: ()async{
                _openOtherAppOrPlayStore(appPackage: 'com.livingroomofsatoshi.wallet');
                // await LaunchApp.openApp(
                //   androidPackageName: 'com.livingroomofsatoshi.wallet',
                //   appStoreLink: 'itms-apps://itunes.apple.com/us/app/pulse-secure/id1438599608',
                //   // openStore: false
                // );
              },
              leading: const Text('1',style: TextStyle(
                  color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),
              title:   const Text('Wallet of Satoshi'),
              // titleTextStyle: const TextStyle(
              //     color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500
              // ),

            ),
            SizedBox(height: 20,),
            ListTile(

              leading: const Text('1',style: TextStyle(
                  color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),
              title:    TextField(
                controller: walletController,
                decoration: InputDecoration(
                  hintText: 'Or Enter Wallet Address'
                ),

              ),
            ),
            SizedBox(height: 20,),
            Text('THe url is : $url'),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              url = Uri.parse(
                  'walletofsatoshi://${walletController.text}'
              );
              setState(() {

              });

              launchUrl(url,);
            }, child: Text('Submit')),
            // ListTile(
            //   onTap: ()async{
            //     // _openOtherAppOrPlayStore(appId: 'id510855668',appPackage: 'com.amazon.mp3');
            //     await LaunchApp.openApp(
            //
            //       androidPackageName: 'de.android.riverapp',
            //       appStoreLink: 'itms-apps://itunes.apple.com/us/app/pulse-secure/id667012473',
            //       // openStore: false
            //     );
            //   },
            //   leading: const Text('1',style: TextStyle(
            //       color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),
            //   title:   const Text('River'),
            //   titleTextStyle: const TextStyle(
            //       color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500
            //   ),
            //
            // ),
            // ListTile(
            //   onTap: ()async{
            //     await LaunchApp.openApp(
            //       androidPackageName: 'com.breezechms.app',
            //       appStoreLink: 'itms-apps://itunes.apple.com/us/app/pulse-secure/id1450365119',
            //       // openStore: false
            //     );
            //   },
            //   leading: const Text('2',style: TextStyle(
            //       color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),
            //   title:   const Text('Breez'),
            //   titleTextStyle: const TextStyle(
            //       color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500
            //   ),
            //
            // ),
            // ListTile(
            //   onTap: ()async{
            //
            //     await LaunchApp.openApp(
            //       androidPackageName: 'com.transsion.phoenix',
            //       appStoreLink: 'itms-apps://itunes.apple.com/us/app/pulse-secure/id1495750173',
            //       // openStore: false
            //     );
            //   },
            //   leading: const Text('3',style: TextStyle(
            //       color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),
            //   title:   const Text('Phoenix'),
            //   titleTextStyle: const TextStyle(
            //       color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500
            //   ),
            //
            // ),
            // ListTile(
            //   onTap: ()async{
            //     await LaunchApp.openApp(
            //       androidPackageName: 'app.zeusln.zeus',
            //       appStoreLink: 'itms-apps://itunes.apple.com/us/app/pulse-secure/id1456038895',
            //       // openStore: false
            //     );
            //   },
            //   leading: const Text('4',style: TextStyle(
            //       color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),
            //   title:   const Text('Zeus LN'),
            //   titleTextStyle: const TextStyle(
            //       color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500
            //   ),
            //
            // ),
            // ListTile(
            //   onTap: ()async{
            //     await LaunchApp.openApp(
            //       androidPackageName: 'io.zebedee.wallet',
            //       appStoreLink: 'itms-apps://itunes.apple.com/us/app/pulse-secure/id1484394400',
            //       // openStore: false
            //     );
            //   },
            //   leading: const Text('5',style: TextStyle(
            //       color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),
            //   title:   const Text('Zebedee'),
            //   titleTextStyle: const TextStyle(
            //       color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500
            //   ),
            //
            // ),
            // ListTile(
            //   onTap: ()async{
            //     await LaunchApp.openApp(
            //       androidPackageName: 'io.muun.apollo',
            //       appStoreLink: 'itms-apps://itunes.apple.com/us/app/pulse-secure/id1482037683',
            //       // openStore: false
            //     );
            //   },
            //   leading: const Text('6',style: TextStyle(
            //       color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),
            //   title:   const Text('Muun'),
            //   titleTextStyle: const TextStyle(
            //       color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500
            //   ),
            //
            // ),
            // ListTile(
            //   onTap: ()async{
            //     await LaunchApp.openApp(
            //       androidPackageName: 'io.bluewallet.bluewallet',
            //       appStoreLink: 'itms-apps://itunes.apple.com/us/app/pulse-secure/id1376878040',
            //       // openStore: false
            //     );
            //   },
            //   leading: const Text('7',style: TextStyle(
            //       color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),
            //   title:   const Text('BlueWallet'),
            //   titleTextStyle: const TextStyle(
            //       color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500
            //   ),
            //
            // ),

            // ListTile(
            //   onTap: ()async{
            //     await LaunchApp.openApp(
            //       androidPackageName: 'com.livingroomofsatoshi.wallet',
            //       appStoreLink: 'itms-apps://itunes.apple.com/us/app/pulse-secure/id143j8599608',
            //       openStore: false
            //     );
            //   },
            //   leading: const Text('9',style: TextStyle(
            //       color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),
            //   title:   const Text('Local Default'),
            //   titleTextStyle: const TextStyle(
            //       color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500
            //   ),
            //
            // ),



          ],
        ),
      ),
    );
  }
}

