import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Timeline 1.0

Item {
    id: element

    property bool isVis: false
    property string request: ""

    QtObject {
        id: searchEngine
        property string name
        property int size
        property variant attributes
    }

    state: "hide"
    opacity: 1

    RoundButton {
        id: roundButton
        text: ""
        flat: false
        anchors.right: parent.right
        anchors.rightMargin: 192
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        z: 1
        background: Rectangle {
            color: "#ffffff"
            opacity: 0.5
            radius: roundButton.radius
        }
        display: AbstractButton.IconOnly

        MouseArea {
            id: mouseArea
            anchors.fill: roundButton
            onClicked: {
                if (isVis)
                    isVis = false;
                else
                    isVis = true;
            }

            Connections {
                target: mouseArea
                onClicked: {
                    if (isVis)
                        element.state = "show"
                    else
                        element.state = "hide"
                }
            }
        }

        Image {
            id: image
            anchors.rightMargin: 14
            anchors.leftMargin: 14
            anchors.bottomMargin: 14
            anchors.topMargin: 14
            sourceSize.height: 64
            sourceSize.width: 64
            anchors.fill: parent
            antialiasing: true
            z: 2
            source: "qrc:/icons/res/svg/search-24px.svg"
            fillMode: Image.PreserveAspectFit
        }
    }

    Rectangle {
        id: rectangle
        color: "#ffffff"
        radius: 32
        visible: false
        anchors.right: parent.right
        anchors.rightMargin: 192
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        border.width: 0

        TextInput {
            id: textInput
            text: qsTr("")
            anchors.fill: parent
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 12

            Connections {
                target: textInput
                onAccepted: request = textInput.text
            }
        }
    }



    states: [
        State {
            name: "show";
            PropertyChanges { target: rectangle; width: 200; height: 64; visible: true;anchors.rightMargin: 0 }

            PropertyChanges {
                target: textInput
                x: 56
                y: 8
                width: 125
                height: 36
                text: qsTr("Search")
                antialiasing: true
                visible: true
                font.pixelSize: 18
                anchors.rightMargin: 71
                anchors.leftMargin: 72
                font.family: "Roboto"
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenterOffset: 6
            }

            PropertyChanges {
                target: element
                opacity: 1
            }

            PropertyChanges {
                target: roundButton
                z: 2
            }
        },
        State {
            name: "hide";
            PropertyChanges { target: rectangle; width: 64;radius: 32 ;visible: false }

            PropertyChanges {
                target: element
                opacity: 1
            }

            PropertyChanges {
                target: textInput
                x: 0
                y: 13
                width: 52
                height: 31
                text: qsTr("")
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: "Roboto"
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenterOffset: 1
                visible: true
            }
        }
    ]

    transitions: [
        Transition {
            from: "hide"
            to: "show"
            reversible: true
            NumberAnimation { properties: "width"; duration: 500; }
        },
        Transition {
            from: "show"
            to: "hide"
            reversible: true
            NumberAnimation { properties: "width"; duration: 500; }
        }
    ]
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:3;height:64;width:256}D{i:5;anchors_height:100;anchors_width:100}
D{i:1;anchors_height:48;anchors_width:64}D{i:7;anchors_height:29;anchors_width:52;anchors_x:0;anchors_y:15}
D{i:6;anchors_height:64;anchors_width:64}
}
##^##*/
