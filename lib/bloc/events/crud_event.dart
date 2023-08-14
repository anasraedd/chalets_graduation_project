class CrudEvent {}

class CreateEvent<T> extends CrudEvent {
  final T model;

  CreateEvent(this.model);
}

class DeleteEvent extends CrudEvent {
  final String id;

  DeleteEvent(this.id);
}

class ReadEvent extends CrudEvent{

}

class ShowEvent extends CrudEvent{
  final String id;

  ShowEvent(this.id);
}

class UpdateEvent<T> extends CrudEvent{
  final T model;

  UpdateEvent(this.model);
}

