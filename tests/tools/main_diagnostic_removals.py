"""Account for main's removal of specific environment-gated fprintf calls.

Apply only to the historical expected body, never to the current body: all
other tokens and callbacks must still match. Historical conversion recipes
and before/after executable references retain their complete original bodies.
"""
import re


def without_env_prints(expected, variable):
    pattern = re.compile(r'(?m)^[ \t]*if \(getenv\("' + re.escape(variable)
        + r'"\)[^\n]*?\)\s*fprintf\([\s\S]*?\);\n')
    return pattern.sub('', expected)
