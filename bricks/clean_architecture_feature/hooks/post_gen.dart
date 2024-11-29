import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) async {
  try {
    final targetDirectory = Directory('lib/features/${context.vars['name']}');
    if (!targetDirectory.existsSync()) {
      context.logger.err('Target directory does not exist: ${targetDirectory.path}');
      return;
    }

    context.logger.info('Post-generation hook running in: ${targetDirectory.path}');

    final gitkeepFiles = targetDirectory.listSync(recursive: true).where((file) => file.path.endsWith('.gitkeep')).cast<File>();

    if (gitkeepFiles.isEmpty) {
      context.logger.info('No .gitkeep files found in ${targetDirectory.path}.');
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

    context.logger.success('.gitkeep files removal process completed in ${targetDirectory.path}!');
  } catch (e) {
    context.logger.err('An error occurred during post-generation: $e');
    rethrow;
  }
}
