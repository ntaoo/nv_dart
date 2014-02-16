library event_directive;

import 'dart:html';
import 'package:angular/angular.dart';

@NgDirective(
  selector: '[on-escape-keydown]',
  map: const {'on-escape-keydown': '&onEscapeKeydown'}
)
@NgDirective(
  selector: '[title-edit-focus]',
  map: const {'title-edit-focus': '@titleEditFocus'}
)
class EventDirective {
  final Map<int, Function> listeners = {};
  final Element element;
  final Scope scope;

  EventDirective(this.element, this.scope);

  void initHandler(stream, value, [bool predicate(event)]) {
    final int key = stream.hashCode;

    if (!listeners.containsKey(key)) {
      listeners[key] = value;
      stream.listen((event) => scope.$apply(() {
        if (predicate == null || predicate(event)) {
          event.preventDefault();
          value({r'$event': event});
        }
      }));
    }
  }

  set onEscapeKeydown(value) {
    initHandler(element.onKeyDown, value, (event) => event.keyCode == KeyCode.ESC);
  }

  set titleEditFocus(watchExpr) {
    scope.$watch(watchExpr, (value) {
      if (value) {
        element.focus();
      }
    });
  }
}