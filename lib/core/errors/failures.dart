abstract class Failure{
  String message;
  Failure(this.message);

}
class RemoteFailure extends Failure{
  RemoteFailure(super.message);

}
class LocalFailure extends Failure{
  LocalFailure(super.message);

}