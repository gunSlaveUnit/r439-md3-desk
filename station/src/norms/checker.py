from PySide6.QtCore import QObject, Signal, Slot

from norms.norm import Norm


class NormChecker(QObject):
    @Signal
    def passed(self):
        pass

    @Slot(QObject)
    def check(self, norm: Norm):
        if norm.check():
            self.passed.emit()
