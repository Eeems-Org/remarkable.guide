from docutils import nodes

from sphinx.util.docutils import SphinxDirective

from .utils import RawHTML


class GalleryDirective(SphinxDirective):
    """A directive to say hello!"""

    has_content = True

    def run(self) -> list[nodes.Node]:
        return [
            RawHTML('<div class="gallery">'),
            *self.parse_content_to_nodes(),
            RawHTML("</div>"),
        ]
