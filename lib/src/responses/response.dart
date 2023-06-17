part of 'responses.dart';

class Response<T> {
  final int requestCode;

  bool? _available;
  bool? _cancel;
  bool? _complete;
  bool? _failed;
  bool? _internetError;
  bool? _loading;
  bool? _nullable;
  bool? _paused;
  bool? _stopped;
  bool? _successful;
  bool? _timeout;
  bool? _valid;

  T? _data;
  List<T>? _result;
  double? _progress;
  Status? _status;
  String? _exception;
  String? _message;
  dynamic feedback;
  dynamic snapshot;

  Response({
    this.requestCode = 0,
    bool? available,
    bool? cancel,
    bool? complete,
    bool? failed,
    bool? internetError,
    bool? loading,
    bool? nullable,
    bool? paused,
    bool? stopped,
    bool? successful,
    bool? timeout,
    bool? valid,
    T? data,
    List<T>? result,
    double? progress,
    Status? status,
    String? exception,
    String? message,
    this.feedback,
    this.snapshot,
  })  : _available = available,
        _cancel = cancel,
        _complete = complete,
        _failed = failed,
        _internetError = internetError,
        _loading = loading,
        _nullable = nullable,
        _paused = paused,
        _stopped = stopped,
        _successful = successful,
        _timeout = timeout,
        _valid = valid,
        _data = data,
        _result = result,
        _progress = progress,
        _status = status,
        _exception = exception,
        _message = message;

  Response<T> from(Response<T> response) {
    return copy(
      available: response._available,
      cancel: response._cancel,
      complete: response._complete,
      data: response._data,
      exception: response._exception,
      failed: response._failed,
      feedback: response.feedback,
      internetError: response._internetError,
      loading: response._loading,
      message: response._message,
      nullable: response._nullable,
      paused: response._paused,
      progress: response._progress,
      requestCode: response.requestCode,
      result: response._result,
      snapshot: response.snapshot,
      status: response._status,
      stopped: response._stopped,
      successful: response._successful,
      timeout: response._timeout,
      valid: response._valid,
    );
  }

  Response<T> copy({
    int? requestCode,
    bool? available,
    bool? cancel,
    bool? complete,
    bool? failed,
    bool? internetError,
    bool? loading,
    bool? nullable,
    bool? paused,
    bool? stopped,
    bool? successful,
    bool? timeout,
    bool? valid,
    T? data,
    List<T>? result,
    double? progress,
    Status? status,
    String? exception,
    String? message,
    dynamic feedback,
    dynamic snapshot,
  }) {
    return Response<T>(
      available: available,
      cancel: cancel,
      complete: complete,
      data: data ?? _data,
      exception: exception,
      failed: failed,
      feedback: feedback ?? this.feedback,
      internetError: internetError,
      loading: loading ?? false,
      message: message,
      nullable: nullable,
      paused: paused,
      progress: progress ?? _progress,
      requestCode: requestCode ?? this.requestCode,
      result: result ?? _result,
      snapshot: snapshot ?? this.snapshot,
      status: status,
      stopped: stopped,
      successful: successful,
      timeout: timeout,
      valid: valid,
    );
  }

  Response<T> modify({
    bool? available,
    bool? cancel,
    bool? complete,
    bool? failed,
    bool? internetError,
    bool? loading,
    bool? nullable,
    bool? paused,
    bool? stopped,
    bool? successful,
    bool? timeout,
    bool? valid,
    T? data,
    List<T>? result,
    double? progress,
    Status? status,
    String? exception,
    String? message,
    dynamic feedback,
    dynamic snapshot,
  }) {
    successful = successful ?? ((data != null || result != null) ? true : null);
    _available = available ?? _available;
    _cancel = cancel ?? _cancel;
    _complete = complete ?? _complete;
    _failed = failed ?? _failed;
    _internetError = internetError ?? _internetError;
    _loading = loading ?? _loading;
    _nullable = nullable ?? _nullable;
    _paused = paused ?? _paused;
    _stopped = stopped ?? _stopped;
    _successful = successful ?? _successful;
    _timeout = timeout ?? _timeout;
    _valid = valid ?? _valid;

    _data = data ?? _data;
    _result = result ?? _result;
    _progress = progress ?? _progress;
    _status = status ?? _status;
    _exception = exception ?? _exception;
    _message = message ?? _message;
    feedback = feedback ?? this.feedback;
    snapshot = snapshot ?? this.snapshot;

    return this;
  }

