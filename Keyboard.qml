import QtQuick 2.15
import QtQuick.Layouts 2.15
import QtQuick.Controls 2.15

Item {
    GridLayout {
        rows: 6
        columns: 8
        flow: GridLayout.TopToBottom

        Button {text: qsTr("ESC")}
        Button {text: qsTr("РУС")}
        Button {text: qsTr("РУС")}
        Button {text: qsTr("ЛАТ")}
        Button {text: qsTr("ЛАТ")}
        Button {text: qsTr("ЦИФ")}

        Button {text: qsTr("F1")}
        Button {text: qsTr("(")}
        Button {text: qsTr("+")}
        Button {text: qsTr("/")}
        Button {text: qsTr("*")}
        Button {text: qsTr("=")}

        Button {text: qsTr("F2")}
        Button {text: qsTr(")")}
        Button {text: qsTr("7")}
        Button {text: qsTr("4")}
        Button {text: qsTr("1")}
        Button {text: qsTr("0")}

        Button {text: qsTr("F3")}
        Button {text: qsTr("<")}
        Button {text: qsTr("8")}
        Button {text: qsTr("5")}
        Button {text: qsTr("2")}
        Button {text: qsTr(",")}

        Button {text: qsTr("F4")}
        Button {text: qsTr(">")}
        Button {text: qsTr("9")}
        Button {text: qsTr("6")}
        Button {text: qsTr("3")}
        Button {text: qsTr("-")}

        Button {text: qsTr("<-->"); Layout.row: 1; Layout.column: 5}
        Button {text: qsTr("BS")}
        Button {text: qsTr("<")}
        Button {text: qsTr("SPACE")}
        Button {text: qsTr("ENTER"); Layout.row: 5; Layout.column: 5; Layout.columnSpan: 2; Layout.fillWidth: true}

        Button {text: qsTr("PageUp"); Layout.row: 1; Layout.column: 6}
        Button {text: qsTr("PageDown")}
        Button {text: qsTr("^")}
        Button {text: qsTr("!^")}

        Button {text: qsTr("^")}
        Button {text: qsTr("-><-")}
        Button {text: qsTr("DEL")}
        Button {text: qsTr(">")}
        Button {text: qsTr("ENTER"); Layout.row: 4; Layout.column: 7; Layout.rowSpan: 2; Layout.fillHeight: true}
    }
}