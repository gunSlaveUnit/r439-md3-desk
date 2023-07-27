from typing import List

from PySide6.QtCore import QObject

from norms.component import NormComponent


class Norm(QObject):
    def __init__(self, components: List[NormComponent]):
        super().__init__()
        self._components = components

    def check(self):
        return all([component.check() for component in self._components])
