import QtQuick
import QtQuick.Controls

Rectangle {
    id: page3
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
        id: titlePage3
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
        id: subtitlePage3
        x: 118
        text: qsTr("BUDGETS")
        color: "#3c9302"
        anchors.top: parent.top
        anchors.topMargin: 109
        font.pixelSize: 30
        font.bold: true
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Text {
        id: label1
        anchors.top: subtitlePage3.bottom
        anchors.topMargin: 20
        text: "BUDGET SPESA MENSILE: "
        anchors.leftMargin: 8
        font.pixelSize: 25
        font.bold: true
        anchors.left: parent.left
    }

    Slider {
        id: budgetId
        from: 0
        value: 0
        to: 2000
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.leftMargin: 20
        anchors.left: parent.left
        anchors.top: label1.bottom
        anchors.topMargin: 20
        background: Rectangle{
            height: 20
            width: parent.width
            color: "Green"
            radius: 20
        }

        handle: Rectangle {
               x: budgetId.leftPadding + budgetId.visualPosition * (budgetId.availableWidth - width)
               y: (budgetId.height - height) / 2
               implicitWidth: 20
               implicitHeight: 20
               radius: 20
               color: budgetId.pressed ? "#f0f0f0" : "#f6f6f6"
               border.color: "#bdbebf"
           }
    }

    Text {
        text: budgetId.from
        anchors.left: budgetId.left
        anchors.bottom: budgetId.top
        anchors.topMargin: 3
    }

    Text {
        text: budgetId.to
        anchors.right: budgetId.right
        anchors.bottom: budgetId.top
        anchors.topMargin: 3
    }

    Text {
        id: labelValue
        text: budgetId.value.toFixed(0)
        anchors.horizontalCenter: budgetId.horizontalCenter
        anchors.top: budgetId.bottom
        anchors.topMargin: 20
    }

    Button{
        id: setBudgetButton
        width: 100
        height: 30
        anchors.top: labelValue.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 15
        background: Rectangle{
            color: "Green"
            radius: 10
        }

        Text{
            text: "IMPOSTA"
            color: "white"
            anchors.centerIn: parent
        }

        onClicked :{
            budgetMensile = budgetId.value.toFixed(0)
            console.log(budgetMensile)
        }
    }

    Text{
        id: labelBudgetResiduo
        anchors.top: setBudgetButton.bottom
        anchors.topMargin: 30
        text: "BUDGET RESIDUO   | €" + (budgetMensile - totaleUscite)
        color: (budgetMensile-totaleUscite) > 0 ? "#4D8F1A" : "red"
        anchors.left: parent.left
        anchors.leftMargin: 8
        font.pixelSize: 25
        font.bold: true
    }

    Text{
        anchors.top: labelBudgetResiduo.bottom
        anchors.topMargin: 30
        text: "BUDGET IMPOSTATO   | €" + budgetMensile
        color: "#4D8F1A"
        anchors.left: parent.left
        anchors.leftMargin: 8
        font.pixelSize: 25
        font.bold: true
    }

}
