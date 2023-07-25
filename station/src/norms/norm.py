from typing import List

from norms.component import NormComponent


class Norm:
    def __init__(self, components: List[NormComponent]):
        self._components = components

    def check(self):
        return all([component.check() for component in self._components])
