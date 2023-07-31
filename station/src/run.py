import sys

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

from devices import l807, agl, tlf1, klu, dmd_uzozm, tracts_prm_prd, plume
from logic.configuration import Configuration
from norms.checker import NormChecker
from norms.free_mode.components import FreeModeComponent
from norms.free_mode.free_mode import FreeMode
from norms.small_plume.components import L807SmallPlumeComponent, AGLSmallPlumeComponent, TLF1SmallPlumeComponent, \
    KLUSmallPlumeComponent, DMDUZOZMSmallPlumeComponent, TractsPRMPRDSmallPlumeComponent, PlumeSmallPlumeComponent
from norms.small_plume.small_plume import SmallPlumeNorm

from settings import GUI_LAYOUTS_PATH


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

    free_mode = FreeMode([FreeModeComponent()])
    engine.rootContext().setContextProperty("free_mode", free_mode)

    small_plume_norm = SmallPlumeNorm(
        [
            L807SmallPlumeComponent(l807),
            AGLSmallPlumeComponent(agl),
            TLF1SmallPlumeComponent(tlf1),
            KLUSmallPlumeComponent(klu),
            DMDUZOZMSmallPlumeComponent(dmd_uzozm),
            TractsPRMPRDSmallPlumeComponent(tracts_prm_prd),
            PlumeSmallPlumeComponent(plume)
        ]
    )
    engine.rootContext().setContextProperty("small_plume_norm", small_plume_norm)

    checker = NormChecker()
    engine.rootContext().setContextProperty("checker", checker)

    configuration = Configuration()
    engine.rootContext().setContextProperty("configuration", configuration)

    start_location_filename = GUI_LAYOUTS_PATH / 'main.qml'
    engine.load(start_location_filename)

    app.exec()
