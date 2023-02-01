from PySide6.QtQml import QQmlApplicationEngine

from logic.AGL import AGL
from logic.DMDUZOZM import DMDUZOZM
from logic.KLU import KLU
from logic.L807 import L807
from logic.TLF1 import TLF1


class Logic:
    """Class to contain working modes and devices, to register it to QML components"""
    def __init__(self, engine: QQmlApplicationEngine):
        """
        Inits a station logic
        :param engine: needs to register some other logics / devices for gui layouts
        """
        self._engine = engine

        self._l807 = L807()
        self._agl = AGL()
        self._tlf1 = TLF1()
        self._klu = KLU()
        self._dmd_uzozm = DMDUZOZM()

        self._register_logics()

    def _register_logics(self):
        self._engine.rootContext().setContextProperty("l807", self._l807)
        self._engine.rootContext().setContextProperty("agl", self._agl)
        self._engine.rootContext().setContextProperty("tlf1", self._tlf1)
        self._engine.rootContext().setContextProperty("klu", self._klu)
        self._engine.rootContext().setContextProperty("dmd_uzozm", self._dmd_uzozm)
