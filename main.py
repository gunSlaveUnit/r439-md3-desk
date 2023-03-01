import sys

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

from logic.AGL import AGL
from logic.L807 import L807


def main():
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    l807 = L807()
    engine.rootContext().setContextProperty("l807", l807)

    agl = AGL()
    engine.rootContext().setContextProperty("agl", agl)

    start_location_filename = "gui/main.qml"
    engine.load(start_location_filename)

    app.exec()


if __name__ == '__main__':
    main()
