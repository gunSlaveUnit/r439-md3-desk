from enum import Enum

from PySide6.QtCore import Signal, Property, QObject


class L807(QObject):
    class Joint(int, Enum):
        SWITCHED_OFF = 0
        SWITCHED_ON = 1
        ANOTHER = 2
        ONE_MORE_ANOTHER = 3

    JOINT_MODES = ["Выключен", "Включен", "Другое", "Еще один вариант"]

    class SignalSource(int, Enum):
        AG_L = 0

    SIGNAL_SOURCE_MODES = ["АГ-Л"]

    def __init__(self):
        super().__init__()

        self._joint = self.Joint.SWITCHED_OFF
        self._signal_source = self.SignalSource.AG_L
        self.current_norm = None

    @Signal
    def standard(self):
        pass

    def check_standard(self):
        if self.current_norm is not None:
            is_standard_passed = True
            for device_states in self.current_norm:
                for device_name, state in device_states.items():
                    if getattr(self, device_name) != state:
                        is_standard_passed = False

            if is_standard_passed:
                self.standard.emit()

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
        self.check_standard()
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
