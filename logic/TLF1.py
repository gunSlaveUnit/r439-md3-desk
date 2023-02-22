from enum import Enum

from PySide6.QtCore import Signal, Property, QObject


class TLF1(QObject):
    SIGNAL_PRM_TYPES = ("Канал не задан", "Закреп. непрер.")
    PRM_SPEEDS = ("4.8", "9.6")
    PRM_GS_ADDRESSES_ONE = ("0")
    PRM_GS_ADDRESSES_TWO = ("0")
    PRM_GS_ADDRESSES_THREE = ("", "1")

    SIGNAL_PRD_TYPES = ("Канал не задан", "Закреп. непрер.")
    PRD_SPEEDS = ("4.8", "9.6")
    PRD_GS_ADDRESSES_ONE = ("0")
    PRD_GS_ADDRESSES_TWO = ("", "1")

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

    @Property(list, constant=True)
    def signal_prm_types(self):
        return self.SIGNAL_PRM_TYPES

    @Signal
    def signal_prm_type_changed(self):
        pass

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

    @Property(list, constant=True)
    def prm_speeds(self):
        return self.PRM_SPEEDS

    @Signal
    def prm_speed_changed(self):
        pass

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

    @Property(list, constant=True)
    def prm_addresses_one(self):
        return self.PRM_GS_ADDRESSES_ONE

    @Signal
    def prm_address_one_changed(self):
        pass

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

    @Property(list, constant=True)
    def prm_addresses_two(self):
        return self.PRM_GS_ADDRESSES_TWO

    @Signal
    def prm_address_two_changed(self):
        pass

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

    @Property(list, constant=True)
    def prm_addresses_three(self):
        return self.PRM_GS_ADDRESSES_THREE

    @Signal
    def prm_address_three_changed(self):
        pass

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

    @Property(list, constant=True)
    def signal_prd_types(self):
        return self.SIGNAL_PRD_TYPES

    @Signal
    def signal_prd_type_changed(self):
        pass

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

    @Property(list, constant=True)
    def prd_speeds(self):
        return self.PRD_SPEEDS

    @Signal
    def signal_prd_type_changed(self):
        pass

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

    # region PRDGSAddressOne

    @Property(list, constant=True)
    def prd_addresses_one(self):
        return self.PRD_GS_ADDRESSES_ONE

    @Signal
    def prd_address_one_changed(self):
        pass

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

    @Property(list, constant=True)
    def prd_addresses_two(self):
        return self.PRD_GS_ADDRESSES_TWO

    @Signal
    def prd_address_two_changed(self):
        pass

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
