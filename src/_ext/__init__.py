from .fixme import FixMeDirective
from .gallery import GalleryDirective
from .warningbox import WarningBoxDirective

from sphinx.application import Sphinx
from sphinx.util.typing import ExtensionMetadata


def setup(app: Sphinx) -> ExtensionMetadata:
    app.add_directive("fixme", FixMeDirective)
    app.add_directive("warningbox", WarningBoxDirective)
    app.add_directive("gallery", GalleryDirective)

    return {
        "version": "0.1",
        "parallel_read_safe": True,
        "parallel_write_safe": True,
    }
