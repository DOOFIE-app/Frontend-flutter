// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebase_performance/firebase_performance.dart';
// import 'package:firebase_remote_config/firebase_remote_config.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiClient {
  // static FirebaseAnalytics analytics;
  // static FirebaseMessaging firebaseMessaging;
  static FirebaseAuth auth = FirebaseAuth.instance;
  // static FirebaseFirestore fireStore;
  // static RemoteConfig remoteConfig;
  // static FlutterSecureStorage localStorage;
  // static FirebasePerformance performance;

  // static Future<void> init() async {
  //   localStorage = FlutterSecureStorage();
  //   analytics = FirebaseAnalytics();
  //   firebaseMessaging = FirebaseMessaging.instance;
  //   auth = FirebaseAuth.instance;
  //   fireStore = FirebaseFirestore.instance;
  //   remoteConfig = await RemoteConfig.instance;
  //   performance = FirebasePerformance.instance;
  //   await performance.setPerformanceCollectionEnabled(true);
  // }
  //
  // static Future<void> initRemoteConfig(
  //     String key, Map<String, dynamic> defaults) async {
  //   try {
  //     await remoteConfig.setDefaults({key: defaults});
  //     await remoteConfig.fetch(expiration: const Duration());
  //     await remoteConfig.activateFetched();
  //   } on FetchThrottledException catch (exception) {
  //     print(exception);
  //   } catch (exception) {
  //     debugPrint(exception);
  //     print(
  //         'Unable to fetch remote config. Cached or default values will be used');
  //   }
  // }

  //Sign out
  Future<void> signOut() async {
    return FirebaseAuth.instance.signOut();
  }

  //SignIn
  Future<UserCredential> signIn(AuthCredential credential) {
    return FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<String> getToken() {
    return auth.currentUser.getIdToken();
  }
}

final ApiClient apiClient = ApiClient();
