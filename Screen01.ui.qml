

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

    StackLayout {
        id: stackLayout
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: nav.top
        anchors.leftMargin: 0
        anchors.topMargin: 0

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
                    text: qsTr("CATEGORIA")
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

        Rectangle {
            id: page2
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

            Text {
                id: titlePage2
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

            Text {
                id: subtitlePage2
                x: 118
                text: qsTr("STATISTICHE")
                color: "#3c9302"
                anchors.top: parent.top
                anchors.topMargin: 109
                font.pixelSize: 30
                font.bold: true
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Text {
                id: _text
                width: 117
                height: 33
                text: qsTr("ENTRATE | €" + totaleEntrate)
                color: "#3c9302"
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 8
                anchors.topMargin: 181
                font.pixelSize: 25
                font.bold: true
            }

            ProgressBar {
                id: progressBarStipendio
                x: 8
                y: 226
                width: 280
                height: 13
                from: 0
                to: 100
                value: parent.percStip
                background: Rectangle {
                    color: "#F3FBED"
                    anchors.fill: progressBarStipendio
                    radius: 4
                }
                contentItem: Rectangle {
                    anchors.left: progressBarStipendio.left
                    anchors.bottom: progressBarStipendio.bottom
                    height: progressBarStipendio.height - 2
                    width: progressBarStipendio.value * parent.width / parent.to
                    color: progressBarStipendio.value === 0.0 ? "#4D8F1A" : Style.appBackgroundColor
                    radius: 4
                }
            }
            property double percStip: ((stipendiTotale / totaleEntrate) * 100).toFixed(
                                          2)
            Text {

                text: "Stipendi: € " + stipendiTotale + "\n(" + parent.percStip + "%)"
                anchors.left: progressBarStipendio.right
                anchors.leftMargin: 10
                anchors.bottom: progressBarStipendio.bottom
            }
            ProgressBar {
                id: progressBarPrestiti
                x: 8
                y: 270
                width: 280
                height: 13
                from: 0
                to: 100
                value: parent.percPres
                background: Rectangle {
                    color: "#F3FBED"
                    anchors.fill: progressBarPrestiti
                    radius: 4
                }
                contentItem: Rectangle {
                    anchors.left: progressBarPrestiti.left
                    anchors.bottom: progressBarPrestiti.bottom
                    height: progressBarPrestiti.height - 2
                    width: progressBarPrestiti.value * parent.width / parent.to
                    color: progressBarPrestiti.value === 0.0 ? "#4D8F1A" : Style.appBackgroundColor
                    radius: 4
                }
            }
            property double percPres: ((prestitiTotale / totaleEntrate) * 100).toFixed(
                                          2)
            Text {
                text: "Prestiti: €" + prestitiTotale + "\n(" + parent.percPres + "%)"
                anchors.left: progressBarPrestiti.right
                anchors.leftMargin: 10
                anchors.bottom: progressBarPrestiti.bottom
            }

            ProgressBar {
                id: progressBarRisparmi
                x: 8
                y: 312
                width: 280
                height: 13
                from: 0
                to: 100
                value: parent.percRisp
                background: Rectangle {
                    color: "#F3FBED"
                    anchors.fill: progressBarRisparmi
                    radius: 4
                }
                contentItem: Rectangle {
                    anchors.left: progressBarRisparmi.left
                    anchors.bottom: progressBarRisparmi.bottom
                    height: progressBarRisparmi.height - 2
                    width: progressBarRisparmi.value * parent.width / parent.to
                    color: progressBarRisparmi.value === 0.0 ? "#4D8F1A" : Style.appBackgroundColor
                    radius: 4
                }
            }
            property double percRisp: ((risparmiTotale / totaleEntrate) * 100).toFixed(
                                          2)
            Text {

                text: "Risparmi: €" + risparmiTotale + "\n(" + parent.percRisp + "%)"
                anchors.left: progressBarRisparmi.right
                anchors.leftMargin: 10
                anchors.bottom: progressBarRisparmi.bottom
            }

            ProgressBar {
                id: progressBarVincite
                x: 8
                y: 354
                width: 280
                height: 13
                from: 0
                to: 100
                value: parent.percVinc
                background: Rectangle {
                    color: "#F3FBED"
                    anchors.fill: progressBarVincite
                    radius: 4
                }
                contentItem: Rectangle {
                    anchors.left: progressBarVincite.left
                    anchors.bottom: progressBarVincite.bottom
                    height: progressBarVincite.height - 2
                    width: progressBarVincite.value * parent.width / parent.to
                    color: progressBarVincite.value === 0.0 ? "#4D8F1A" : Style.appBackgroundColor
                    radius: 4
                }
            }
            property double percVinc: ((vinciteTotale / totaleEntrate) * 100).toFixed(
                                          2)
            Text {

                text: "Vincite: €" + vinciteTotale + "\n(" + parent.percVinc + "%)"
                anchors.left: progressBarVincite.right
                anchors.leftMargin: 10
                anchors.bottom: progressBarVincite.bottom
            }

            Text {
                id: _text3
                x: 8
                y: 181
                width: 117
                height: 33
                text: qsTr("USCITE  | €" + totaleUscite)
                color: "red"
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 8
                anchors.topMargin: 454
                font.pixelSize: 25
                font.bold: true
            }

            ProgressBar {
                id: progressBarCasa
                x: 8
                y: 499
                width: 280
                height: 13
                from: 0
                to: 100
                value: parent.percCasa
                background: Rectangle {
                    color: "#FFA9A9"
                    anchors.fill: progressBarCasa
                    radius: 4
                }
                contentItem: Rectangle {
                    anchors.left: progressBarCasa.left
                    anchors.bottom: progressBarCasa.bottom
                    height: progressBarCasa.height - 2
                    width: progressBarCasa.value * parent.width / parent.to
                    color: progressBarCasa.value === 0.0 ? "#8F1A1A" : Style.appBackgroundColor
                    radius: 4
                }
            }

            property double percCasa: ((casaTotale / totaleUscite) * 100).toFixed(
                                          2)
            Text {
                text: "Affitto/Mutuo: € " + casaTotale + "\n(" + parent.percCasa + "%)"
                anchors.left: progressBarCasa.right
                anchors.leftMargin: 10
                anchors.bottom: progressBarCasa.bottom
            }

            ProgressBar {
                id: progressBarBollette
                x: 8
                y: 543
                width: 280
                height: 13
                from: 0
                to: 100
                value: parent.percBollette
                background: Rectangle {
                    color: "#FFA9A9"
                    anchors.fill: progressBarBollette
                    radius: 4
                }
                contentItem: Rectangle {
                    anchors.left: progressBarBollette.left
                    anchors.bottom: progressBarBollette.bottom
                    height: progressBarBollette.height - 2
                    width: progressBarBollette.value * parent.width / parent.to
                    color: progressBarBollette.value === 0.0 ? "#8F1A1A" : Style.appBackgroundColor
                    radius: 4
                }
            }

            property double percBollette: ((bolletteTotale / totaleUscite) * 100).toFixed(
                                              2)
            Text {
                text: "Bollette: € " + bolletteTotale + "\n(" + parent.percBollette + "%)"
                anchors.left: progressBarBollette.right
                anchors.leftMargin: 10
                anchors.bottom: progressBarBollette.bottom
            }

            ProgressBar {
                id: progressBarSpesa
                x: 8
                y: 585
                width: 280
                height: 13
                from: 0
                to: 100
                value: parent.percSpesa
                background: Rectangle {
                    color: "#FFA9A9"
                    anchors.fill: progressBarSpesa
                    radius: 4
                }
                contentItem: Rectangle {
                    anchors.left: progressBarSpesa.left
                    anchors.bottom: progressBarSpesa.bottom
                    height: progressBarSpesa.height - 2
                    width: progressBarSpesa.value * parent.width / parent.to
                    color: progressBarSpesa.value === 0.0 ? "#8F1A1A" : Style.appBackgroundColor
                    radius: 4
                }
            }

            property double percSpesa: ((spesaTotale / totaleUscite) * 100).toFixed(
                                           2)
            Text {
                text: "Spesa: € " + spesaTotale + "\n(" + parent.percSpesa + "%)"
                anchors.left: progressBarSpesa.right
                anchors.leftMargin: 10
                anchors.bottom: progressBarSpesa.bottom
            }

            ProgressBar {
                id: progressBarBenzina
                x: 8
                y: 627
                width: 280
                height: 13
                from: 0
                to: 100
                value: parent.percBen
                background: Rectangle {
                    color: "#FFA9A9"
                    anchors.fill: progressBarBenzina
                    radius: 4
                }
                contentItem: Rectangle {
                    anchors.left: progressBarBenzina.left
                    anchors.bottom: progressBarBenzina.bottom
                    height: progressBarBenzina.height - 2
                    width: progressBarBenzina.value * parent.width / parent.to
                    color: progressBarBenzina.value === 0.0 ? "#8F1A1A" : Style.appBackgroundColor
                    radius: 4
                }
            }

            property double percBen: ((benzinaTotale / totaleUscite) * 100).toFixed(
                                         2)
            Text {
                text: "Benzina: € " + benzinaTotale + "\n(" + parent.percBen + "%)"
                anchors.left: progressBarBenzina.right
                anchors.leftMargin: 10
                anchors.bottom: progressBarBenzina.bottom
            }

            Rectangle {
                id: comparingBar
                height: 16
                width: 400
                color: "grey"
                anchors.top: progressBarBenzina.bottom
                anchors.topMargin: 90
                anchors.horizontalCenter: parent.horizontalCenter
                radius: 20

                Rectangle {
                    height: 16
                    anchors.left: parent.left
                    color: "#4D8F1A"
                    width: totale > 0 ? (totaleEntrate / totale) * 400 : 0
                    bottomLeftRadius: 20
                    topLeftRadius: 20
                }

                Rectangle {
                    height: 16
                    anchors.right: parent.right
                    color: "#8F1A1A"
                    width: totale > 0 ? (totaleUscite / totale) * 400 : 0
                    bottomRightRadius: 20
                    topRightRadius: 20
                }
            }
            Text {
                text: qsTr("|")
                anchors.bottom: comparingBar.top
                anchors.horizontalCenter: comparingBar.horizontalCenter
            }
            Text {
                text: qsTr("|")
                anchors.top: comparingBar.bottom
                anchors.horizontalCenter: comparingBar.horizontalCenter
            }
            Text {
                text: "ENTRATE"
                anchors.top: comparingBar.bottom
                font.styleName: "Bold"
                anchors.left: comparingBar.left
                color: "#4D8F1A"
            }
            Text {
                text: "USCITE"
                anchors.top: comparingBar.bottom
                font.styleName: "Bold"
                anchors.right: comparingBar.right
                color: "#8F1A1A"
            }
            Text {
                text: "CONFRONTO ENTRATE/USCITE"
                color: "#4D8F1A"
                font.pixelSize: 25
                font.styleName: "Bold"
                anchors.bottom: comparingBar.top
                anchors.bottomMargin: 20
                anchors.horizontalCenter: comparingBar.horizontalCenter
            }
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

