import QtQuick

Item{
    id: speedLimitsTestV1
    anchors.fill: parent
    property int speed: 50
    property string title: "Speed Limit Test V1"

    Text {
        id: txtSpeed1
        text: "Speed: "
        x: 500

        Text {
            id: txtSpeed2
            text: "10"
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
        Behavior on x { NumberAnimation {}}
        Behavior on y { NumberAnimation {}}

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
        Behavior on x { NumberAnimation {}}
        Behavior on y { NumberAnimation {}}

        MouseArea{
            id: maSpeedMinus
            anchors.fill: parent
            onClicked: speed = speed - 10
        }

        Text{
            anchors.centerIn: parent
            text: "-"
        }

    }

    Rectangle {
        id: rectLeft
        color: "blue"
        width: 50
        height: 50
        y: 50
        x: 0
        Behavior on x { NumberAnimation {}}
        Behavior on y { NumberAnimation {}}

        MouseArea{
            id: maLeft
            anchors.fill: parent
            onClicked:{
                rectLeft.x  = rectLeft.x - speed
                rectMiddle.x  = rectMiddle.x - speed
                rectRight.x  = rectRight.x - speed
                rectTop.x  = rectTop.x - speed
                rectBottom.x = rectBottom.x - speed
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
        Behavior on x { NumberAnimation {}}
        Behavior on y { NumberAnimation {}}

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
        Behavior on x { NumberAnimation {}}
        Behavior on y { NumberAnimation {}}

        MouseArea{
            id: maRight
            anchors.fill: parent
            onClicked:{
                rectLeft.x  = rectLeft.x + speed
                rectMiddle.x  = rectMiddle.x + speed
                rectRight.x  = rectRight.x + speed
                rectTop.x  = rectTop.x + speed
                rectBottom.x = rectBottom.x + speed
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
        Behavior on x { NumberAnimation {}}
        Behavior on y { NumberAnimation {}}

        MouseArea{
            id: maTop
            anchors.fill: parent
            onClicked:{
                rectLeft.y  = rectLeft.y - speed
                rectMiddle.y  = rectMiddle.y - speed
                rectRight.y  = rectRight.y - speed
                rectTop.y  = rectTop.y - speed
                rectBottom.y = rectBottom.y - speed
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
        Behavior on x { NumberAnimation {}}
        Behavior on y { NumberAnimation {}}

        MouseArea{
            id: maBottom
            anchors.fill: parent
            onClicked:{
                rectLeft.y  = rectLeft.y + speed
                rectMiddle.y  = rectMiddle.y + speed
                rectRight.y  = rectRight.y + speed
                rectTop.y  = rectTop.y + speed
                rectBottom.y = rectBottom.y + speed
            }
        }
    }

    function reset() {
        rectLeft.x  =  0
        rectLeft.y = 50
        rectMiddle.x =  50
        rectMiddle.y  =  50
        rectRight.x  =  100
        rectRight.y  = 50
        rectTop.x  = 50
        rectTop.y  =  0
        rectBottom.x =  50
        rectBottom.y =  100
        speed = 50
    }

    function checkSpeed() {
        if (speed <= 0 ) {
            speed = 10
        }

        txtSpeed2.text = speed ;
    }

    function checkCorner() {
        if (rectLeft.x < 0) {
            reset()
        }
        if (rectTop.y < 0) {
            reset()
        }
        if(rectBottom.y >= root.height) {
            reset()
        }
        if(rectRight.x >= root.width) {
            reset()
        }
    }

    Timer{
        running: true
        repeat: true
        interval: 50
        onTriggered: {
            checkCorner()
            checkSpeed()
        }
    }
}
