import sys

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

from logic.AGL import AGL
from logic.L807 import L807
from logic.TLF1 import TLF1


def main():
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    l807 = L807()
    engine.rootContext().setContextProperty("l807", l807)

    agl = AGL()
    engine.rootContext().setContextProperty("agl", agl)

    tlf1 = TLF1()
    engine.rootContext().setContextProperty("tlf1", tlf1)

    start_location_filename = "gui/main.qml"
    engine.load(start_location_filename)

    """klu = KLU()
    dmd_uzozm = DMDUZOZM()
    tract_prm_prd = TractPRMPRD()
    plume = Plume()

    
    engine.rootContext().setContextProperty("klu", self._klu)
    engine.rootContext().setContextProperty("dmd_uzozm", self._dmd_uzozm)
    engine.rootContext().setContextProperty("tract_prm_prd", self._tract_prm_prd)
    engine.rootContext().setContextProperty("plume", self._plume)"""

    app.exec()


if __name__ == '__main__':
    main()
