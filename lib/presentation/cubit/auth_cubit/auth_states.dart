abstract class AuthenticationStates{}

class AuthenticationInitialState extends AuthenticationStates{}


class RegisterLoadingState extends AuthenticationStates{}
class RegisterSuccessState extends AuthenticationStates{}
class RegisterWeakPasswordState extends AuthenticationStates{}
class RegisterEmailUsedState extends AuthenticationStates{}
class RegisterErrorState extends AuthenticationStates{}

class CreateUserLoadingState extends AuthenticationStates{}
class CreateUserSuccessState extends AuthenticationStates{}
class CreateUserErrorState extends AuthenticationStates{}

class LoginLoadingState extends AuthenticationStates{}
class LoginSuccessState extends AuthenticationStates{}
class LoginUserNotFoundState extends AuthenticationStates{}
class LoginUserWrongPasswordState extends AuthenticationStates{}
class LoginErrorState extends AuthenticationStates{}



class GetProfileDataLoading extends AuthenticationStates{}
class GetProfileDataSuccess extends AuthenticationStates{}
class GetProfileDataError extends AuthenticationStates{}
