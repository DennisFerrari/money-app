import QtQuick
import QtQuick.Controls

Rectangle {
    id: authPage
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
        text: qsTr("LOG-IN")
        color: "#3c9302"
        anchors.top: parent.top
        anchors.topMargin: 109
        font.pixelSize: 30
        font.bold: true
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Text {
        id: userLabel
        anchors.top: subtitlePage2.bottom
        anchors.topMargin: 30
        anchors.horizontalCenter: parent.horizontalCenter
        text: "USERNAME"
    }

    TextField {
        id: userCamp
        anchors.top: userLabel.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        width: 200
        color: "Black"
        background: Rectangle {
            color: "white"
            anchors.fill: parent
        }
    }

    Text {
        id: pswLabel
        anchors.top: userCamp.bottom
        anchors.topMargin: 30
        anchors.horizontalCenter: parent.horizontalCenter
        text: "PASSWORD"
    }

    TextField {
        id: pswCamp
        anchors.top: pswLabel.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        width: 200
        color: "Black"
        background: Rectangle {
            color: "white"
            anchors.fill: parent
        }
    }

    Button {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: pswCamp.bottom
        anchors.topMargin: 30
        height: 15
        width: 100
        Text {
            text: "ACCEDI"
            anchors.centerIn: parent
        }
        background: Rectangle{
            color: "white"
            anchors.fill: parent
            radius: 20
        }
    }
}
