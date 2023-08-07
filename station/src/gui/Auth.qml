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

        /*
        *   Sign in page
        */
        ColumnLayout {
            Button {
                text: "Try";
                onClicked: {
                    mainWindow.show()
                    authWindow.hide()
                }
            }

            GridLayout {

            }

            Separator {}

            GridLayout {

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