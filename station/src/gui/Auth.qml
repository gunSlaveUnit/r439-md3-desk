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

        // TODO: reset form in this function
        function onClosing() {
            authWindowLayout.currentIndex = authWindowLayout.signInPageIndex
            signInAccountNameField.focus = true

            authWindow.show()
        }
    }

    StackLayout {
        id: authWindowLayout

        property int signInPageIndex: 0
        property int signUpPageIndex: 1

        anchors.fill: parent
        anchors.margins: defaultMargin

        /*
        *   Sign in page
        */
        ColumnLayout {
            anchors.centerIn: parent

            GridLayout {
                rows: 2
                columns: 2

                Text {Layout.alignment: Qt.AlignRight; text: qsTr("Имя аккаунта")}
                TextField {id: signInAccountNameField; focus: true; Layout.fillWidth: true}

                Text {Layout.alignment: Qt.AlignRight; text: qsTr("Пароль")}
                TextField {Layout.fillWidth: true; echoMode: TextInput.Password}
            }

            RowLayout {
                Button {
                    Layout.fillWidth: true
                    text: qsTr("Войти")
                    onClicked: {
                        mainWindow.show()
                        authWindow.hide()
                    }
                }

                Button {
                    Layout.fillWidth: true
                    text: qsTr("Отмена")
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
                    Layout.fillWidth: true
                    text: qsTr("Создать новый аккаунт")
                    // TODO: also reset forms when navigates from sign in to sign up forms
                    onClicked: {
                        authWindowLayout.currentIndex = authWindowLayout.signUpPageIndex
                        fullNameField.focus = true
                    }
                }
            }
        }

        /*
        *   Sign up page
        */
        ColumnLayout {
            anchors.centerIn: parent

            GridLayout {
                rows: 5
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

                Text {Layout.alignment: Qt.AlignRight; text: qsTr("Имя аккаунта")}
                TextField {Layout.fillWidth: true}

                Text {Layout.alignment: Qt.AlignRight; text: qsTr("Пароль")}
                TextField {Layout.fillWidth: true; echoMode: TextInput.Password}
            }

            RowLayout {
                Button {
                    Layout.fillWidth: true
                    text: qsTr("Создать")
                    onClicked: {
                        mainWindow.show()
                        authWindow.hide()
                    }
                }

                Button {
                    Layout.fillWidth: true
                    text: qsTr("Отмена")
                    onClicked: {
                        authWindow.close()
                    }
                }
            }

            Separator {}

            GridLayout {
                rows: 1
                columns: 2

                Text {text: qsTr("Уже есть аккаунт?")}
                Button {
                    text: qsTr("Войти в существующий аккаунт")
                    onClicked: {
                        authWindowLayout.currentIndex = authWindowLayout.signInPageIndex
                        signInAccountNameField.focus = true
                    }
                }
            }
        }
    }

    Main {id: mainWindow}
}