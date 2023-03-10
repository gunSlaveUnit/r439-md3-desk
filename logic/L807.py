from enum import Enum

from PySide6.QtCore import Signal, Property, QObject


class L807(QObject):
    class Joint(int, Enum):
        SWITCHED_OFF = 0

    JOINT_MODES = ["Выключен"]

    class SignalSource(int, Enum):
        AG_L = 0

    SIGNAL_SOURCE_MODES = ["АГ-Л"]

    def __init__(self):
        super().__init__()

        self._joint = self.Joint.SWITCHED_OFF
        self._signal_source = self.SignalSource.AG_L

    # region Joint

    @Property(list, constant=True)
    def joint_modes(self):
        return self.JOINT_MODES

    @Signal
    def joint_changed(self):
        pass

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

    @Property(list, constant=True)
    def signal_source_modes(self):
        return self.SIGNAL_SOURCE_MODES

    @Signal
    def signal_source_changed(self):
        pass

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
