from docutils import nodes

from sphinx.util.docutils import SphinxDirective

from .utils import RawHTML


class FixMeDirective(SphinxDirective):
    def run(self) -> list[nodes.Node]:
        return [
            RawHTML('<div class="warning">'),
            nodes.inline(text="⚠️ FIXME. ⚠️"),
            RawHTML("<br/>"),
            nodes.inline(
                text="This page is just a stub that needs to be completed. You can "
            ),
            RawHTML(
                '<a href="https://github.com/Eeems-Org/remarkable.guide">open a PR on the repo</a>'
            ),
            nodes.inline(text=" to add more content to the page."),
            RawHTML("</div>"),
        ]
