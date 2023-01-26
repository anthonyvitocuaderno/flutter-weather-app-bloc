import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User(this.name, this.url);

  final String name;
  final String url;

  @override
  List<Object> get props => [name, url];

  static const empty = User('-', '-');
}
