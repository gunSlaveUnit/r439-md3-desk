from PySide6.QtCore import Signal, Property, QObject


class TractsPRMPRD(QObject):
    auto_check_can_changed = Signal()
    receive_subband_changed = Signal()
    shift_generator_changed = Signal()
    barrel_filter_changed = Signal()
    amplifier_changed = Signal()
    radio_signal_changed = Signal()
    signal_type_changed = Signal()
    zs_speed_changed = Signal()
    output_u205d_changed = Signal()
    prd_wave_number_changed = Signal()
    prm_wave_number_changed = Signal()

    def __init__(self):
        super().__init__()

        self._auto_check_can = 0
        self._receive_subband = 0
        self._shift_generator = 0
        self._barrel_filter = 0
        self._amplifier = 0
        self._radio_signal_type = 0
        self._signal_type = 0
        self._zs_speed = 0
        self._output_u205d = 0
        self._prd_wave_number = 0
        self._prm_wave_number = 0

    # region AutoCheckCAN

    @Property(int, notify=auto_check_can_changed)
    def auto_check_can(self):
        return self._auto_check_can

    @auto_check_can.setter
    def auto_check_can(self, new_value: int):
        if self._auto_check_can == new_value:
            return
        self._auto_check_can = new_value
        self.auto_check_can_changed.emit()

    # endregion

    # region ReceiveSubband

    @Property(int, notify=receive_subband_changed)
    def receive_subband(self):
        return self._receive_subband

    @receive_subband.setter
    def receive_subband(self, new_value: int):
        if self._receive_subband == new_value:
            return
        self._receive_subband = new_value
        self.receive_subband_changed.emit()

    # endregion

    # region ShiftGenerator

    @Property(int, notify=shift_generator_changed)
    def shift_generator(self):
        return self._shift_generator

    @shift_generator.setter
    def shift_generator(self, new_value: int):
        if self._shift_generator == new_value:
            return
        self._shift_generator = new_value
        self.shift_generator_changed.emit()

    # endregion

    # region BarrelFilter

    @Property(int, notify=barrel_filter_changed)
    def barrel_filter(self):
        return self._barrel_filter

    @barrel_filter.setter
    def barrel_filter(self, new_value: int):
        if self._barrel_filter == new_value:
            return
        self._barrel_filter = new_value
        self.barrel_filter_changed.emit()

    # endregion

    # region Amplifier

    @Property(int, notify=amplifier_changed)
    def amplifier(self):
        return self._amplifier

    @amplifier.setter
    def amplifier(self, new_value: int):
        if self._amplifier == new_value:
            return
        self._amplifier = new_value
        self.amplifier_changed.emit()

    # endregion

    # region RadioSignalType

    @Property(int, notify=radio_signal_changed)
    def radio_signal(self):
        return self._radio_signal_type

    @radio_signal.setter
    def radio_signal(self, new_value: int):
        if self._radio_signal_type == new_value:
            return
        self._radio_signal_type = new_value
        self.radio_signal_changed.emit()

    # endregion

    # region SignalType

    @Property(int, notify=signal_type_changed)
    def signal_type(self):
        return self._signal_type

    @signal_type.setter
    def signal_type(self, new_value: int):
        if self._signal_type == new_value:
            return
        self._signal_type = new_value
        self.signal_type_changed.emit()

    # endregion

    # region ZSSpeed

    @Property(int, notify=zs_speed_changed)
    def zs_speed(self):
        return self._zs_speed

    @zs_speed.setter
    def zs_speed(self, new_value: int):
        if self._zs_speed == new_value:
            return
        self._zs_speed = new_value
        self.zs_speed_changed.emit()

    # endregion

    # region OutputU205D

    @Property(int, notify=output_u205d_changed)
    def output_u205d(self):
        return self._output_u205d

    @output_u205d.setter
    def output_u205d(self, new_value: int):
        if self._output_u205d == new_value:
            return
        self._output_u205d = new_value
        self.output_u205d_changed.emit()

    # endregion

    # region PRDWaveNumber

    @Property(int, notify=prd_wave_number_changed)
    def prd_wave_number(self):
        return self._prd_wave_number

    @prd_wave_number.setter
    def prd_wave_number(self, new_value: int):
        if self._prd_wave_number == new_value:
            return
        self._prd_wave_number = new_value
        self.prd_wave_number_changed.emit()

    # endregion

    # region PRMWaveNumber

    @Property(int, notify=prm_wave_number_changed)
    def prm_wave_number(self):
        return self._prm_wave_number

    @prm_wave_number.setter
    def prm_wave_number(self, new_value: int):
        if self._prm_wave_number == new_value:
            return
        self._prm_wave_number = new_value
        self.prm_wave_number_changed.emit()

    # endregion
