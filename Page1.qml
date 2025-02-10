import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: page1
    color: "#ffffff"
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

    PopUpCategories{
        id: popup
    }

    Text {
        id: titlePage1
        x: 135
        y: 19
        color: "#3c9302"
        text: "MONEY APP"
        font.family: bangers.name
        anchors.topMargin: 45
        font.pixelSize: 70
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }

    SequentialAnimation {
        id: animation
    }

    ColorAnimation {
        id: colorAnimation1
        target: rectangle
        property: "color"
        to: "#2294c6"
        from: Constants.backgroundColor
    }

    ColorAnimation {
        id: colorAnimation2
        target: rectangle
        property: "color"
        to: Constants.backgroundColor
        from: "#2294c6"
    }

    Rectangle {
        id: rectangle2
        x: 25
        y: 168
        width: 180
        height: 180
        color: isEntry ? "#53AA10" : "#B3D897"
        radius: 30
        anchors.left: parent.left
        anchors.leftMargin: 25

        Text {
            id: _text1
            x: 156
            y: 307
            color: "#ffffff"
            text: qsTr("Entrata")
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 25
            anchors.horizontalCenter: parent.horizontalCenter
        }

        MouseArea {
            id: entrateMouseArea
            x: 25
            y: 168
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor
            Connections {
                target: entrateMouseArea
                onClicked: {
                    rectangle.isEntry = true
                }
            }
        }
    }

    Rectangle {
        id: rectangle3
        x: 235
        y: 168
        width: 180
        height: 180
        color: isEntry ? "#eab1af" : "#C30000"
        radius: 30
        anchors.right: parent.right
        anchors.leftMargin: 25
        anchors.rightMargin: 25

        Text {
            id: _text2
            x: -49
            y: 307
            color: "#ffffff"
            text: qsTr("Uscita")
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 25
            anchors.horizontalCenter: parent.horizontalCenter
        }

        MouseArea {
            id: usciteMouseArea
            x: 235
            y: 168
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor
            Connections {
                target: usciteMouseArea
                onClicked: {
                    rectangle.isEntry = false
                }
            }
        }
    }

    Text {
        id: subtitlePage1
        x: 118
        y: 109
        color: "#3c9302"
        text: qsTr("INSERIMENTO")
        font.pixelSize: 30
        font.bold: true
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Rectangle {
        anchors.right: parent.right
        anchors.rightMargin: 25
        anchors.horizontalCenterOffset: 0
        anchors.left: parent.left
        anchors.leftMargin: 25
        radius: 25
        y: 460
        height: 150
        color: "#3c9302"

        TextEdit {
            id: textInput
            anchors.centerIn: parent
            color: "white"
            width: 175
            height: 47
            font.pixelSize: 35
            horizontalAlignment: Text.AlignHCenter
            property string placeholderText: "IMPORTO"

            Connections {
                target: textInput
                onTextChanged: {
                    let regex = /^[0-9]*\.?[0-9]*$/
                    // Consente solo numeri e un punto decimale
                    if (!regex.test(textInput.text)) {
                        textInput.text = textInput.text.replace(
                                    /[^0-9.]/g,
                                    "") // Rimuove caratteri non validi
                        let dotCount = (textInput.text.match(/\./g)
                                        || []).length
                        if (dotCount > 1) {
                            textInput.text = textInput.text.substring(
                                        0,
                                        textInput.text.lastIndexOf("."))
                        }
                    }
                }
            }
        }

        Text {
            text: textInput.placeholderText
            color: "white"
            visible: !textInput.text
            anchors.centerIn: parent
            width: 175
            height: 47
            font.pixelSize: 35
            horizontalAlignment: Text.AlignHCenter
        }
    }

    Button {
        id: buttonAdd
        x: 147
        y: 644
        width: 147
        height: 47
        Text {
            text: "AGGIUNGI"
            anchors.centerIn: parent
            color: "white"
        }
        background: Rectangle {
            color: "#3c9302"
            radius: 25
        }
        font.weight: Font.Bold
        font.pointSize: 20
        Connections {
            target: buttonAdd
            onClicked: {
                console.log("selectedIndex: " + selectedIndex
                            + " TextInput: " + textInput.text)
                if (selectedIndex == "Stipendio") {
                    stipendiTotale = stipendiTotale + parseFloat(
                                textInput.text)
                    textInput.clear()
                } else if (selectedIndex == "Prestiti") {
                    prestitiTotale = prestitiTotale + parseFloat(
                                textInput.text)
                    textInput.clear()
                } else if (selectedIndex == "Risparmi") {
                    risparmiTotale = risparmiTotale + parseFloat(
                                textInput.text)
                    textInput.clear()
                } else if (selectedIndex == "Vincite") {
                    vinciteTotale = vinciteTotale + parseFloat(
                                textInput.text)
                    textInput.clear()
                } else if (selectedIndex == "Affitto/Mutuo") {
                    casaTotale = casaTotale + parseFloat(textInput.text)
                    textInput.clear()
                } else if (selectedIndex == "Bollette") {
                    bolletteTotale = bolletteTotale + parseFloat(
                                textInput.text)
                    textInput.clear()
                } else if (selectedIndex == "Spesa") {
                    spesaTotale = spesaTotale + parseFloat(
                                textInput.text)
                    textInput.clear()
                } else if (selectedIndex == "Benzina") {
                    benzinaTotale = benzinaTotale + parseFloat(
                                textInput.text)
                    textInput.clear()
                }

                totaleEntrate = stipendiTotale + prestitiTotale
                        + risparmiTotale + vinciteTotale
                totaleUscite = casaTotale + bolletteTotale + spesaTotale + benzinaTotale
            }
        }
    }

    Button {
        id: button1
        x: 25
        y: 385
        width: 390
        height: 40
        Text {
            text: qsTr("Categorie")
            color: "white"
            anchors.centerIn: parent
        }
        font.bold: true
        font.pointSize: 26
        background: Rectangle {
            color: "#3c9302"
            radius: 25
        }
        Connections {
            target: button1
            onClicked: popup.open()
        }
    }
}
