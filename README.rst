=============================
Parse assembly via flex/bison
=============================

This project provides framework to parse assembly files into AST-like
structures. It was written as a replacement for `KernelCare`_ and `LibCare`_
hand-written parsers to allow for easier extensibility.

.. _`LibCare`: https://github.com/cloudlinux/libcare
.. _`KernelCare`: https://www.kernelcare.com

Implementation
==============

Since we are only interested in comparing symbol definitions we are not into
correct parsing of the assembly. This is somehow lightweight implementation
that only cares about directives leaving all the tokens/commands on their own
except for interesting ones.

Hacks
`````

I link all the tokens at the creation time and reuse these lists later to link
tokens into the statements. But, since flex/bison uses lookahead tokens
sometimes and not another I have to check that I don't add lookahead tokens to
the statements.

All the statements are linked into document on the creation time so I should
only use left-side recursion on statements token.
