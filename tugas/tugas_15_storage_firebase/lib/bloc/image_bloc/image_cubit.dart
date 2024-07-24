import 'dart:io';
import 'dart:math';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'image_state.dart';

class ImagesCubit extends Cubit<ImagesState> {
  ImagesCubit() : super(const ImagesState());

  /// Upload Image Method
  Future<void> uploadImage({required String path}) async {
    /// Image Reference pada Storage
    final imageRef = FirebaseStorage.instance.ref().child('images');

    /// Upload Gambar ke Referance Image
    try {
      /// Emit loading state
      emit(const ImagesState(isLoading: true));

      /// Generate Random ID
      final randomID = '${Random().nextInt(99) + 256}';

      /// Upload Task untuk gambar dengan ID.
      final uploadTask = imageRef.child(randomID).putFile(File(path));

      /// Lakukan dan listen pada proses upload
      uploadTask.snapshotEvents.listen((event) {
        switch (event.state) {
          case TaskState.running:
            final progress = 100 * (event.bytesTransferred / event.totalBytes);

            /// Emit Loading and the upload progress
            emit(
              ImagesState(
                isLoading: true,
                uploadProgress: progress / 100,
              ),
            );
            break;
          case TaskState.success:
            // Ambil download link dari gambar
            event.ref.getDownloadURL().then(
              (value) => emit(
                ImagesState(
                  isLoading: false,
                  linkGambar: value,
                ),
              ),
            );
            break;
          case TaskState.error:
            emit(ImagesState(errorMessage: e.toString()));
            break;
          case TaskState.canceled || TaskState.paused:
            break;
        }
      });
    } catch (e) {
      emit(ImagesState(errorMessage: e.toString()));
    }
  }
}
