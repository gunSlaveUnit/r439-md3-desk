import sys

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine


def main():
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    start_location_filename = "Window.qml"
    engine.load(start_location_filename)

    app.exec()


if __name__ == '__main__':
    main()
