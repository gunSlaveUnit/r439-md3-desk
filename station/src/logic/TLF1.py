from PySide6.QtCore import Signal, Property, QObject


class TLF1(QObject):
    signal_prm_type_changed = Signal()
    prm_speed_changed = Signal()
    prm_address_one_changed = Signal()
    prm_address_two_changed = Signal()
    prm_address_three_changed = Signal()
    signal_prd_type_changed = Signal()
    prd_speed_changed = Signal()
    prd_address_one_changed = Signal()
    prd_address_two_changed = Signal()

    def __init__(self):
        super().__init__()

        self._signal_prm_type = 0
        self._prm_speed = 0
        self._prm_address_one = 0
        self._prm_address_two = 0
        self._prm_address_three = 0

        self._signal_prd_type = 0
        self._prd_speed = 0
        self._prd_address_one = 0
        self._prd_address_two = 0

    # region SignalPRMType

    @Property(int, notify=signal_prm_type_changed)
    def signal_prm_type(self):
        return self._signal_prm_type

    @signal_prm_type.setter
    def signal_prm_type(self, new_value: int):
        if self._signal_prm_type == new_value:
            return
        self._signal_prm_type = new_value
        self.signal_prm_type_changed.emit()

    # endregion

    # region PRMSpeed

    @Property(int, notify=prm_speed_changed)
    def prm_speed(self):
        return self._prm_speed

    @prm_speed.setter
    def prm_speed(self, new_value: int):
        if self._prm_speed == new_value:
            return
        self._prm_speed = new_value
        self.prm_speed_changed.emit()

    # endregion

    # region PRMGSAddressOne

    @Property(int, notify=prm_address_one_changed)
    def prm_address_one(self):
        return self._prm_address_one

    @prm_address_one.setter
    def prm_address_one(self, new_value: int):
        if self._prm_address_one == new_value:
            return
        self._prm_address_one = new_value
        self.prm_address_one_changed.emit()

    # endregion

    # region PRMGSAddressTwo

    @Property(int, notify=prm_address_two_changed)
    def prm_address_two(self):
        return self._prm_address_two

    @prm_address_two.setter
    def prm_address_two(self, new_value: int):
        if self._prm_address_two == new_value:
            return
        self._prm_address_two = new_value
        self.prm_address_two_changed.emit()

    # endregion

    # region PRMGSAddressThree

    @Property(int, notify=prm_address_three_changed)
    def prm_address_three(self):
        return self._prm_address_three

    @prm_address_three.setter
    def prm_address_three(self, new_value: int):
        if self._prm_address_three == new_value:
            return
        self._prm_address_three = new_value
        self.prm_address_three_changed.emit()

    # endregion

    # region SignalPRDType

    @Property(int, notify=signal_prd_type_changed)
    def signal_prd_type(self):
        return self._signal_prd_type

    @signal_prd_type.setter
    def signal_prd_type(self, new_value: int):
        if self._signal_prd_type == new_value:
            return
        self._signal_prd_type = new_value
        self.signal_prd_type_changed.emit()

    # endregion

    # region PRDSpeed

    @Property(int, notify=prd_speed_changed)
    def prd_speed(self):
        return self._prd_speed

    @prd_speed.setter
    def prd_speed(self, new_value: int):
        if self._prd_speed == new_value:
            return
        self._prd_speed = new_value
        self.prd_speed_changed.emit()

    # endregion

    # region PRDGSAddressOne

    @Property(int, notify=prd_address_one_changed)
    def prd_address_one(self):
        return self._prd_address_one

    @prd_address_one.setter
    def prd_address_one(self, new_value: int):
        if self._prd_address_one == new_value:
            return
        self._prd_address_one = new_value
        self.prd_address_one_changed.emit()

    # endregion

    # region PRDGSAddressTwo

    @Property(int, notify=prd_address_two_changed)
    def prd_address_two(self):
        return self._prd_address_two

    @prd_address_two.setter
    def prd_address_two(self, new_value: int):
        if self._prd_address_two == new_value:
            return
        self._prd_address_two = new_value
        self.prd_address_two_changed.emit()

    # endregion
