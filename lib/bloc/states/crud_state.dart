enum ProcessType {create, update, delete}

class CrudState{

}

class ProcessState extends CrudState{
  final String message;
  final bool success;
  final ProcessType processType;


  ProcessState(this.processType, this.message, this.success);
}

class ReadState<T> extends CrudState{
  final List<T> date;

  ReadState(this.date);
}

class ShowState<T> extends CrudState{
  T? model;

  ShowState(this.model);
}

class LoadingState extends CrudState{

}

// class UpdateState extends CrudState{
//   final String message;
//   final bool Success;
//
//   UpdateState(this.message, this.Success);
// }

