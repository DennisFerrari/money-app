

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: rectangle
    width: 440
    height: 956
    gradient: Gradient {
        GradientStop {
            position: 0
            color: "#d4fc79"
        }

        GradientStop {
            position: 1
            color: "#96e6a1"
        }
        orientation: Gradient.Vertical
    }

    property bool isEntry: true
    property string selectedIndex
    property double entrateTotale: 0
    property double prestitiTotale: 0
    property double stipendiTotale: 0
    property double risparmiTotale: 0
    property double vinciteTotale: 0
    property double benzinaTotale: 0
    property double casaTotale: 0
    property double bolletteTotale: 0
    property double spesaTotale: 0

    property double totaleEntrate: 0
    property double totaleUscite: 0
    property double totale: totaleEntrate + totaleUscite

    FontLoader {
        id: bangers
        source: "fonts/Bangers-Regular.ttf"
    }

    StackLayout {
        id: stackLayout
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: nav.top
        anchors.leftMargin: 0
        anchors.topMargin: 0

        Page1{

        }

        Page2{

        }


    }

    Rectangle {
        id: nav
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: navigation.height * 3
        color: "#3c9302"
        topRightRadius: 20
        topLeftRadius: 20
        RowLayout {
            id: navigation
            anchors.centerIn: parent
            spacing: 140
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                text: qsTr("Inserimento")
                color: stackLayout.currentIndex === 0 ? "#ffffff" : "#cccccc"
                font.bold: true
                font.pixelSize: 20

                MouseArea {
                    anchors.fill: parent
                    onClicked: stackLayout.currentIndex = 0 // Cambia alla pagina Inserimento
                }
            }

            Text {
                text: qsTr("Statistiche")
                color: stackLayout.currentIndex === 1 ? "#ffffff" : "#cccccc"
                font.bold: true
                font.pixelSize: 20

                MouseArea {
                    anchors.fill: parent
                    onClicked: stackLayout.currentIndex = 1 // Cambia alla pagina Statistiche
                }
            }
        }
    }
}

