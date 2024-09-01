import 'package:flutter_neon_template/models/user_model.dart';
import 'package:flutter_neon_template/utils/neon_connection.dart';
import 'package:flutter_neon_template/utils/orm.dart';

class UserRepository {
  final SimpleOrm<User> orm;

  final Map<String, String> userFieldMappings = {
    'id': 'SERIAL PRIMARY KEY',
    'name': 'VARCHAR(255) NOT NULL',
    'email': 'VARCHAR(255) UNIQUE NOT NULL',
    'dob': 'DATE NOT NULL',
    'password': 'VARCHAR(255) NULL',
  };

  UserRepository(PostgresManager connection)
      : orm = SimpleOrm<User>(
          connection,
          'users', // Assuming your table name is 'users'
          (map) => User.fromMap(map),
        );

  Future<User?> findUserById(int id) => orm.findById(id);

  Future<void> insertUser(User user) => orm.insert(user.toMap());

  Future<void> updateUser(int id, User user) => orm.update(id, user.toMap());

  Future<void> deleteUser(int id) => orm.delete(id);

  Future<void> createTable() async {
    await orm.createTableIfNotExists('users', userFieldMappings);
  }
}
