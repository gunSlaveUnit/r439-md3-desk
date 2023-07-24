import sys

from PySide6.QtCore import Signal, Slot, QObject
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

from logic.AGL import AGL
from logic.DMDUZOZM import DMDUZOZM
from logic.KLU import KLU
from logic.L807 import L807
from logic.Plume import Plume
from logic.TLF1 import TLF1
from logic.TractsPRMPRD import TractsPRMPRD


class Norm:
    def check(self):
        raise NotImplementedError()


class SmallPlumeNorm(Norm):
    def check(self):
        return l807.signal_source == 1 \
            and agl.zs_operating_mode == 0 \
            and agl.speed_gs_prm == 3 \
            and agl.speed_gs_prd == 3 \
            and agl.rats_mode == 0 \
            and tlf1.signal_prm_type == 2 \
            and tlf1.prm_speed == 1 \
            and tlf1.prm_address_one == 0 \
            and tlf1.prm_address_two == 0 \
            and tlf1.prm_address_three == 0 \
            and tlf1.signal_prd_type == 2 \
            and tlf1.prd_speed == 1 \
            and tlf1.prd_address_one == 0 \
            and tlf1.prd_address_two == 0 \
            and klu.test_check == 1 \
            and klu.prd70 == 1 \
            and klu.prd_signal_type == 0 \
            and dmd_uzozm.prm_signal_type == 1 \
            and dmd_uzozm.decoder == 4 \
            and dmd_uzozm.dmd_speed == 2 \
            and dmd_uzozm.dmd_mode == 0 \
            and dmd_uzozm.prd_uzozm_speed == 0 \
            and dmd_uzozm.uzozm_mode == 0 \
            and dmd_uzozm.filter_number == 2 \
            and dmd_uzozm.aru == 0 \
            and dmd_uzozm.auto_search == 0 \
            and dmd_uzozm.asch == 0 \
            and dmd_uzozm.dif_decoder == 1 \
            and dmd_uzozm.dmd_band == 1 \
            and dmd_uzozm.corrector == 1 \
            and tracts_prm_prd.auto_check_can == 0 \
            and tracts_prm_prd.receive_subband == 0 \
            and tracts_prm_prd.shift_generator == 1 \
            and tracts_prm_prd.barrel_filter == 0 \
            and tracts_prm_prd.amplifier == 0 \
            and tracts_prm_prd.radio_signal == 0 \
            and tracts_prm_prd.signal_type == 0 \
            and tracts_prm_prd.zs_speed == 2 \
            and tracts_prm_prd.output_u205d == 0 \
            and tracts_prm_prd.prd_wave_number == 0 \
            and tracts_prm_prd.prm_wave_number == 2500 \
            and plume.shift_generator == 1 \
            and plume.amplifier == 0 \
            and plume.output_u205d == 1 \
            and plume.prd_wave_number == 65432 \


class NormChecker(QObject):
    def __init__(self, norm: Norm):
        super().__init__()
        self._norm = norm

    @Signal
    def passed(self):
        pass

    @Slot()
    def check(self):
        if self._norm.check():
            self.passed.emit()


app = QGuiApplication(sys.argv)
engine = QQmlApplicationEngine()

l807 = L807()
engine.rootContext().setContextProperty("l807", l807)

agl = AGL()
engine.rootContext().setContextProperty("agl", agl)

tlf1 = TLF1()
engine.rootContext().setContextProperty("tlf1", tlf1)

klu = KLU()
engine.rootContext().setContextProperty("klu", klu)

dmd_uzozm = DMDUZOZM()
engine.rootContext().setContextProperty("dmd_uzozm", dmd_uzozm)

tracts_prm_prd = TractsPRMPRD()
engine.rootContext().setContextProperty("tracts_prm_prd", tracts_prm_prd)

plume = Plume()
engine.rootContext().setContextProperty("plume", plume)

current_norm = SmallPlumeNorm()
checker = NormChecker(current_norm)
engine.rootContext().setContextProperty("checker", checker)

start_location_filename = "gui/main.qml"
engine.load(start_location_filename)

app.exec()
