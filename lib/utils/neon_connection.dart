import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:postgres/postgres.dart';

/// A generic class to manage PostgreSQL connections in a Flutter application.
///
/// This class is designed to be reusable and flexible, providing a robust
/// foundation for handling database connections, queries, and transactions.
class PostgresManager {
  /// The hostname or IP address of the PostgreSQL server.
  final String host;

  /// The port number on which the PostgreSQL server is listening.
  final int port;

  /// The name of the PostgreSQL database to connect to.
  final String databaseName;

  /// The username used for authentication.
  final String username;

  /// The password used for authentication.
  final String password;

  /// The SSL mode to use when connecting to the PostgreSQL server.
  final SslMode sslMode;

  /// The PostgreSQL connection object.
  Connection? _connection;

  /// Creates an instance of [PostgresManager].
  ///
  /// The [host], [port], [databaseName], [username], [sslMode] and [password] parameters
  /// are required to establish a connection to the PostgreSQL server.
  PostgresManager({
    String? host,
    int? port,
    String? databaseName,
    String? username,
    String? password,
    SslMode? sslMode,
  })  : host = host ?? dotenv.env['NEON_HOST'] ?? 'localhost',
        port = port ?? int.tryParse(dotenv.env['NEON_PORT'] ?? '5432') ?? 5432,
        databaseName = databaseName ?? dotenv.env['NEON_DATABASE'] ?? '',
        username = username ?? dotenv.env['NEON_USERNAME'] ?? 'postgres',
        password = password ?? dotenv.env['NEON_PASSWORD'] ?? 'postgres',
        sslMode = sslMode ??
            (dotenv.env['SSL_ENABLED']?.toLowerCase() == 'false'
                ? SslMode.disable
                : SslMode.require);

  /// Establishes a connection to the PostgreSQL server.
  ///
  /// Throws a [PostgreSQLException] if the connection fails.
  Future<void> connect() async {
    try {
      _connection = await Connection.open(
        Endpoint(
          host: host,
          port: port,
          database: databaseName,
          username: username,
          password: password,
        ),
        settings: ConnectionSettings(sslMode: sslMode),
      );
      debugPrint(
          'Connected to PostgreSQL database $databaseName at $host:$port');
    } catch (e) {
      debugPrint('Failed to connect to PostgreSQL database: $e');
      rethrow;
    }
  }

  /// Closes the connection to the PostgreSQL server.
  ///
  /// This method should be called when the database connection is no longer
  /// needed to free up resources.
  Future<void> close() async {
    try {
      if (_connection != null) {
        await _connection!.close();
        debugPrint('Connection to PostgreSQL database closed.');
      }
    } catch (e) {
      debugPrint('Failed to close the PostgreSQL connection: $e');
      rethrow;
    }
  }

  /// Executes a query on the PostgreSQL database.
  ///
  /// The [query] parameter is the SQL query to be executed.
  /// The [parameters] parameter is a map of values for parameterized queries.
  ///
  /// Returns the result of the query as a list of maps, where each map
  /// represents a row with column names as keys.
  Future<List<Map<String, dynamic>>> execute(String query,
      {Map<String, dynamic>? parameters}) async {
    try {
      if (_connection!.isOpen == false) {
        debugPrint('Reconnecting to the PostgreSQL database...');
        await close();
        await connect();
      }
      final result = parameters == null
          ? await _connection!.execute(query)
          : await _connection!.execute(
              Sql.named(query),
              parameters: parameters,
            );
      return result.map((row) => row.toColumnMap()).toList();
    } catch (e) {
      debugPrint('Failed to execute query: $e');
      rethrow;
    }
  }

  /// Runs a transaction on the PostgreSQL database.
  ///
  /// The [transaction] parameter is a callback that contains the operations to be executed within the transaction.
  ///
  /// If any operation within the transaction fails, the entire transaction is rolled back.
  Future<void> runTransaction(
      Future<dynamic> Function(TxSession) transaction) async {
    try {
      await _connection!.runTx(transaction);
      debugPrint('Transaction completed successfully.');
    } catch (e) {
      debugPrint('Transaction failed: $e');
      rethrow;
    }
  }

  /// Fetch Postgres Connection
  ///
  /// Returns the Postgres Connection object
  ///
  /// Throws a [PostgreSQLException] if the connection is not established.
  Connection? getConnection() {
    if (_connection == null) {
      throw Error();
    }
    return _connection;
  }
}
