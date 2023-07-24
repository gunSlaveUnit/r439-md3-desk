import sys

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

from devices import l807, agl, tlf1, klu, dmd_uzozm, tracts_prm_prd, plume
from norms.checker import NormChecker
from norms.norms import SmallPlumeNorm


def register_devices(app_engine: QQmlApplicationEngine):
    app_engine.rootContext().setContextProperty("l807", l807)
    app_engine.rootContext().setContextProperty("agl", agl)
    app_engine.rootContext().setContextProperty("tlf1", tlf1)
    app_engine.rootContext().setContextProperty("klu", klu)
    app_engine.rootContext().setContextProperty("dmd_uzozm", dmd_uzozm)
    app_engine.rootContext().setContextProperty("tracts_prm_prd", tracts_prm_prd)
    app_engine.rootContext().setContextProperty("plume", plume)


if __name__ == '__main__':
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    register_devices(engine)

    current_norm = SmallPlumeNorm()
    checker = NormChecker(current_norm)
    engine.rootContext().setContextProperty("checker", checker)

    start_location_filename = "gui/main.qml"
    engine.load(start_location_filename)

    app.exec()
