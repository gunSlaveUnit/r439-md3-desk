from enum import Enum

from PySide6.QtCore import Signal, Property, QObject


class KLU(QObject):
    class TestCheckModes(int, Enum):
        OFF = 0

    TEST_CHECK_MODES = ("Откл.")

    class PRD70Modes(int, Enum):
        OFF = 0

    RPD_70_MODES = ("Откл.")

    class PRDSignalTypes(int, Enum):
        UP_PPRCH = 0

    PRD_SIGNAL_TYPES = ("УП (ППРЧ)")

    def __init__(self):
        super().__init__()

        self._test_check = self.TestCheckModes.OFF
        self._prd70 = self.PRD70Modes.OFF
        self._prd_signal_type = self.PRDSignalTypes.UP_PPRCH

    # region TestCheck

    @Property(list, constant=True)
    def test_check_modes(self):
        return self.TEST_CHECK_MODES

    @Signal
    def test_check_changed(self):
        pass

    @Property(int, notify=test_check_changed)
    def test_check(self):
        return self._test_check

    @test_check.setter
    def test_check(self, new_value: int):
        if self._test_check == new_value:
            return
        self._test_check = new_value
        self.test_check_changed.emit()

    # endregion

    # region PRD70

    @Property(list, constant=True)
    def prd70_modes(self):
        return self.RPD_70_MODES

    @Signal
    def prd70_changed(self):
        pass

    @Property(int, notify=prd70_changed)
    def prd70(self):
        return self._prd70

    @prd70.setter
    def prd70(self, new_value: int):
        if self._prd70 == new_value:
            return
        self._prd70 = new_value
        self.prd70_changed.emit()

    # endregion

    # region RPDSignalType

    @Property(list, constant=True)
    def prd_signal_types(self):
        return self.PRD_SIGNAL_TYPES

    @Signal
    def prd_signal_type_changed(self):
        pass

    @Property(int, notify=prd_signal_type_changed)
    def prd_signal_type(self):
        return self._prd_signal_type

    @prd_signal_type.setter
    def prd_signal_type(self, new_value: int):
        if self._prd_signal_type == new_value:
            return
        self._prd_signal_type = new_value
        self.prd_signal_type_changed.emit()

    # endregion
