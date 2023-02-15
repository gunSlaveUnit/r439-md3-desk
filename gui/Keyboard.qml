import QtQuick 2.15
import QtQuick.Layouts 2.15
import QtQuick.Controls 2.15

Item {
    GridLayout {
        id: keyboard_grid
        rows: 6
        columns: 8
        flow: GridLayout.TopToBottom
        anchors.fill: parent

        property var red_color: "#bb534b"
        property var blue_color: "#335e89"

        ButtonMD3 {text: qsTr("ESC")}
        ButtonMD3 {
            text: qsTr("РУС")

            contentItem: Text {
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignTop
                text: parent.text
                font.pointSize: 12
                color: "#000"
            }

            background: Rectangle {
                anchors.fill: parent
                implicitWidth: 72
                implicitHeight: implicitWidth
                radius: 8
                border.color: "#000"
                border.width: 4
                color: keyboard_grid.red_color
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.background.color = Qt.darker(keyboard_grid.red_color, 1.5)
                onExited: parent.background.color = keyboard_grid.red_color
            }
        }
        ButtonMD3 {
            text: qsTr("РУС")

            contentItem: Text {
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignTop
                text: parent.text
                font.pointSize: 12
                color: "#000"
            }

            background: Rectangle {
                anchors.fill: parent
                implicitWidth: 72
                implicitHeight: implicitWidth
                radius: 8
                border.color: "#000"
                border.width: 4
                color: keyboard_grid.blue_color
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.background.color = Qt.darker(keyboard_grid.blue_color, 1.5)
                onExited: parent.background.color = keyboard_grid.blue_color
            }
        }
        ButtonMD3 {
            text: qsTr("ЛАТ")

            contentItem: Text {
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignBottom
                text: parent.text
                font.pointSize: 12
                color: "#000"
            }

            background: Rectangle {
                anchors.fill: parent
                implicitWidth: 72
                implicitHeight: implicitWidth
                radius: 8
                border.color: "#000"
                border.width: 4
                color: keyboard_grid.red_color
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.background.color = Qt.darker(keyboard_grid.red_color, 1.5)
                onExited: parent.background.color = keyboard_grid.red_color
            }
        }
        ButtonMD3 {
            text: qsTr("ЛАТ")

            contentItem: Text {
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignBottom
                text: parent.text
                font.pointSize: 12
                color: "#000"
            }

            background: Rectangle {
                anchors.fill: parent
                implicitWidth: 72
                implicitHeight: implicitWidth
                radius: 8
                border.color: "#000"
                border.width: 4
                color: keyboard_grid.blue_color
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.background.color = Qt.darker(keyboard_grid.blue_color, 1.2)
                onExited: parent.background.color = keyboard_grid.blue_color
            }
        }
        ButtonMD3 {
            text: qsTr("ЦИФ")

            contentItem: Text {
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignTop
                text: parent.text
                font.pointSize: 12
                color: "#000"
            }
        }

        ButtonMD3 {text: qsTr("F1")}
        ButtonMD3 {
            contentItem: GridLayout {
                Text {text: qsTr("А"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 0; Layout.column: 0}
                Text {text: qsTr("Б"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 0; Layout.column: 1}
                Text {text: qsTr("("); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
                Text {text: qsTr("A"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 2; Layout.column: 0}
                Text {text: qsTr("B"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 2; Layout.column: 1}
            }
        }
        ButtonMD3 {
            contentItem: GridLayout {
                Text {text: qsTr("И"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 0; Layout.column: 0}
                Text {text: qsTr("Й"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 0; Layout.column: 1}
                Text {text: qsTr("+"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
                Text {text: qsTr("I"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 2; Layout.column: 0}
                Text {text: qsTr("J"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 2; Layout.column: 1}
            }
        }
        ButtonMD3 {
            contentItem: GridLayout {
                Text {text: qsTr("Р"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 0; Layout.column: 0}
                Text {text: qsTr("С"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 0; Layout.column: 1}
                Text {text: qsTr("/"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
                Text {text: qsTr("Q"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 2; Layout.column: 0}
                Text {text: qsTr("R"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 2; Layout.column: 1}
            }
        }
        ButtonMD3 {
            contentItem: GridLayout {
                Text {text: qsTr("Ш"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 0; Layout.column: 0}
                Text {text: qsTr("Щ"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 0; Layout.column: 1}
                Text {text: qsTr("*"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
                Text {text: qsTr("Y"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 2; Layout.column: 0}
                Text {text: qsTr("Z"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 2; Layout.column: 1}
            }
        }
        ButtonMD3 {
            contentItem: GridLayout {
                Text {text: qsTr(""); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 0; Layout.column: 0}
                Text {text: qsTr("="); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
                Text {text: qsTr("/"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 2; Layout.column: 0}
                Text {text: qsTr("\\"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 2; Layout.column: 1}
            }
        }

        ButtonMD3 {text: qsTr("F2")}
        ButtonMD3 {
            contentItem: GridLayout {
                Text {text: qsTr("В"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 0; Layout.column: 0}
                Text {text: qsTr("Г"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 0; Layout.column: 1}
                Text {text: qsTr(")"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
                Text {text: qsTr("C"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 2; Layout.column: 0}
                Text {text: qsTr("D"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color:  keyboard_grid.blue_color; Layout.row: 2; Layout.column: 1}
            }
        }
        ButtonMD3 {
            contentItem: GridLayout {
                Text {text: qsTr("К"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 0; Layout.column: 0}
                Text {text: qsTr("Л"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 0; Layout.column: 1}
                Text {text: qsTr("7"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
                Text {text: qsTr("K"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 2; Layout.column: 0}
                Text {text: qsTr("L"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 2; Layout.column: 1}
            }
        }
        ButtonMD3 {
            contentItem: GridLayout {
                Text {text: qsTr("Т"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 0; Layout.column: 0}
                Text {text: qsTr("У"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 0; Layout.column: 1}
                Text {text: qsTr("4"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
                Text {text: qsTr("S"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 2; Layout.column: 0}
                Text {text: qsTr("T"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 2; Layout.column: 1}
            }
        }
        ButtonMD3 {
            contentItem: GridLayout {
                Text {text: qsTr("Ъ"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 0; Layout.column: 0}
                Text {text: qsTr("Ы"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 0; Layout.column: 1}
                Text {text: qsTr("1"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
                Text {text: qsTr("("); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 2; Layout.column: 0}
                Text {text: qsTr(")"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 2; Layout.column: 1}
            }
        }
        ButtonMD3 {
            contentItem: GridLayout {
                Text {text: qsTr(""); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 0; Layout.column: 0}
                Text {text: qsTr("0"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
                Text {text: qsTr("@"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 2; Layout.column: 0}
                Text {text: qsTr("*"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 2; Layout.column: 1}
            }
        }

        ButtonMD3 {text: qsTr("F3")}
        ButtonMD3 {
            contentItem: GridLayout {
                Text {text: qsTr("Д"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 0; Layout.column: 0}
                Text {text: qsTr("Е"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 0; Layout.column: 1}
                Text {text: qsTr("<"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
                Text {text: qsTr("E"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 2; Layout.column: 0}
                Text {text: qsTr("F"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 2; Layout.column: 1}
            }
        }
        ButtonMD3 {
            contentItem: GridLayout {
                Text {text: qsTr("М"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 0; Layout.column: 0}
                Text {text: qsTr("Н"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 0; Layout.column: 1}
                Text {text: qsTr("8"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
                Text {text: qsTr("M"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 2; Layout.column: 0}
                Text {text: qsTr("N"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 2; Layout.column: 1}
            }
        }
        ButtonMD3 {
            contentItem: GridLayout {
                Text {text: qsTr("Ф"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 0; Layout.column: 0}
                Text {text: qsTr("Х"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 0; Layout.column: 1}
                Text {text: qsTr("5"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
                Text {text: qsTr("U"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 2; Layout.column: 0}
                Text {text: qsTr("V"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 2; Layout.column: 1}
            }
        }
        ButtonMD3 {
            contentItem: GridLayout {
                Text {text: qsTr("Ь"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 0; Layout.column: 0}
                Text {text: qsTr("Э"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 0; Layout.column: 1}
                Text {text: qsTr("2"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
                Text {text: qsTr("!"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 2; Layout.column: 0}
                Text {text: qsTr("?"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 2; Layout.column: 1}
            }
        }
        ButtonMD3 {
            contentItem: GridLayout {
                Text {text: qsTr(""); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 0; Layout.column: 0}
                Text {text: qsTr(","); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
                Text {text: qsTr("\""); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 2; Layout.column: 0}
                Text {text: qsTr("\""); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 2; Layout.column: 1}
            }
        }

        ButtonMD3 {text: qsTr("F4")}
        ButtonMD3 {
            contentItem: GridLayout {
                Text {text: qsTr("Ж"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 0; Layout.column: 0}
                Text {text: qsTr("З"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 0; Layout.column: 1}
                Text {text: qsTr(">"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
                Text {text: qsTr("G"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 2; Layout.column: 0}
                Text {text: qsTr("H"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 2; Layout.column: 1}
            }
        }
        ButtonMD3 {
            contentItem: GridLayout {
                Text {text: qsTr("О"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 0; Layout.column: 0}
                Text {text: qsTr("П"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 0; Layout.column: 1}
                Text {text: qsTr("9"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
                Text {text: qsTr("O"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 2; Layout.column: 0}
                Text {text: qsTr("P"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 2; Layout.column: 1}
            }
        }
        ButtonMD3 {
            contentItem: GridLayout {
                Text {text: qsTr("Ц"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 0; Layout.column: 0}
                Text {text: qsTr("Ч"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 0; Layout.column: 1}
                Text {text: qsTr("6"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
                Text {text: qsTr("W"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 2; Layout.column: 0}
                Text {text: qsTr("X"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 2; Layout.column: 1}
            }
        }
        ButtonMD3 {
            contentItem: GridLayout {
                Text {text: qsTr(":"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 0; Layout.column: 1}
                Text {text: qsTr("-"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: "#000"; Layout.row: 1; Layout.column: 0; Layout.columnSpan: 2}
                Text {text: qsTr("%"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.red_color; Layout.row: 2; Layout.column: 0}
                Text {text: qsTr("&"); font.pointSize: 12; Layout.alignment: Qt.AlignCenter; color: keyboard_grid.blue_color; Layout.row: 2; Layout.column: 1}
            }
        }

        ButtonMD3 {
            Image {
                anchors.fill: parent
                anchors.margins: 16
                source: "../resources/clockwise.png"
                mipmap: true
            }
            Layout.row: 1; 
            Layout.column: 5
        }
        ButtonMD3 {text: qsTr("BS")}

        ButtonMD3 {
            Image {
                anchors.fill: parent
                anchors.margins: 20
                source: "../resources/left_arrow.png"
                mipmap: true
            }
        }

        ButtonMD3 {text: qsTr("SPACE")}
        ButtonMD3 {
            text: qsTr("ENTER");
            Layout.row: 5;
            Layout.column: 5;
            Layout.columnSpan: 2;
            Layout.fillWidth: true

            contentItem: Text {
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                text: parent.text
                font.pointSize: 12
                color: "#000"
            }

            background: Rectangle {
                anchors.fill: parent
                implicitWidth: 72
                implicitHeight: implicitWidth
                radius: 8
                border.color: "#000"
                border.width: 4
                color: "#b4afac"

                Column {
                    anchors.centerIn: parent
                    spacing: 10
                    Repeater {
                        model: 3
                        Rectangle {width: 2; height: 10; color: "#000"}
                    }
                }
            }
        }

        ButtonMD3 {text: qsTr("Page\nUp"); Layout.row: 1; Layout.column: 6}
        ButtonMD3 {text: qsTr("Page\nDown")}
        ButtonMD3 {
            Image {
                anchors.fill: parent
                anchors.margins: 20
                source: "../resources/up_arrow.png"
                mipmap: true
            }
        }
        ButtonMD3 {
            Image {
                anchors.fill: parent
                anchors.margins: 20
                source: "../resources/down_arrow.png"
                mipmap: true
            }
        }

        ButtonMD3 {
            Image {
                anchors.fill: parent
                anchors.margins: 12
                source: "../resources/up_triangle.png"
                mipmap: true
            }
        }
        ButtonMD3 {
            Image {
                anchors.fill: parent
                anchors.margins: 16
                source: "../resources/unclockwise.png"
                mipmap: true
            }
        }
        ButtonMD3 {text: qsTr("DEL")}
        ButtonMD3 {
            Image {
                anchors.fill: parent
                anchors.margins: 20
                source: "../resources/right_arrow.png"
                mipmap: true
            }
        }
        ButtonMD3 {
            text: qsTr("ENTER");
            Layout.row: 4;
            Layout.column: 7;
            Layout.rowSpan: 2;
            Layout.fillHeight: true

            contentItem: Text {
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignTop
                text: parent.text
                font.pointSize: 12
                color: "#000"
            }

            background: Rectangle {
                anchors.fill: parent
                implicitWidth: 72
                implicitHeight: implicitWidth
                radius: 8
                border.color: "#000"
                border.width: 4
                color: "#b4afac"

                Row {
                    anchors.centerIn: parent
                    spacing: 10
                    Repeater {
                        model: 3
                        Rectangle {width: 10; height: 2; color: "#000"}
                    }
                }
            }
        }
    }
}