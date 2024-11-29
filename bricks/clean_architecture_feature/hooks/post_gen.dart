import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) async {
  try {
    final directory = Directory.current;
    context.logger.info('Post-generation hook running in: ${directory.path}');

    final gitkeepFiles = directory.listSync(recursive: true).where((file) => file.path.endsWith('.gitkeep')).cast<File>();

    if (gitkeepFiles.isEmpty) {
      context.logger.info('No .gitkeep files found.');
      return;
    }

    await Future.forEach(gitkeepFiles, (File file) async {
      try {
        context.logger.info('Deleting ${file.path}');
        await file.delete();

        if (!await file.exists()) {
          context.logger.success('Successfully deleted: ${file.path}');
        } else {
          context.logger.err('Failed to delete: ${file.path}');
        }
      } catch (e) {
        context.logger.err('Error deleting ${file.path}: $e');
      }
    });

    context.logger.success('.gitkeep files removal process completed!');
  } catch (e) {
    context.logger.err('An error occurred during post-generation: $e');
    rethrow;
  }
}
