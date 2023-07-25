from PySide6.QtCore import Signal, Property, QObject, Slot


class Plume(QObject):
    shift_generator_changed = Signal()
    amplifier_changed = Signal()
    output_u205d_changed = Signal()
    prd_wave_number_changed = Signal()
    stem_filter_changed = Signal()
    prm_wave_number_changed = Signal()
    receive_subband_changed = Signal()
    dmd_filter_number_changed = Signal()

    def __init__(self):
        super().__init__()

        self._shift_generator = 0
        self._amplifier = 0
        self._output_u205d = 0
        self._prd_wave_number = 0

        self._stem_filter = 1
        self._prm_wave_number = 2500
        self._receive_subband = 1
        self._dmd_filter_number = 3

    @Slot()
    def calculate_parameters(self):
        self.stem_filter = 8
        self.prm_wave_number = 2216
        self.receive_subband = 34
        self.dmd_filter_number = 3

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

    # region Stem filter

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
