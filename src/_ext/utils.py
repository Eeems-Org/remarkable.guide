from docutils import nodes

def RawHTML(html) -> nodes.Node:
    return nodes.raw(html, html, format="html")
