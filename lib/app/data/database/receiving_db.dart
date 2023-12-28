import 'package:flutter/services.dart';
import 'package:maklifeecommerce/app/data/database/database_service.dart';
import 'package:maklifeecommerce/app/data/models/product_model.dart';
import 'package:sqflite/sqflite.dart';

class ReceivingDB {
  //
  final tableName = 'vendor';

  Future<void> createTable(Database database) async {
    await database.execute("""
  CREATE TABLE IF NOT EXISTS $tableName (
    "id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "weight" TEXT NOT NULL,
    "price" INTEGER NOT NULL,
    "quantity" INTEGER,
    "description" TEXT,
    "picture" BLOB,
    PRIMARY KEY("id" AUTOINCREMENT)
  );
""");
  }

  Future<int> create({
    required String name,
    required String weight,
    required String price,
    String? quantity,
    String? description,
    Uint8List? picture,
  }) async {
    final database = await DataBaseService().database;
    return await database.rawInsert(
      '''
        INSERT INTO $tableName (name,weight,price,quantity,description, picture) VALUES (?,?,?,?,?,?)
      ''',
      [name, weight, price, quantity ?? null, description, picture],
    );
  }

  Future<List<ProductModel>> fetchAll() async {
    final database = await DataBaseService().database;
    print("object");
    final products = await database.rawQuery('''
        SELECT * from $tableName 
      ''');

    return products.map((e) => ProductModel.fromMap(e)).toList();
  }

  Future<ProductModel> fetchById(int id) async {
    final database = await DataBaseService().database;
    final product = await database.rawQuery('''
        SELECT * from $tableName WHERE id = ? 
      
      ''', [id]);
    return ProductModel.fromMap(product.first);
  }

  Future<int> update({
    required int id,
    String? name,
    String? weight,
    int? price,
    int? quantity,
    String? description,
    Uint8List? picture,
  }) async {
    final database = await DataBaseService().database;
    return await database.update(
      tableName,
      {
        if (name != null) 'name': name,
        if (weight != null) 'weight': weight,
        if (price != null) 'price': price,
        if (quantity != null) 'quantity': quantity,
        if (description != null) 'description': description,
        if (picture != null) 'picture': picture,
      },
      where: 'id = ?',
      conflictAlgorithm: ConflictAlgorithm.rollback,
      whereArgs: [id],
    );
  }

  Future<void> delete(int id) async {
    final database = await DataBaseService().database;

    await database.rawDelete('''
  DELETE FROM $tableName WHERE id = ?
''', [id]);
  }
}
