from PySide6.QtCore import Signal, Property, QObject


class AGL(QObject):
    zs_operating_mode_changed = Signal()
    speed_gs_prm_changed = Signal()
    speed_gs_prd_changed = Signal()
    rats_mode_changed = Signal()

    def __init__(self):
        super().__init__()

        self._zs_operating_mode = 0
        self._speed_gs_prm = 0
        self._speed_gs_prd = 0
        self._rats_mode = 0

    # region ZSOperatingMode

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