  Response<T> clear({
    bool? available,
    bool? cancel,
    bool? complete,
    bool? failed,
    bool? internetError,
    bool? loading,
    bool? nullable,
    bool? paused,
    bool? stopped,
    bool? successful,
    bool? timeout,
    bool? valid,
    T? data,
    List<T>? result,
    double? progress,
    Status? status,
    String? exception,
    String? message,
    dynamic feedback,
    dynamic snapshot,
  }) {
    successful = successful ?? ((data != null || result != null) ? true : null);
    _available = available;
    _cancel = cancel;
    _complete = complete;
    _failed = failed;
    _internetError = internetError;
    _loading = loading;
    _nullable = nullable;
    _paused = paused;
    _stopped = stopped;
    _successful = successful;
    _timeout = timeout;
    _valid = valid;

    _data = data;
    _result = result;
    _progress = progress;
    _status = status;
    _exception = exception;
    _message = message;
    feedback = feedback;
    snapshot = snapshot;

    return this;
  }

  Response<T> withStatus(Status status, {String? message}) {
    _status = status;
    _successful = status.isSuccessful;
    _loading = false;
    _message = message;
    return this;
  }

  Response<T> withFeedback(
    dynamic feedback, {
    String? message,
    String? exception,
    Status status = Status.ok,
    bool loaded = true,
  }) {
    this.feedback = feedback;
    _status = status;
    _successful = status.isSuccessful;
    _message = message;
    _exception = exception;
    _complete = loaded;
    _loading = false;
    return this;
  }

  Response<T> withData(T? data, {String? message}) {
    _status = Status.ok;
    _data = data;
    _message = message;
    _successful = true;
    _complete = true;
    _loading = false;
    return this;
  }

  Response<T> withResult(List<T>? result, {String? message}) {
    _status = Status.ok;
    _result = result;
    _message = message;
    _successful = true;
    _complete = true;
    _loading = false;
    return this;
  }

  Response<T> withMessage(String? message, {Status status = Status.ok}) {
    _status = status;
    _message = message;
    _successful = true;
    _loading = false;
    return this;
  }

  Response<T> withSnapshot(dynamic snapshot, {String? message}) {
    this.snapshot = snapshot;
    _message = message;
    _complete = true;
    _loading = false;
    return this;
  }

  Response<T> withException(dynamic exception, {Status? status}) {
    _status = status;
    _exception = exception;
    _successful = false;
    _message = null;
    _loading = false;
    return this;
  }

  Response<T> withSuccessful(bool successful, {String? message}) {
    _status = Status.ok;
    _successful = successful;
    _message = message;
    _complete = true;
    _loading = false;
    return this;
  }

  Response<T> withProgress(double progress, {String? message}) {
    _status = Status.running;
    _progress = progress;
    _message = message;
    return this;
  }

  Response<T> withAvailable(bool available, {String? message}) {
    _available = available;
    _loading = false;
    _message = message;
    return this;
  }

  Response<T> withComplete(bool complete, {String? message}) {
    _complete = complete;
    _loading = false;
    _message = message;
    return this;
  }

  Response<T> withCancel(bool cancel, {String? message}) {
    _cancel = cancel;
    _loading = false;
    _message = message;
    return this;
  }

  Response<T> withValid(bool valid) {
    _valid = valid;
    _loading = false;
    return this;
  }

  Response<T> withLoaded(bool loaded) {
    _loading = !loaded;
    return this;
  }

  Response<T> withInternetError(String message) {
    withException(message, status: Status.networkError);
    _internetError = true;
    return this;
  }

  Response<T> withPaused(bool paused) {
    _paused = paused;
    _loading = false;
    return this;
  }

  Response<T> withNullable(bool nullable) {
    _nullable = nullable;
    _loading = false;
    return this;
  }

  Response<T> withStopped(bool stopped) {
    _stopped = stopped;
    _loading = false;
    return this;
  }

  Response<T> withFailed(bool failed) {
    _failed = failed;
    _loading = false;
    return this;
  }

  Response<T> withTimeout(bool timeout) {
    _timeout = timeout;
    _loading = false;
    return this;
  }

  Snapshot? getSnapshot<Snapshot>() => snapshot is Snapshot ? snapshot : null;

  bool get isAvailable => _available ?? false;

  set isAvailable(bool value) => _available = value;

  bool get isCancel => _cancel ?? false;

  set isCancel(bool value) => _cancel = value;

  bool get isComplete => _complete ?? false;

  set isComplete(bool value) => _complete = value;

  bool get isFailed => _failed ?? false;

  set isFailed(bool value) => _failed = value;

  bool get isInternetError => _internetError ?? false;

  set isInternetError(bool value) => _internetError = value;

  bool get isLoaded => !(_loading ?? false);

  set isLoaded(bool value) => _loading = !value;

  bool get isLoading => _loading ?? false;

  set isLoading(bool value) => _loading = value;

  bool get isNullable => _nullable ?? false;

  set isNullable(bool value) => _nullable = value;

