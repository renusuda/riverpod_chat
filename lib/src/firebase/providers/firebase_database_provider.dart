import 'package:firebase_database/firebase_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_database_provider.g.dart';

@Riverpod(keepAlive: true)
FirebaseDatabase firebaseDatabase(Ref ref) => FirebaseDatabase.instance;
