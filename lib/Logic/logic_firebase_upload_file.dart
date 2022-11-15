import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';


import '../Data/data_firebase_storage_service.dart';

class FileUploadFirebaseBaseEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FileUploadFirebaseBaseState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FileUploadFirebaseEvent extends FileUploadFirebaseBaseEvent {
  final XFile? file;
  final String email;

  FileUploadFirebaseEvent(
      {required this.file,
       required this.email
      });
}

class FileSelectedEvent extends FileUploadFirebaseBaseEvent {
  final XFile? file;


  FileSelectedEvent(
      {required this.file,
      });
}

class FileUploadFirebaseLoading extends FileUploadFirebaseBaseState {}
class FileUploadFirebaseIniated extends FileUploadFirebaseBaseState {}
class FileSelected extends FileUploadFirebaseBaseState 
{
    final XFile? file;


  FileSelected(
      {required this.file,
      });
}

class FileNotSelected extends FileUploadFirebaseBaseState {}

class FileUploadFirebaseError extends FileUploadFirebaseBaseState {}

class FileUploadFirebaseSuccess extends FileUploadFirebaseBaseState {


  FileUploadFirebaseSuccess();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FileUploadFirebaseLogic
    extends Bloc<FileUploadFirebaseBaseEvent, FileUploadFirebaseBaseState> {
  final FireBaseStorage _fireBaseStorage;
  FileUploadFirebaseLogic(this._fireBaseStorage)
      : super(FileUploadFirebaseIniated()) {
    on<FileUploadFirebaseBaseEvent>(eventMapper);
    on<FileSelectedEvent>(eventMapper);
  }

  Future<void> eventMapper(
    FileUploadFirebaseBaseEvent event,
    Emitter<FileUploadFirebaseBaseState> emit,
  ) async {

    if(event is FileSelectedEvent)
    {
      var picker = ImagePicker();
          var file = await picker.pickImage(
                            source: ImageSource.gallery);
      if(file != null)
      {
          emit(FileSelected(file:file));
      }else
      {
         emit(FileNotSelected());
      }
    }
    if (event is FileUploadFirebaseEvent) {
      try {
        emit(FileUploadFirebaseLoading());
        var response = await _fireBaseStorage.uploadResumeAsync(event.email, event.file);

        if (response == true) {
          emit(FileUploadFirebaseSuccess());
        }

        emit(FileUploadFirebaseError());
      } catch (e) {
        emit(FileUploadFirebaseError());
      }
    }
  }
}
