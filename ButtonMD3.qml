import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

Button {
    Layout.fillWidth: true
    Layout.fillHeight: true
    Layout.maximumHeight: font.pointSize * 8

    font.pointSize: main_window.width / 100 + main_window.height / 100
}