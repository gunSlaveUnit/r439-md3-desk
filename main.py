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
        return l807.signal_source == 0


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
