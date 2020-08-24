import QtQuick 2.0
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import QtMultimedia 5.15

Page {
    id: musicPage
    anchors.fill: parent

    Item {
        width: 300
        height: 300

        anchors.top: parent.top
        anchors.topMargin: 70
        anchors.left: parent.left
        anchors.leftMargin: 70

        RectangularGlow {
            id: effect
            anchors.fill: rect
            glowRadius: 10
            spread: 0.2
            color: "black"
            cornerRadius: rect.radius + glowRadius
        }

        Rectangle {
            id: rect
            width: 300
            height: 300
            color: "#717171"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.fill: parent
            radius: 25

            Image {
                id: image
                width: 300
                height: 300
                anchors.fill: parent
                source: "qrc:/res/cover.jpeg"
                layer.smooth: false
                fillMode: Image.PreserveAspectFit
            }
        }
    }

    Slider {
        id: slider
        height: 40
        anchors.right: parent.right
        anchors.rightMargin: 70
        anchors.top: parent.top
        anchors.topMargin: 400
        anchors.left: parent.left
        anchors.leftMargin: 70

        //value: "0.5"
    }

    Column {
        id: column
        x: 420
        width: 451
        height: 129
        anchors.top: parent.top
        anchors.topMargin: 111
        spacing: 15

        Text {
            id: element
            x: 0
            text: "Big Fish"
            elide: Text.ElideNone
            fontSizeMode: Text.FixedSize
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 40
            font.family: "Roboto"
            lineHeight: 1
            verticalAlignment: Text.AlignVCenter
        }

        Text {
            id: element1
            x: 0
            color: "#606060"
            text: "Vince Staples"
            elide: Text.ElideNone
            font.pixelSize: 20
            font.family: "Roboto"
            lineHeight: 1
            verticalAlignment: Text.AlignVCenter
        }
    }

    Row {
        id: row
        x: 420
        y: 249
        width: 534
        height: 64
        spacing: 10
        z: 2

        Item {
            id: prevuios
            width: 64
            height: 64

            Image {
                id: image1
                anchors.fill: parent
                sourceSize.height: 64
                sourceSize.width: 64
                source: "qrc:/icons/res/svg/skip_previous-24px.svg"
                fillMode: Image.PreserveAspectFit
            }
        }

        Item {
            id: start
            width: 64
            height: 64

            Image {
                id: image2
                sourceSize.height: 64
                sourceSize.width: 64
                anchors.fill: parent
                source: "qrc:/icons/res/svg/play_circle_filled-24px.svg"
                fillMode: Image.PreserveAspectFit
            }
        }

        Item {
            id: nextTrack
            width: 64
            height: 64

            Image {
                id: image3
                anchors.fill: parent
                sourceSize.width: 64
                sourceSize.height: 64
                source: "qrc:/icons/res/svg/skip_next-24px.svg"
                fillMode: Image.PreserveAspectFit
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.8999999761581421;height:600;width:1024}
}
##^##*/
