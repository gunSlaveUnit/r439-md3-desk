from PySide6.QtCore import QObject, Signal, Slot

from norms.norm import Norm


class NormChecker(QObject):
    def __init__(self, norm: Norm):
        super().__init__()
        self._norm = norm

    @Signal
    def passed(self):
        pass

    @Slot()
    def check(self):
        if self._norm.check():
            self.passed.emit()
