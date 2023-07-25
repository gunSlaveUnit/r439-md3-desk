from enum import Enum

from PySide6.QtCore import Signal, Property, QObject


class DMDUZOZM(QObject):
    prm_signal_type_changed = Signal()
    decoder_changed = Signal()
    dmd_speed_changed = Signal()
    dmd_mode_changed = Signal()
    prd_uzozm_speed_changed = Signal()
    uzozm_mode_changed = Signal()
    service_channel_ft4_changed = Signal()

    filter_number_changed = Signal()
    aru_changed = Signal()
    auto_search_changed = Signal()
    asch_changed = Signal()
    dif_decoder_changed = Signal()
    dmd_band_changed = Signal()
    corrector_changed = Signal()

    def __init__(self):
        super().__init__()

        self._prm_signal_type = 0
        self._decoder = 0
        self._dmd_speed = 0
        self._dmd_mode = 0
        self._prd_uzozm_speed = 0
        self._uzozm_mode = 0
        self._service_channel_ft4 = 0
        self._filter_number = 0
        self._aru = 0
        self._auto_search = 0
        self._asch = 0
        self._dif_decoder = 0
        self._dmd_band = 0
        self._corrector = 0

    # region RPMSignalType

    @Property(int, notify=prm_signal_type_changed)
    def prm_signal_type(self):
        return self._prm_signal_type

    @prm_signal_type.setter
    def prm_signal_type(self, new_value: int):
        if self._prm_signal_type == new_value:
            return
        self._prm_signal_type = new_value
        self.prm_signal_type_changed.emit()

    # endregion

    # region Decoder

    @Property(int, notify=decoder_changed)
    def decoder(self):
        return self._decoder

    @decoder.setter
    def decoder(self, new_value: int):
        if self._decoder == new_value:
            return
        self._decoder = new_value
        self.decoder_changed.emit()

    # endregion

    # region DMDSpeed

    @Property(int, notify=dmd_speed_changed)
    def dmd_speed(self):
        return self._dmd_speed

    @dmd_speed.setter
    def dmd_speed(self, new_value: int):
        if self._dmd_speed == new_value:
            return
        self._dmd_speed = new_value
        self.dmd_speed_changed.emit()

    # endregion

    # region DMDMode

    @Property(int, notify=dmd_speed_changed)
    def dmd_mode(self):
        return self._dmd_mode

    @dmd_mode.setter
    def dmd_mode(self, new_value: int):
        if self._dmd_mode == new_value:
            return
        self._dmd_mode = new_value
        self.dmd_speed_changed.emit()

    # endregion

    # region PRDUZOZMSpeed

    @Property(int, notify=dmd_speed_changed)
    def prd_uzozm_speed(self):
        return self._prd_uzozm_speed

    @prd_uzozm_speed.setter
    def prd_uzozm_speed(self, new_value: int):
        if self._prd_uzozm_speed == new_value:
            return
        self._prd_uzozm_speed = new_value
        self.dmd_speed_changed.emit()

    # endregion

    # region UZOZMMode

    @Property(int, notify=uzozm_mode_changed)
    def uzozm_mode(self):
        return self._uzozm_mode

    @uzozm_mode.setter
    def uzozm_mode(self, new_value: int):
        if self._uzozm_mode == new_value:
            return
        self._uzozm_mode = new_value
        self.uzozm_mode_changed.emit()

    # endregion

    # region ServiceChannelFT4

    @Property(int, notify=service_channel_ft4_changed)
    def service_channel_ft4(self):
        return self._service_channel_ft4

    @service_channel_ft4.setter
    def service_channel_ft4(self, new_value: int):
        if self._service_channel_ft4 == new_value:
            return
        self._service_channel_ft4 = new_value
        self.service_channel_ft4_changed.emit()

    # endregion

    # region FilterNumber

    @Property(int, notify=filter_number_changed)
    def filter_number(self):
        return self._filter_number

    @filter_number.setter
    def filter_number(self, new_value: int):
        if self._filter_number == new_value:
            return
        self._filter_number = new_value
        self.filter_number_changed.emit()

    # endregion

    # region ARU

    @Property(int, notify=aru_changed)
    def aru(self):
        return self._aru

    @aru.setter
    def aru(self, new_value: int):
        if self._aru == new_value:
            return
        self._aru = new_value
        self.aru_changed.emit()

    # endregion

    # region AutoSearch

    @Property(int, notify=auto_search_changed)
    def auto_search(self):
        return self._auto_search

    @auto_search.setter
    def auto_search(self, new_value: int):
        if self._auto_search == new_value:
            return
        self._auto_search = new_value
        self.auto_search_changed.emit()

    # endregion

    # region ASCH

    @Property(int, notify=asch_changed)
    def asch(self):
        return self._asch

    @asch.setter
    def asch(self, new_value: int):
        if self._asch == new_value:
            return
        self._asch = new_value
        self.asch_changed.emit()

    # endregion

    # region DifDecoder

    @Property(int, notify=dif_decoder_changed)
    def dif_decoder(self):
        return self._dif_decoder

    @dif_decoder.setter
    def dif_decoder(self, new_value: int):
        if self._dif_decoder == new_value:
            return
        self._dif_decoder = new_value
        self.dif_decoder_changed.emit()

    # endregion

    # region DMDBand

    @Property(int, notify=dmd_band_changed)
    def dmd_band(self):
        return self._dmd_band

    @dmd_band.setter
    def dmd_band(self, new_value: int):
        if self._dmd_band == new_value:
            return
        self._dmd_band = new_value
        self.dmd_band_changed.emit()

    # endregion

    # region Corrector

    @Property(int, notify=corrector_changed)
    def corrector(self):
        return self._corrector

    @corrector.setter
    def corrector(self, new_value: int):
        if self._corrector == new_value:
            return
        self._corrector = new_value
        self.corrector_changed.emit()

    # endregion
