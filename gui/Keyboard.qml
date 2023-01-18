import QtQuick 2.15
import QtQuick.Layouts 2.15
import QtQuick.Controls 2.15

Item {
    GridLayout {
        rows: 6
        columns: 8
        flow: GridLayout.TopToBottom
        anchors.fill: parent

        ButtonMD3 {text: qsTr("ESC")}
        ButtonMD3 {text: qsTr("РУС")}
        ButtonMD3 {text: qsTr("РУС")}
        ButtonMD3 {text: qsTr("ЛАТ")}
        ButtonMD3 {text: qsTr("ЛАТ")}
        ButtonMD3 {text: qsTr("ЦИФ")}

        ButtonMD3 {text: qsTr("F1")}
        ButtonMD3 {text: qsTr("(")}
        ButtonMD3 {text: qsTr("+")}
        ButtonMD3 {text: qsTr("/")}
        ButtonMD3 {text: qsTr("*")}
        ButtonMD3 {text: qsTr("=")}

        ButtonMD3 {text: qsTr("F2")}
        ButtonMD3 {text: qsTr(")")}
        ButtonMD3 {text: qsTr("7")}
        ButtonMD3 {text: qsTr("4")}
        ButtonMD3 {text: qsTr("1")}
        ButtonMD3 {text: qsTr("0")}

        ButtonMD3 {text: qsTr("F3")}
        ButtonMD3 {text: qsTr("<")}
        ButtonMD3 {text: qsTr("8")}
        ButtonMD3 {text: qsTr("5")}
        ButtonMD3 {text: qsTr("2")}
        ButtonMD3 {text: qsTr(",")}

        ButtonMD3 {text: qsTr("F4")}
        ButtonMD3 {text: qsTr(">")}
        ButtonMD3 {text: qsTr("9")}
        ButtonMD3 {text: qsTr("6")}
        ButtonMD3 {text: qsTr("3")}
        ButtonMD3 {text: qsTr("-")}

        ButtonMD3 {text: qsTr("<-->"); Layout.row: 1; Layout.column: 5}
        ButtonMD3 {text: qsTr("BS")}
        ButtonMD3 {text: qsTr("<")}
        ButtonMD3 {text: qsTr("SPACE")}
        ButtonMD3 {text: qsTr("ENTER"); Layout.row: 5; Layout.column: 5; Layout.columnSpan: 2; Layout.fillWidth: true}

        ButtonMD3 {text: qsTr("PageUp"); Layout.row: 1; Layout.column: 6}
        ButtonMD3 {text: qsTr("PageDown")}
        ButtonMD3 {text: qsTr("^")}
        ButtonMD3 {text: qsTr("!^")}

        ButtonMD3 {text: qsTr("^")}
        ButtonMD3 {text: qsTr("-><-")}
        ButtonMD3 {text: qsTr("DEL")}
        ButtonMD3 {text: qsTr(">")}
        ButtonMD3 {text: qsTr("ENTER"); Layout.row: 4; Layout.column: 7; Layout.rowSpan: 2; Layout.fillHeight: true}
    }
}