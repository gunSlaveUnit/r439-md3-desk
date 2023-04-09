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

    class FilterNumbers(int, Enum):
        ONE = 0
        THREE = 1

    FILTER_NUMBERS = ["1", "3"]

    class ARUVariants(int, Enum):
        ARU = 0

    ARU_VARIANTS = ["АРУ"]

    class AutoSearchVariants(int, Enum):
        ON = 0

    AUTO_SEARCH_VARIANTS = ["Вкл."]

    class ASCHVariants(int, Enum):
        ON = 0

    ASCH_VARIANTS = ["Вкл."]

    class DifDecoderVariants(int, Enum):
        ON = 0

    DIF_DECODER_VARIANTS = ["Вкл."]

    class DMDBands(int, Enum):
        WIDE = 0

    DMD_BANDS = ["Широкая"]

    class CorrectorVariants(int, Enum):
        OFF = 0

    CORRECTOR_VARIANTS = ["Откл."]

    def __init__(self):
        super().__init__()

        self._prm_signal_type = 0
        self._decoder = 0
        self._dmd_speed = 0
        self._dmd_mode = 0
        self._prd_uzozm_speed = 0
        self._uzozm_mode = 0
        self._service_channel_ft4 = 0
        self._filter_number = self.FilterNumbers.ONE
        self._aru = self.ARUVariants.ARU
        self._auto_search = self.AutoSearchVariants.ON
        self._asch = self.ASCHVariants.ON
        self._dif_decoder = self.DifDecoderVariants.ON
        self._dmd_band = self.DMDBands.WIDE
        self._corrector = self.CorrectorVariants.OFF

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

    @Property(list, constant=True)
    def filter_numbers(self):
        return self.FILTER_NUMBERS

    @Signal
    def filter_number_changed(self):
        pass

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

    @Property(list, constant=True)
    def aru_variants(self):
        return self.ARU_VARIANTS

    @Signal
    def aru_changed(self):
        pass

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

    @Property(list, constant=True)
    def auto_search_variants(self):
        return self.AUTO_SEARCH_VARIANTS

    @Signal
    def auto_search_changed(self):
        pass

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

    @Property(list, constant=True)
    def asch_variants(self):
        return self.ASCH_VARIANTS

    @Signal
    def asch_changed(self):
        pass

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

    @Property(list, constant=True)
    def dif_decoder_variants(self):
        return self.DIF_DECODER_VARIANTS

    @Signal
    def dif_decoder_changed(self):
        pass

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

    @Property(list, constant=True)
    def dmd_bands(self):
        return self.DMD_BANDS

    @Signal
    def dmd_band_changed(self):
        pass

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

    @Property(list, constant=True)
    def corrector_variants(self):
        return self.CORRECTOR_VARIANTS

    @Signal
    def corrector_changed(self):
        pass

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
