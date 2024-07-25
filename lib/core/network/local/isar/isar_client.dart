import 'dart:io';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

mixin IsarClient {
  static late final Isar? isar;
  Isar? get isarInstance => isar;
  static Future<void> init() async {
    try {
      if (Isar.instanceNames.isNotEmpty) return;
      isar = await openIsar();
    } catch (error) {
      rethrow;
    }
  }

  static Future<Isar> openIsar() async {
    final appDir = await getApplicationDocumentsDirectory();
    final isarDir = Directory('${appDir.path}/isar');
    await isarDir.create(recursive: true);

    final isar = await Isar.open(
      [],
      directory: isarDir.path,
      inspector: true,
    );

    return isar;
  }

  static Future<bool?> dispose() async => await isar?.close();
}
