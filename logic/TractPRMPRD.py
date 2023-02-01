from enum import Enum

from PySide6.QtCore import Signal, Property, QObject


class TractPRMPRD(QObject):
    class AutoCheckCANVariants(int, Enum):
        NO = 0

    AUTO_CHECK_CAN_VARIANTS = ["Откл."]

    class ReceiveSubbands(int, Enum):
        ONE = 0

    RECEIVE_SUBBANDS = ["1"]

    class ShiftGeneratorVariants(int, Enum):
        ON = 0

    SHIFT_GENERATOR_VARIANTS = ["Вкл."]

    class BarrelFilterVariants(int, Enum):
        ONE = 0

    BARREL_FILTER_VARIANTS = ["1"]

    class AmplifierVariants(int, Enum):
        OFF = 0

    AMPLIFIER_VARIANTS = ["Откл."]

    class RadioSignalTypes(int, Enum):
        UP = 0

    RADIO_SIGNAL_TYPES = ["УП"]

    class SignalTypes(int, Enum):
        OFT = 0

    SIGNAL_TYPES = ["ОФТ"]

    class ZSSpeeds(int, Enum):
        SIX = 0

    ZS_SPEEDS = ["6.0"]

    class OutputsU205D(int, Enum):
        ON = 0

    OUTPUTS_U205D = ["Вкл."]

    def __init__(self):
        super().__init__()

        self._auto_check_can = self.AutoCheckCANVariants.NO
        self._receive_subband = self.ReceiveSubbands.ONE
        self._shift_generator = self.ShiftGeneratorVariants.ON
        self._barrel_filter = self.BarrelFilterVariants.ONE
        self._amplifier = self.AmplifierVariants.OFF
        self._radio_signal_type = self.RadioSignalTypes.UP
        self._signal_type = self.SignalTypes.OFT
        self._zs_speed = self.ZSSpeeds.SIX
        self._output_u205d = self.OutputsU205D.ON
        self._prd_wave_number = 0
        self._prm_wave_number = 2500

    # region AutoCheckCAN

    @Property(list, constant=True)
    def auto_check_can_variants(self):
        return self.AUTO_CHECK_CAN_VARIANTS

    @Signal
    def auto_check_can_changed(self):
        pass

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

    @Property(list, constant=True)
    def receive_subbands(self):
        return self.RECEIVE_SUBBANDS

    @Signal
    def receive_subband_changed(self):
        pass

    @Property(int, notify=receive_subband_changed)
    def receive_subband(self):
        return self._auto_check_can

    @receive_subband.setter
    def receive_subband(self, new_value: int):
        if self._receive_subband == new_value:
            return
        self._receive_subband = new_value
        self.receive_subband_changed.emit()

    # endregion

    # region ShiftGenerator

    @Property(list, constant=True)
    def shift_generator_variants(self):
        return self.SHIFT_GENERATOR_VARIANTS

    @Signal
    def shift_generator_changed(self):
        pass

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

    @Property(list, constant=True)
    def barrel_filter_variants(self):
        return self.BARREL_FILTER_VARIANTS

    @Signal
    def barrel_filter_changed(self):
        pass

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

    @Property(list, constant=True)
    def amplifier_variants(self):
        return self.BARREL_FILTER_VARIANTS

    @Signal
    def amplifier_changed(self):
        pass

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

    @Property(list, constant=True)
    def radio_signal_types(self):
        return self.BARREL_FILTER_VARIANTS

    @Signal
    def radio_signal_changed(self):
        pass

    @Property(int, notify=radio_signal_changed)
    def radio_signal(self):
        return self._amplifier

    @radio_signal.setter
    def radio_signal(self, new_value: int):
        if self._radio_signal_type == new_value:
            return
        self._radio_signal_type = new_value
        self.radio_signal_changed.emit()

    # endregion

    # region SignalType

    @Property(list, constant=True)
    def signal_types(self):
        return self.SIGNAL_TYPES

    @Signal
    def signal_type_changed(self):
        pass

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

    @Property(list, constant=True)
    def zs_speeds(self):
        return self.ZS_SPEEDS

    @Signal
    def zs_speed_changed(self):
        pass

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

    @Property(list, constant=True)
    def outputs_u205d(self):
        return self.OUTPUTS_U205D

    @Signal
    def output_u205d_changed(self):
        pass

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

    @Signal
    def prd_wave_number_changed(self):
        pass

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

    @Signal
    def prm_wave_number_changed(self):
        pass

    @Property(int, notify=prm_wave_number_changed)
    def prm_wave_number(self):
        return self._prd_wave_number

    @prm_wave_number.setter
    def prm_wave_number(self, new_value: int):
        if self._prm_wave_number == new_value:
            return
        self._prm_wave_number = new_value
        self.prm_wave_number_changed.emit()

    # endregion
