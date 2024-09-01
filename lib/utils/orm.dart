import 'package:flutter/foundation.dart';
import 'package:flutter_neon_template/utils/neon_connection.dart';

class SimpleOrm<T> {
  final PostgresManager connection;
  final String tableName;
  final T Function(Map<String, dynamic>) fromMap;

  SimpleOrm(this.connection, this.tableName, this.fromMap);

  Future<void> createTableIfNotExists(
      String tableName, Map<String, String> fieldMappings) async {
    final fieldDefinitions = fieldMappings.entries
        .map((entry) => '${entry.key} ${entry.value}')
        .join(', ');

    final createTableQuery = '''
    CREATE TABLE IF NOT EXISTS $tableName (
      $fieldDefinitions
    );
    ''';

    try {
      debugPrint('Creating table: $createTableQuery');
      await connection.execute(createTableQuery);
      debugPrint('Table created successfully.');
    } catch (e) {
      debugPrint('Failed to create table: $e');
      rethrow;
    }
  }

  /// Fetch all records from the specified table.
  Future<List<T>> fetchAll() async {
    try {
      final result = await connection.execute('SELECT * FROM $tableName');
      return result.map((row) => fromMap(row)).toList();
    } catch (e) {
      debugPrint('Failed to fetch all records: $e');
      rethrow;
    }
  }

  /// Fetch a specific record by ID from the table.
  Future<T?> findById(int id) async {
    try {
      final result = await connection.execute(
        'SELECT * FROM $tableName WHERE id = @id',
        parameters: {'id': id},
      );
      if (result.isNotEmpty) {
        return fromMap(result.first);
      }
      return null;
    } catch (e) {
      debugPrint('Failed to fetch record by ID: $e');
      rethrow;
    }
  }

  /// Insert a new record into the table.
  Future<void> insert(Map<String, dynamic> data) async {
    final columns = data.keys.join(', ');
    final values = data.keys.map((key) => '@$key').join(', ');

    try {
      await connection.execute(
        'INSERT INTO $tableName ($columns) VALUES ($values)',
        parameters: data,
      );
      debugPrint('Record inserted successfully.');
    } catch (e) {
      debugPrint('Failed to insert record: $e');
      rethrow;
    }
  }

  /// Update a specific record by ID in the table.
  Future<void> update(int id, Map<String, dynamic> data) async {
    final updates = data.keys.map((key) => '$key = @$key').join(', ');

    try {
      await connection.execute(
        'UPDATE $tableName SET $updates WHERE id = @id',
        parameters: {'id': id, ...data},
      );
      debugPrint('Record updated successfully.');
    } catch (e) {
      debugPrint('Failed to update record: $e');
      rethrow;
    }
  }

  /// Delete a specific record by ID from the table.
  Future<void> delete(int id) async {
    try {
      await connection.execute(
        'DELETE FROM $tableName WHERE id = @id',
        parameters: {'id': id},
      );
      debugPrint('Record deleted successfully.');
    } catch (e) {
      debugPrint('Failed to delete record: $e');
      rethrow;
    }
  }
}
