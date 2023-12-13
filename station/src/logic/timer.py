import datetime
import time

from PySide6.QtCore import Signal, Property, QObject, Slot


class Timer(QObject):
    zs_operating_mode_changed = Signal()

    def __init__(self):
        super().__init__()

        self._time: float = 0.0

    @Slot()
    def start(self):
        self._time = time.time()

    @Slot()
    def stop(self):
        self._time = 0

    elapsed_changed = Signal()

    @Property(float, notify=elapsed_changed)
    def elapsed(self):
        return time.time() - self._time

    @elapsed.setter
    def elapsed(self, new_value: float):
        pass