  bool get isPaused => _paused ?? false;

  set isPaused(bool value) => _paused = value;

  bool get isStopped => _stopped ?? false;

  set isStopped(bool value) => _stopped = value;

  bool get isSuccessful => _successful ?? false;

  set isSuccessful(bool value) => _successful = value;

  bool get isTimeout => _timeout ?? false;

  set isTimeout(bool value) => _timeout = value;

  bool get isValid => _valid ?? false;

  set isValid(bool value) => _valid = value;

  T? get data => _data is T ? _data : null;

  set data(T? value) => _data = value;

  List<T> get result => _result ?? [];

  set result(List<T> value) => _result = value;

  double get progress => _progress ?? 0;

  set progress(double value) => _progress = value;

  Status get status => _status ?? Status.none;

  set status(Status value) => _status = value;

  String get exception => _exception ?? "";

  set exception(String value) => _exception = value;

  String get message => _message ?? "";

  set message(String value) => _message = value;

  Map<String, dynamic> get source => {
        "Request Code": requestCode,
        "Available": _available,
        "Cancel": _cancel,
        "Complete": _complete,
        "Failed": _failed,
        "Internet Error": _internetError,
        "Loading": _loading,
        "Nullable": _nullable,
        "Paused": _paused,
        "Stopped": _stopped,
        "Successful": _successful,
        "Timeout": _timeout,
        "Valid": _valid,
        "Progress": _progress,
        "Status": _status,
        "Exception": _exception,
        "Message": _message,
        "Feedback": feedback,
        "Snapshot": snapshot,
        "Data": _data,
        "Result": _result,
      };

  @override
  String toString() {
    return source.toString();
  }
}

enum ResponseCode {
  add(10000),
  delete(20000),
  update(30000),
  blog(1000),
  photo(2000),
  story(3000),
  video(4000),
  choose(100),
  crop(200),
  translate(300);

  final int value;

  const ResponseCode(this.value);
}

enum Status {
  none(10000, ""),
  canceled(10010, ResponseMessages.processCanceled),
  failure(10020, ResponseMessages.processFailed),
  networkError(10030, ResponseMessages.internetDisconnected),
  nullable(10040, ResponseMessages.invalidData),
  paused(10050, ResponseMessages.processPaused),
  notFound(10060, ResponseMessages.notFound),
  stopped(10070, ResponseMessages.processStopped),
  running(10090, ""),
  timeOut(10080, ResponseMessages.tryAgain),
  ok(10100, ResponseMessages.successful),
  invalid(10110, ResponseMessages.invalidData),
  undefined(10120, ResponseMessages.undefined),
  unmodified(10130, ResponseMessages.unmodified),
  undetected(10140, ResponseMessages.unmodified),
  notSupported(10100, ResponseMessages.errorFound),
  error(10100, ResponseMessages.errorFound);

  final int code;
  final String message;

  const Status(this.code, this.message);
}

extension ResponseStatusExtension on Status {
  bool get isCanceled => this == Status.canceled;

  bool get isFailure => this == Status.failure;

  bool get isNetworkError => this == Status.networkError;

  bool get isNullable => this == Status.nullable;

  bool get isPaused => this == Status.paused;

  bool get isResultNotFound => this == Status.notFound;

  bool get isStopped => this == Status.stopped;

  bool get isRunning => this == Status.running;

  bool get isTimeout => this == Status.timeOut;

  bool get isSuccessful => this == Status.ok;

  bool get isInvalid => this == Status.invalid;

  bool get isUndefined => this == Status.undefined;

  bool get isUnmodified => this == Status.unmodified;

  bool get isError => this == Status.error;
}

class ResponseMessages {
  static const String internetDisconnected =
      "Your internet service has disconnected. Please confirm your internet connection.";
  static const String processCanceled = "Process has canceled!";
  static const String processFailed = "Process has failed, please try again!";
  static const String processPaused = "Process has paused!";
  static const String processStopped = "Process has stopped!";
  static const String notFound = "Result not found!";
  static const String resultNotValid = "Result not valid!";
  static const String tryAgain = "Something went wrong, please try again?";
  static const String postingUnsuccessful =
      "Posting unsuccessful, please try again!";
  static const String uploadingUnsuccessful =
      "Uploading unsuccessful, please try again!";

  static const String loaded = "Your process completed";
  static const String loading =
      "Please wait a second. Because process is running...";
  static const String invalidData = "Invalid data!";
  static const String undefined = "Undefined data!";
  static const String unmodified = "Unmodified data!";
  static const String undetected = "Undetected data!";
  static const String dataNotValid = "Data not valid!";
  static const String successful = "Successful!";
  static const String errorFound = "Error found!";
  static const String notSupported = "Not supported error found!";
}
