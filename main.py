import sys
from enum import Enum

import yaml
from PySide6.QtCore import Signal, Slot, QObject
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

from logic.AGL import AGL
from logic.DMDUZOZM import DMDUZOZM
from logic.KLU import KLU
from logic.L807 import L807
from logic.Plume import Plume
from logic.TLF1 import TLF1
from logic.TractPRMPRD import TractPRMPRD


class Norm(QObject):
    def __init__(self, config=None):
        super().__init__()

        self.config = config

    @Signal
    def checked(self):
        pass

    @Slot
    def check(self):
        is_standard_passed = True
        for device_name, state in self.config.items():
            device = engine.rootContext().contextProperty(device_name)
            for setting_item in state:
                for setting_name in setting_item:
                    if getattr(device, setting_name) != setting_item[setting_name]:
                        is_standard_passed = False

        if is_standard_passed:
            self.checked.emit()


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

tract_prm_prd = TractPRMPRD()
engine.rootContext().setContextProperty("tract_prm_prd", tract_prm_prd)

plume = Plume()
engine.rootContext().setContextProperty("plume", plume)

norms_file = open("norms.yaml", "r")
norms = yaml.safe_load(norms_file)
current_norm_name = 'small_plume'
current_norm = norms[current_norm_name]

norm = Norm(current_norm)
engine.rootContext().setContextProperty("norm", norm)

start_location_filename = "gui/main.qml"
engine.load(start_location_filename)

app.exec()
