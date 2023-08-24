import datetime

year = datetime.datetime.today().year

project = "reMarkable Guide"
copyright = f"2023-{year}, Eeems"
author = "Nathaniel 'Eeems' van Diepen"

html_theme_path = ["_themes"]
html_static_path = ["_static"]
templates_path = ["_templates"]

highlight_language = "shell"
html_title = "reMarkable Guide"
html_theme = "oxide"
master_doc = "sitemap"
html_sidebars = {"**": ["nav.html", "sidefooter.html"]}
html_permalinks_icon = "#"
html_use_opensearch = "https://remarkable.guide"

# Do not enable sphinx.ext.autosectionlabel
# The expectation is that we explicitely add references
extensions = [
    "sphinxcontrib.fulltoc",
    "breathe",
]
