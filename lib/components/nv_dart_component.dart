library the_webapp_component;

import 'package:angular/angular.dart';
import 'package:nv_dart/note.dart';

@NgComponent(
  selector: 'nv-dart',
  templateUrl: 'packages/nv_dart/components/nv_dart_component.html',
  cssUrl: 'packages/nv_dart/components/nv_dart_component.css',
  publishAs: 'nvdart',
  applyAuthorStyles: true
)
class NvDartComponent {
  @NgTwoWay('notes')
  List<Note> notes = [];
  @NgTwoWay('active-note')
  Note activeNote;

  NvDartComponent() {
    var note = new Note();
    notes.add(note);
    activeNote = note;
  }
}
