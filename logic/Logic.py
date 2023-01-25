from PySide6.QtQml import QQmlApplicationEngine

from logic.AGL import AGL
from logic.L807 import L807


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

        self._register_logics()

    def _register_logics(self):
        self._engine.rootContext().setContextProperty("l807", self._l807)
        self._engine.rootContext().setContextProperty("agl", self._agl)
