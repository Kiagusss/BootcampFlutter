import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'bloc/document_bloc/document_cubit.dart';

class MateriFirebaseStorage extends StatefulWidget {
  const MateriFirebaseStorage({super.key});

  @override
  State<MateriFirebaseStorage> createState() => _MateriFirebaseStorageState();
}

class _MateriFirebaseStorageState extends State<MateriFirebaseStorage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Tugas Firebase",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: BlocBuilder<DocumentCubit, DocumentState>(
          builder: (context, state) {
            return ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                if (state.fileName != null && state.fileName != null) ...[
                  _buildFileWidget(state.linkDokumen!, state.fileName!),
                ],
                const SizedBox(
                  height: 20,
                ),
                if (state.linkDokumen != null) ...[
                  SelectableText('Download Link: ${state.linkDokumen}'),
                  ElevatedButton(
                    onPressed: () async {
                      context.read<DocumentCubit>().deleteDocument();
                    },
                    child: const Text('Delete Document'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await pickDocument(isReplace: true);
                    },
                    child: const Text('Edit Document'),
                  ),
                ],
                if (state.isLoading) ...[
                  const CircularProgressIndicator(),
                  Text('Upload Progress: ${state.uploadProgress * 100}%'),
                ],
                if (!state.isLoading && state.linkDokumen == null) ...[
                  ElevatedButton(
                    onPressed: () async {
                      await pickDocument();
                    },
                    child: const Text('Upload Document'),
                  ),
                ],
                if (state.errorMessage.isNotEmpty) ...[
                  Text('Error: ${state.errorMessage}'),
                ],
              ],
            );
          },
        ),
      ),
    );
  }

  Future<void> pickDocument({bool isReplace = false}) async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.any);

    if (result != null) {
      String? path = result.files.single.path;
      String fileName = result.files.single.name;
      String fileExtension = fileName.split('.').last.toLowerCase();

      if (path != null) {
        if (isReplace) {
          context
              .read<DocumentCubit>()
              .replaceDocument(path: path, fileName: fileName);
        } else {
          context
              .read<DocumentCubit>()
              .uploadDocument(path: path, fileName: fileName);
        }
      }
    }
  }

  Widget _buildFileWidget(String fileUrl, String fileName) {
    String fileExtension = fileName.split('.').last.toLowerCase();

    bool isImage = ['jpg', 'jpeg', 'png', 'gif'].contains(fileExtension);

    return ListTile(
      leading: isImage
          ? Container(
              child: Image.network(
                fileUrl,
              ),
            )
          : const Icon(Icons.insert_drive_file),
      title: Text(fileName),
      onTap: () async {
        final Uri uri = Uri.parse(fileUrl);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        } else {
          throw 'Could not launch $uri';
        }
      },
    );
  }
}
