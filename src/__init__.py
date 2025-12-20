"""
Chakra UI QML - A modern QML component library inspired by Chakra UI

This package provides a comprehensive set of QML components with a focus on
accessibility, themability, and developer experience.
"""

__version__ = "0.0.2"
__author__ = "ASLant"

from .Chakra import CFrameless, init, COMPONENTS, get_component_path

__all__ = ["CFrameless", "init", "COMPONENTS", "get_component_path", "__version__"]
