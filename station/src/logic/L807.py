from PySide6.QtCore import Signal, Property, QObject


class L807(QObject):
    joint_changed = Signal()
    signal_source_changed = Signal()

    def __init__(self):
        super().__init__()

        self._joint = 0
        self._signal_source = 0

    # region Joint

    @Property(int, notify=joint_changed)
    def joint(self):
        return self._joint

    @joint.setter
    def joint(self, new_value: int):
        if self._joint == new_value:
            return
        self._joint = new_value
        self.joint_changed.emit()

    # endregion

    # region SignalSource

    @Property(int, notify=signal_source_changed)
    def signal_source(self):
        return self._signal_source

    @signal_source.setter
    def signal_source(self, new_value: int):
        if self._signal_source == new_value:
            return
        self._signal_source = new_value
        self.signal_source_changed.emit()

    # endregion
