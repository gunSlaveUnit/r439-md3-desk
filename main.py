import sys

import yaml
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

from logic.AGL import AGL
from logic.DMDUZOZM import DMDUZOZM
from logic.KLU import KLU
from logic.L807 import L807
from logic.Plume import Plume
from logic.TLF1 import TLF1
from logic.TractPRMPRD import TractPRMPRD


def main():
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    norms_file = open("norms.yaml", "r")
    norms = yaml.safe_load(norms_file)
    current_norm_name = 'small_plume'

    l807 = L807()
    l807.current_norm = norms[current_norm_name]["l807"]
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

    start_location_filename = "gui/main.qml"
    engine.load(start_location_filename)

    app.exec()


if __name__ == '__main__':
    main()
