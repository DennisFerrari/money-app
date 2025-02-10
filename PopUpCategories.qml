import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Popup {
    id: popup
    width: 300
    height: 200
    modal: true
    focus: true
    anchors.centerIn: parent
    background: Rectangle {
        color: "#ffffff"
        radius: 10
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
    }

    // Variabile per tenere traccia della selezione
    Column {
        id: catColumn
        spacing: 10
        anchors.centerIn: parent
        anchors.fill: parent

        Repeater {
            id: repeater
            anchors.horizontalCenter: parent.horizontalCenter
            model: rectangle.isEntry ? ["Stipendio", "Prestiti", "Risparmi", "Vincite"] : ["Affitto/Mutuo", "Bollette", "Spesa", "Benzina"]
            delegate: Button {
                id: buttons
                width: catColumn.width
                height: 40

                Text {
                    text: modelData
                    color: "white"
                    anchors.centerIn: parent
                }
                background: Rectangle {
                    radius: 20
                    color: "#3c9302"
                    anchors.fill: parent
                }

                Connections {
                    onClicked: {
                        selectedIndex = modelData
                        console.log("Hai premuto: " + modelData
                                    + " (Index: " + model.index + ")")
                        popup.close()
                    }
                }
            }
        }
    }
}
