import sys

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

from logic.Logic import Logic


def main():
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    start_location_filename = "gui/main.qml"
    engine.load(start_location_filename)

    logic = Logic(engine)

    app.exec()


if __name__ == '__main__':
    main()
