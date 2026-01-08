from docutils import nodes

from sphinx.util.docutils import SphinxDirective

from .utils import RawHTML


class WarningBoxDirective(SphinxDirective):
    """A directive to say hello!"""

    has_content = True
    option_spec = {
        "title": str,
    }

    def run(self) -> list[nodes.Node]:
        return [
            RawHTML(f'<div class="warning">⚠️ {self.options["title"]} ⚠️'),
            *self.parse_content_to_nodes(),
            RawHTML("</div>"),
        ]
