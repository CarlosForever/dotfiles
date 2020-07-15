"""
Sane List Extension for Python-Markdown
=======================================

Modify the behavior of Lists in Python-Markdown to act in a sane manor.

See <https://Python-Markdown.github.io/extensions/sane_lists>
for documentation.

Original code Copyright 2011 [Waylan Limberg](http://achinghead.com)

All changes Copyright 2011-2014 The Python Markdown Project

License: [BSD](http://www.opensource.org/licenses/bsd-license.php)

"""

from __future__ import absolute_import
from __future__ import unicode_literals
from . import Extension
from ..blockprocessors import OListProcessor, UListProcessor
import re


class SaneOListProcessor(OListProcessor):

    SIBLING_TAGS = ['ol']
    LAZY_OL = False

    def __init__(self, parser):
        super(SaneOListProcessor, self).__init__(parser)
        self.CHILD_RE = re.compile(r'^[ ]{0,%d}((\d+\.))[ ]+(.*)' %
                                   (self.tab_length - 1))


class SaneUListProcessor(UListProcessor):

    SIBLING_TAGS = ['ul']

    def __init__(self, parser):
        super(SaneUListProcessor, self).__init__(parser)
        self.CHILD_RE = re.compile(r'^[ ]{0,%d}(([*+-]))[ ]+(.*)' %
                                   (self.tab_length - 1))


class SaneListExtension(Extension):
    """ Add sane lists to Markdown. """

    def extendMarkdown(self, md):
        """ Override existing Processors. """
        md.parser.blockprocessors.register(SaneOListProcessor(md.parser), 'olist', 40)
        md.parser.blockprocessors.register(SaneUListProcessor(md.parser), 'ulist', 30)


def makeExtension(**kwargs):  # pragma: no cover
    return SaneListExtension(**kwargs)
