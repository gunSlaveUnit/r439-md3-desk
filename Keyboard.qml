import QtQuick 2.15
import QtQuick.Layouts 2.15
import QtQuick.Controls 2.15

Item {
    GridLayout {
        rows: 6
        columns: 8
        flow: GridLayout.TopToBottom
        anchors.fill: parent

        StretchedButton {text: qsTr("ESC")}
        StretchedButton {text: qsTr("РУС")}
        StretchedButton {text: qsTr("РУС")}
        StretchedButton {text: qsTr("ЛАТ")}
        StretchedButton {text: qsTr("ЛАТ")}
        StretchedButton {text: qsTr("ЦИФ")}

        StretchedButton {text: qsTr("F1")}
        StretchedButton {text: qsTr("(")}
        StretchedButton {text: qsTr("+")}
        StretchedButton {text: qsTr("/")}
        StretchedButton {text: qsTr("*")}
        StretchedButton {text: qsTr("=")}

        StretchedButton {text: qsTr("F2")}
        StretchedButton {text: qsTr(")")}
        StretchedButton {text: qsTr("7")}
        StretchedButton {text: qsTr("4")}
        StretchedButton {text: qsTr("1")}
        StretchedButton {text: qsTr("0")}

        StretchedButton {text: qsTr("F3")}
        StretchedButton {text: qsTr("<")}
        StretchedButton {text: qsTr("8")}
        StretchedButton {text: qsTr("5")}
        StretchedButton {text: qsTr("2")}
        StretchedButton {text: qsTr(",")}

        StretchedButton {text: qsTr("F4")}
        StretchedButton {text: qsTr(">")}
        StretchedButton {text: qsTr("9")}
        StretchedButton {text: qsTr("6")}
        StretchedButton {text: qsTr("3")}
        StretchedButton {text: qsTr("-")}

        StretchedButton {text: qsTr("<-->"); Layout.row: 1; Layout.column: 5}
        StretchedButton {text: qsTr("BS")}
        StretchedButton {text: qsTr("<")}
        StretchedButton {text: qsTr("SPACE")}
        StretchedButton {text: qsTr("ENTER"); Layout.row: 5; Layout.column: 5; Layout.columnSpan: 2; Layout.fillWidth: true}

        StretchedButton {text: qsTr("PageUp"); Layout.row: 1; Layout.column: 6}
        StretchedButton {text: qsTr("PageDown")}
        StretchedButton {text: qsTr("^")}
        StretchedButton {text: qsTr("!^")}

        StretchedButton {text: qsTr("^")}
        StretchedButton {text: qsTr("-><-")}
        StretchedButton {text: qsTr("DEL")}
        StretchedButton {text: qsTr(">")}
        StretchedButton {text: qsTr("ENTER"); Layout.row: 4; Layout.column: 7; Layout.rowSpan: 2; Layout.fillHeight: true}
    }
}