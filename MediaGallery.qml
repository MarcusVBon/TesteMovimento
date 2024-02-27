
import QtQuick
import QtQuick.Controls

Rectangle{
    id: mediaGallery
    anchors.fill: parent
    property string title: "Media Gallery"
    color: "lightgray"
    property int maxZ: 0
    property var media: ["file:///C:/Users/estagiario/Documents/test_1/media/lanscape.jfif", "file:///C:/Users/estagiario/Documents/test_1/media/furret.jfif", "file:///C:/Users/estagiario/Documents/test_1/media/Arti.jfif"]

    function randomIntFromInterval(min, max) { // min and max included
      return Math.floor(Math.random() * (max - min + 1) + min)
    }

    Repeater {
        model: media
        id: repeater


        delegate: Image {
            id: images
            source: modelData
            fillMode: Image.PreserveAspectFit
            width: 200
            height: 100

            rotation: randomIntFromInterval(-30 , 30)
            Behavior on x { NumberAnimation {duration: 500}}
            Behavior on y { NumberAnimation {duration: 500}}

            Component.onCompleted:{
                x = randomIntFromInterval(0, mediaGallery.width - width)
                y = randomIntFromInterval(0, mediaGallery.height - height)
                z = maxZ
                maxZ++
            }

            MouseArea{
                id: dragImage
                onPressed: {
                    parent.z = parent.z + 20
                }

                onReleased:{
                    parent.z = maxZ
                    maxZ++
                }

                onWheel:{
                    if (wheel.angleDelta.y >= 0) {
                        parent.scale += parent.scale * 0.1
                        parent.scale = parent.scale > 2 ? 2 : parent.scale
                    } else {
                        parent.scale -= parent.scale * 0.1
                        parent.scale = parent.scale < 0.2 ? 0.2 : parent.scale
                    }
                }

                anchors.fill: parent
                drag.target: images
                drag.minimumX: 0
                drag.maximumX: mediaGallery.width - images.width
                drag.minimumY: 0
                drag.maximumY: mediaGallery.height - images.height

            }
        }
    }

    Button {
        id: resetButton
        x: 10
        y:10
        text: "Reset"

        onClicked:{
            repeater.model = 0
            repeater.model = media
        }
    }
}
