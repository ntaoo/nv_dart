library markdown_editor_component;

import 'package:angular/angular.dart';
import 'dart:js';
import 'dart:html';

@NgComponent(
    selector: 'markdown-editor',
    templateUrl: 'packages/nv_dart/components/markdown_editor_component.html',
    cssUrl: 'packages/nv_dart/components/markdown_editor_component.css',
    publishAs: 'editor',
    applyAuthorStyles: false
)
class MarkdownEditorComponent extends NgShadowRootAware {
  @NgTwoWay('content')
  String content;

  ShadowRoot _shadowRoot;
  Scope scope;

  String source;
  bool viewingSource = false;

  get toggleButtonText => viewingSource ? 'Preview' : 'View Source';

  MarkdownEditorComponent(this.scope) {
    scope.$watch(() => content, markdownToHtml);
    scope.$watch(() => source, reloadPreview);
  }

  // hold shadowRoot
  void onShadowRoot(ShadowRoot shadowRoot){
    this._shadowRoot = shadowRoot;
  }

  void markdownToHtml() {
    this.source = context.callMethod('marked',  [content]);
  }

  void reloadPreview() {
    if (_shadowRoot != null) {
      var element = _shadowRoot.querySelector('#html');
      element.children.clear();
      element.children.add(new Element.html("<div class=\"html\">$source</div>"));
    }
  }

  void toggleView() {
    viewingSource = viewingSource ? false : true;
  }
}