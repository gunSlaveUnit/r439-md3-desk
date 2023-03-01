from enum import Enum

from PySide6.QtCore import Signal, Property, QObject, Slot


class Plume(QObject):
    class ShiftGeneratorVariants(int, Enum):
        ON = 0

    SHIFT_GENERATOR_VARIANTS = ["Вкл."]

    class AmplifierVariants(int, Enum):
        OFF = 0

    AMPLIFIER_VARIANTS = ["Откл."]

    class OutputsU205D(int, Enum):
        ON = 0

    OUTPUTS_U205D = ["Вкл."]

    def __init__(self):
        super().__init__()

        self._shift_generator = self.ShiftGeneratorVariants.ON
        self._amplifier = self.AmplifierVariants.OFF
        self._output_u205d = self.OutputsU205D.ON
        self._prd_wave_number = 0
        self._stem_filter = 1
        self._prm_wave_number = 2500
        self._receive_subband = 1
        self._dmd_filter_number = 3

    def _calculate_parameters(self):
        self.stem_filter = 8
        self.prm_wave_number = 2216
        self.receive_subband = 34
        self.dmd_filter_number = 3

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

    # region Amplifier

    @Property(list, constant=True)
    def amplifier_variants(self):
        return self.AMPLIFIER_VARIANTS

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
        self._calculate_parameters()
        self.prd_wave_number_changed.emit()

    # endregion

    # region Stem filter

    @Signal
    def stem_filter_changed(self):
        pass

    @Property(int, notify=stem_filter_changed)
    def stem_filter(self):
        return self._stem_filter

    @stem_filter.setter
    def stem_filter(self, new_value: int):
        if self._stem_filter == new_value:
            return
        self._stem_filter = new_value
        self.stem_filter_changed.emit()

    # endregion

    # region PRMWaveNumber

    @Signal
    def prm_wave_number_changed(self):
        pass

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

    # region Receive subband

    @Signal
    def receive_subband_changed(self):
        pass

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

    # region DMD filter number

    @Signal
    def dmd_filter_number_changed(self):
        pass

    @Property(int, notify=dmd_filter_number_changed)
    def dmd_filter_number(self):
        return self._dmd_filter_number

    @dmd_filter_number.setter
    def dmd_filter_number(self, new_value: int):
        if self._dmd_filter_number == new_value:
            return
        self._dmd_filter_number = new_value
        self.dmd_filter_number_changed.emit()

    # endregion
