import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import "./custom"

Window {
    id: authWindow

    property int defaultMargin: 8
    property int doubleDefaultMargin: 2 * defaultMargin

    minimumWidth: authWindowLayout.implicitWidth + doubleDefaultMargin
    minimumHeight: authWindowLayout.implicitHeight + doubleDefaultMargin
    width: minimumWidth
    height: minimumHeight
    maximumWidth: minimumWidth
    maximumHeight: minimumHeight
    visible: true
    title: qsTr("Р439-МД3 Вход")

    // TODO: Should the auth window ideally close after the main window closes?
    Connections {
        target: mainWindow

        function onClosing() {
            authWindow.show()
        }
    }

    StackLayout {
        id: authWindowLayout

        property int signInPageIndex: 0
        property int signUpPageIndex: 1

        anchors.centerIn: parent

        /*
        *   Sign in page
        */
        ColumnLayout {
            GridLayout {
                rows: 3
                columns: 2

                Text {Layout.alignment: Qt.AlignRight; text: qsTr("ФИО")}
                TextField {
                    id: fullNameField
                    focus: true
                    Layout.fillWidth: true
                }

                Text {Layout.alignment: Qt.AlignRight; text: qsTr("Курс")}
                TextField {Layout.fillWidth: true}

                Text {Layout.alignment: Qt.AlignRight; text: qsTr("Взвод")}
                TextField {Layout.fillWidth: true}
            }

            RowLayout {
                Layout.alignment: Qt.AlignHCenter

                Button {
                    text: "Войти"
                    onClicked: {
                        mainWindow.show()
                        authWindow.hide()
                    }
                }

                Button {
                    text: "Отмена"
                    onClicked: {
                        authWindow.close()
                    }
                }
            }

            Separator {}

            GridLayout {
                rows: 1
                columns: 2

                Text {text: qsTr("Еще нет аккаунта?")}
                Button {
                    text: "Создать новый аккаунт"
                    onClicked: authWindowLayout.currentIndex = authWindowLayout.signUpPageIndex
                }
            }
        }

        /*
        *   Sign up page
        */
        ColumnLayout {
            GridLayout {

            }

            Separator {}

            GridLayout {

            }
        }
    }

    Main {id: mainWindow}
}