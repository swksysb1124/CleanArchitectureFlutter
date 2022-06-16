abstract class UseCase<I, O> {
  void execute(
      {I input,
      required Function(O) onSuccess,
      required Function(Exception) onError});
}
