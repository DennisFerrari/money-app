import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

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
