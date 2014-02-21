library nv_dart;

import 'package:logging/logging.dart';
import 'package:angular/angular.dart';
import 'package:di/di.dart';

import 'package:nv_dart/components/nv_dart_component.dart';
import 'package:nv_dart/components/note_list_component.dart';
import 'package:nv_dart/components/markdown_editor_component.dart';
import 'package:nv_dart/directives/event_directive.dart';

@MirrorsUsed(
  targets: const ['nv_dart', 'note', 'event_directive', 'nv_dart_component', 'note_list_component', 'markdown_editor_component'],
  override: '*')
import 'dart:mirrors';

class NvDartModule extends Module {
  NvDartModule() {
    type(NvDartComponent);
    type(NoteListComponent);
    type(MarkdownEditorComponent);
    type(EventDirective);
  }
}

main() {
  Logger.root.level = Level.FINEST;
  Logger.root.onRecord.listen((LogRecord r) { print(r.message); });
  ngBootstrap(module: new NvDartModule());
}