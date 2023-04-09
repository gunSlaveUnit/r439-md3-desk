from PySide6.QtCore import Signal, Property, QObject


class KLU(QObject):
    test_check_changed = Signal()
    prd70_changed = Signal()
    prd_signal_type_changed = Signal()

    def __init__(self):
        super().__init__()

        self._test_check = 0
        self._prd70 = 0
        self._prd_signal_type = 0

    # region TestCheck

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
