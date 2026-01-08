from docutils import nodes

from sphinx.util.docutils import SphinxDirective

from .utils import RawHTML


class RedirectDirective(SphinxDirective):
    required_arguments = 1

    def run(self) -> list[nodes.Node]:
        new_page = self.arguments[0]
        new_uri = self.env.app.builder.get_target_uri(new_page)
        return [
            *self.parse_text_to_nodes(
                f"This page has been moved to  :doc:`{new_page}`."
            ),
            RawHTML(
                f'<noscript><meta http-equiv="refresh" content="0; url={new_uri}"/></noscript>'
            ),
            RawHTML(f'<script>location.href = "{new_uri}";</script>'),
        ]
