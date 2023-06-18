
import '../../models/typedefs/typedefs.dart';
import 'auth_reult_enum.dart';

class AuthState{

  final AuthResult? authResult;
  final bool isLoading;
  final UserId? userId;

  const AuthState({
    required this.authResult,
    required this.isLoading,
    required this.userId,
  });


  AuthState copyWithIsLoading({
    required bool isLoading
  }) => AuthState(
    authResult: authResult,
    isLoading : isLoading,
    userId : userId);


  const AuthState.unknown() : authResult = null, isLoading = false, userId = null;

  @override
  bool operator ==(covariant AuthState other) => identical(this, other) || 
    (authResult == other.authResult &&
    isLoading == other.isLoading &&
    userId == other.userId);


  @override
  int get hashCode => Object.hash(
    authResult, isLoading, userId
    );
}