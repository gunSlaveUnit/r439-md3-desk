from enum import Enum

from PySide6.QtCore import Signal, Property, QObject


class AGL(QObject):
    class ZSOperatingMode(int, Enum):
        PPRCH_CONTINUOUS = 0
        PR = 1

    ZS_OPERATING_MODE_VARIANTS = ("ППРЧ непрерывный", "ПР")

    class SpeedGSPRM(int, Enum):
        NO_GS = 0
        SIX = 1

    SPEED_GS_PRM_MODES = ["Нет ГС", "6.0"]

    class SpeedGSPRD(int, Enum):
        NO_GS = 0
        SIX = 1

    SPEED_GS_PRD_MODES = ["Нет ГС", "6.0"]

    class RATSMode(int, Enum):
        NO = 0

    RATS_MODE_VARIANTS = ["Отсутствует"]

    def __init__(self):
        super().__init__()

        self._zs_operating_mode = self.ZSOperatingMode.PPRCH_CONTINUOUS
        self._speed_gs_prm = self.SpeedGSPRM.NO_GS
        self._speed_gs_prd = self.SpeedGSPRD.NO_GS
        self._rats_mode = self.RATSMode.NO

    # region ZSOperatingMode

    @Property(list, constant=True)
    def zs_operating_mode_variants(self):
        return self.ZS_OPERATING_MODE_VARIANTS

    @Signal
    def zs_operating_mode_changed(self):
        pass

    @Property(int, notify=zs_operating_mode_changed)
    def zs_operating_mode(self):
        return self._zs_operating_mode

    @zs_operating_mode.setter
    def zs_operating_mode(self, new_value: int):
        if self._zs_operating_mode == new_value:
            return
        self._zs_operating_mode = new_value
        self.zs_operating_mode_changed.emit()

    # endregion

    # region SpeedGSPRM

    @Property(list, constant=True)
    def speed_gs_prm_variants(self):
        return self.SPEED_GS_PRM_MODES

    @Signal
    def speed_gs_prm_changed(self):
        pass

    @Property(int, notify=speed_gs_prm_changed)
    def speed_gs_prm(self):
        return self._speed_gs_prm

    @speed_gs_prm.setter
    def speed_gs_prm(self, new_value: int):
        if self._speed_gs_prm == new_value:
            return
        self._speed_gs_prm = new_value
        self.speed_gs_prm_changed.emit()

    # endregion

    # region SpeedGSPRD

    @Property(list, constant=True)
    def speed_gs_prd_variants(self):
        return self.SPEED_GS_PRD_MODES

    @Signal
    def speed_gs_prd_changed(self):
        pass

    @Property(int, notify=speed_gs_prd_changed)
    def speed_gs_prd(self):
        return self._speed_gs_prd

    @speed_gs_prd.setter
    def speed_gs_prd(self, new_value: int):
        if self._speed_gs_prd == new_value:
            return
        self._speed_gs_prd = new_value
        self.speed_gs_prd_changed.emit()

    # endregion

    # region RatsMode

    @Property(list, constant=True)
    def rats_mode_variants(self):
        return self.RATS_MODE_VARIANTS

    @Signal
    def rats_mode_changed(self):
        pass

    @Property(int, notify=rats_mode_changed)
    def rats_mode(self):
        return self._rats_mode

    @rats_mode.setter
    def rats_mode(self, new_value: int):
        if self._rats_mode == new_value:
            return
        self._rats_mode = new_value
        self.rats_mode_changed.emit()

    # endregion
