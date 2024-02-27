import QtQuick
import QtQuick.Controls

Window {

    property string currentTitle: "TM 2"

    id: root
    width: 640
    height: 480
    visible: true
    title: currentTitle

    property int selectedIndex: 3


    Loader{
        id: loader
        y: 50
        width: parent.width
        height: parent.height - y
        sourceComponent: selectedIndex === 1 ? v1Comp :
                                               (selectedIndex === 2 ? v2Comp : mediaGalleryComp)
    }

    Row{
        spacing: 5
        Button{
            text: "TM 1"
            onClicked:{
                selectedIndex = 1
            }
        }


        Button{
            text: "TM 2"
            onClicked:{
                selectedIndex = 2
            }
        }

        Button{
            text: "Media Gallery"
            onClicked:{
                selectedIndex = 3
            }
        }
    }


    Component{
        id: v1Comp
        SpeedLimitsTestV1{
            Component.onCompleted: currentTitle = title
        }
    }

    Component{
        id: v2Comp
        SpeedLimitsTestV2{
            Component.onCompleted: currentTitle = title
        }
    }

    Component{
        id: mediaGalleryComp
        MediaGallery{
            Component.onCompleted: currentTitle = title
        }
    }

}
