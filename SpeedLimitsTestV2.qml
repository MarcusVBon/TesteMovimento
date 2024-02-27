
import QtQuick

Rectangle{
    id: speedLimitsTestV2
    anchors.fill: parent
    property int speed: 50
    property string title: "Speed Limit Test V2"
    color: "gray"

    Text {
        id: txtSpeed1
        text: "Speed: "
        x: 500

        Text {
            id: txtSpeed2
            text: speed
            x: 0
            y: 20
        }
    }

    Rectangle {
        id: rectSpeedPlus
        color: "green"
        width: 25
        height: 50
        border.color: "black"
        border.width: 2
        y: 0
        x: 0
        scale: maSpeedplus.pressed ? 0.9 : 1
        MouseArea{
            id: maSpeedplus
            anchors.fill: parent
            onClicked: speed = speed + 10
        }

        Text{
            anchors.centerIn: parent
            text: "+"
        }
    }

    Rectangle {
        id: rectSpeedMinus
        color: "red"
        width: 25
        height: 50
        border.color: "black"
        border.width: 2
        y: 0
        x: 25
        scale: maSpeedMinus.pressed ? 0.9 : 1

        MouseArea{
            id: maSpeedMinus
            anchors.fill: parent
            onClicked: speed += speed >= 10 ? - 10 : 0
        }

        Text{
            anchors.centerIn: parent
            text: "-"
        }

    }

    Item{
        id: rectContainer
        width: 150
        height: 150
        onXChanged: checkBoundaries()
        onYChanged: checkBoundaries()
        Behavior on x { NumberAnimation {}}
        Behavior on y { NumberAnimation {}}

        Rectangle {
            id: rectLeft
            color: "blue"
            width: 50
            height: 50
            y: 50
            x: 0
            opacity: maLeft.enabled ? 1 : 0.5

            MouseArea{
                id: maLeft
                enabled: rectContainer.x > 0
                anchors.fill: parent
                onClicked:{
                    rectContainer.x  = rectContainer.x - speed
                }
            }
        }


        Rectangle {
            id: rectMiddle
            color: "blue"
            width: 50
            height: 50
            y: 50
            x: 50

            MouseArea{
                id: maMiddle
                anchors.fill: parent
                onClicked: reset()
            }

        }

        Rectangle {
            id: rectRight
            color: "blue"
            width: 50
            height: 50
            y: 50
            x: 100

            MouseArea{
                id: maRight
                anchors.fill: parent
                onClicked:{
                    rectContainer.x  = rectContainer.x + speed
                }
            }

        }

        Rectangle {
            id: rectTop
            color: "blue"
            width: 50
            height: 50
            y: 0
            x: 50
            opacity: maTop.enabled ? 1 : 0.5

            MouseArea{
                id: maTop
                enabled: rectContainer.y > 0
                anchors.fill: parent
                onClicked:{
                    rectContainer.y  = rectContainer.y - speed
                }
            }
        }

        Rectangle {
            id: rectBottom
            color: "blue"
            width: 50
            height: 50
            y: 100
            x: 50

            MouseArea{
                id: maBottom
                anchors.fill: parent
                onClicked:{
                    rectContainer.y  = rectContainer.y + speed
                }
            }
        }
    }


    function reset() {
        rectContainer.x  =  0
        rectContainer.y = 0
        speed = 50
    }

    function checkBoundaries() {
        if (rectContainer.x < 0) {
            rectContainer.x = 0
        }
        if (rectContainer.y < 0) {
            rectContainer.y = 0
        }
        if(rectContainer.y+rectContainer.height >= root.height) {
            rectContainer.y = root.height- rectContainer.height
        }
        if(rectContainer.x+rectContainer.width >= root.width) {
            rectContainer.x = root.width- rectContainer.width
        }
    }
}
