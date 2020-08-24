import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.0
import QtQuick.Window 2.14
import QtGraphicalEffects 1.0


ApplicationWindow {
    id: window
    visible: true
    width: 1024
    height: 600
    title: qsTr("Stack")

    ToolBar {
        id: statusBar
        height: 40
        font.family: "Roboto"
        opacity: 0.8
        antialiasing: true
        z: 2
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0

        background: Rectangle {
            anchors.fill: parent
            color: "#ffffff"
        }

        RowLayout {
            id: leftRowLayout
            width: 512
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.right: rightRowLayout.left
            anchors.rightMargin: 0
            spacing: 0

            Item {
                id: wifiIndicator
                width: 40
                height: 40
                antialiasing: true
                Layout.leftMargin: 5
                Layout.fillHeight: false
                Layout.fillWidth: false

                Image {
                    antialiasing: true
                    anchors.rightMargin: 5
                    anchors.leftMargin: 5
                    anchors.bottomMargin: 5
                    anchors.topMargin: 5
                    anchors.fill: parent
                    sourceSize.height: 64
                    sourceSize.width: 64

                    source: "qrc:/icons/res/svg/signal_wifi_off-24px.svg"
                }
            }
        }

        RowLayout {
            id: rightRowLayout
            x: 512
            width: 512
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 0
            rotation: 0
            spacing: 0
            layoutDirection: Qt.RightToLeft

            Label {
                id: label
                color: "#000000"
                text: qsTr("Label")
                Layout.rightMargin: 10
                objectName: "timeText"
                font.pointSize: 14
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignRight
            }
        }
    }

    StackView {
        id: stackView
        antialiasing: true
        z: 1
        anchors.fill: parent
        initialItem: stackView.push("Navigation.qml")

        property int currentPageValue: 0

        pushEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to:1
                duration: 0
            }
        }
        pushExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to:0
                duration: 0
            }
        }
        popEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to:1
                duration: 0
            }
        }
        popExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to:0
                duration: 0
            }
        }

        RoundButton {
            id: roundButton
            y: 532
            width: 60
            height: 60
            display: AbstractButton.IconOnly
            anchors.left: parent.left
            anchors.leftMargin: 8
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 8
            z: 2

            background: Rectangle {
                        radius: roundButton.radius
                        color: "white"
                    }

            Image {
                id: roundButtonImage
                anchors.fill: parent
                source: "qrc:/icons/res/svg/expand_more-24px.svg"
                sourceSize.height: 64
                sourceSize.width: 64
            }

            onPressed: {
                if (rectangle.stateVisible === false) {
                    rectangle.stateVisible = true;
                    roundButtonImage.source = "qrc:/icons/res/svg/expand_more-24px.svg"
                }
                else {
                    rectangle.stateVisible = false;
                    roundButtonImage.source = "qrc:/icons/res/svg/expand_less-24px.svg"
                }
            }
        }

        Rectangle {
            id: dockbar
            x: 376
            y: 509
            width: 315
            height: 66
            color: "#ffffff"
            radius: 6
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.horizontalCenter: parent.horizontalCenter
            z: 2

            RowLayout {
                id: rowLayout
                anchors.fill: parent

                Item {
                    id: navigationTab
                    width: 75
                    height: 66
                    Layout.maximumHeight: 66
                    Layout.minimumHeight: 66
                    Layout.preferredHeight: 66


                    Image {
                        id: navigationTabImage
                        height: 44
                        anchors.topMargin: 0
                        anchors.right: parent.right
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottomMargin: 0

                        sourceSize.width: 64
                        sourceSize.height: 64

                        smooth: true
                        visible: false

                        source: "qrc:/icons/res/svg/navigation-24px.svg"
                        fillMode: Image.PreserveAspectFit
                    }

                    ColorOverlay {
                        id: navigationIconColor
                        anchors.fill: navigationTabImage
                        source: navigationTabImage
                        color: "#007ee5"
                    }

                    Text {
                        id: navigationTabLabel
                        text: qsTr("Navigation")
                        anchors.top: navigatonTabImage.bottom
                        anchors.topMargin: 0
                        font.pointSize: 9
                        font.family: "Roboto"
                        color: "#007ee5"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 4
                    }

                    MouseArea {
                        anchors.fill: parent

                        onClicked: {
                            if (stackView.currentPageValue !== 0) {
                                stackView.pop();

                                navigationIconColor.color = "#007ee5"
                                navigationTabLabel.color = "#007ee5"

                                callsIconColor.color = "#000000"
                                callsTabLabel.color = "#000000"

                                musicIconColor.color = "#000000"
                                musicTabLabel.color = "#000000"

                                carIconColor.color = "#000000"
                                carTabLabel.color = "#000000"

                                stackView.push("qrc:/Navigation.qml")
                                stackView.currentPageValue = 0;
                            }
                        }
                    }

                }

                Item {
                    id: callsTab
                    width: 75
                    height: 66
                    Layout.maximumHeight: 66
                    Layout.minimumHeight: 66
                    Layout.preferredHeight: 66

                    Image {
                        id: callsTabImage
                        height: 44
                        anchors.topMargin: 0
                        anchors.right: parent.right
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottomMargin: 0

                        sourceSize.width: 64
                        sourceSize.height: 64

                        smooth: true
                        visible: false

                        source: "qrc:/icons/res/svg/phone-24px.svg"
                        fillMode: Image.PreserveAspectFit
                    }

                    ColorOverlay {
                        id: callsIconColor
                        anchors.fill: callsTabImage
                        source: callsTabImage
                        color: "#000000"
                    }

                    Text {
                        id: callsTabLabel
                        text: qsTr("Calls")
                        anchors.top: callsTabImage.bottom
                        anchors.topMargin: 0
                        font.pointSize: 9
                        font.family: "Roboto"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 4
                    }

                    MouseArea {
                        anchors.fill: parent

                        onClicked: {
                            if (stackView.currentPageValue !== 1) {
                                stackView.pop();

                                navigationIconColor.color = "#000000"
                                navigationTabLabel.color = "#000000"

                                callsIconColor.color = "#007ee5"
                                callsTabLabel.color = "#007ee5"

                                musicIconColor.color = "#000000"
                                musicTabLabel.color = "#000000"

                                carIconColor.color = "#000000"
                                carTabLabel.color = "#000000"

                                stackView.push("qrc:/Calls.qml")
                                stackView.currentPageValue = 1;
                            }
                        }
                    }

                }

                Item {
                    id: musicTab
                    width: 75
                    height: 66
                    Layout.maximumHeight: 66
                    Layout.minimumHeight: 66
                    Layout.preferredHeight: 66

                    Image {
                        id: musicTabImage
                        height: 44
                        anchors.topMargin: 0
                        anchors.right: parent.right
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottomMargin: 0

                        sourceSize.width: 64
                        sourceSize.height: 64

                        smooth: true
                        visible: false

                        source: "qrc:/icons/res/svg/audiotrack-24px.svg"
                        fillMode: Image.PreserveAspectFit
                    }

                    ColorOverlay {
                        id: musicIconColor
                        anchors.fill: musicTabImage
                        source: musicTabImage
                        color: "#000000"
                    }

                    Text {
                        id: musicTabLabel
                        text: qsTr("Music")
                        anchors.top: musicTabImage.bottom
                        anchors.topMargin: 0
                        font.pointSize: 9
                        font.family: "Roboto"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 4
                    }

                    MouseArea {
                        anchors.fill: parent

                        onClicked: {
                            if (stackView.currentPageValue !== 2) {
                                stackView.pop();

                                navigationIconColor.color = "#000000"
                                navigationTabLabel.color = "#000000"

                                callsIconColor.color = "#000000"
                                callsTabLabel.color = "#000000"

                                musicIconColor.color = "#007ee5"
                                musicTabLabel.color = "#007ee5"

                                carIconColor.color = "#000000"
                                carTabLabel.color = "#000000"

                                stackView.push("qrc:/Music.qml")
                                stackView.currentPageValue = 2;
                            }
                        }
                    }
                }

                Item {
                    id: carTab
                    width: 75
                    height: 66
                    Layout.maximumHeight: 66
                    Layout.minimumHeight: 66
                    Layout.preferredHeight: 66

                    Image {
                        id: carTabImage
                        height: 44
                        anchors.topMargin: 0
                        anchors.right: parent.right
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottomMargin: 0

                        sourceSize.width: 64
                        sourceSize.height: 64

                        smooth: true
                        visible: false

                        source: "qrc:/icons/res/svg/car.svg"
                        fillMode: Image.PreserveAspectFit
                    }

                    ColorOverlay {
                        id: carIconColor
                        anchors.fill: carTabImage
                        source: carTabImage
                        color: "#000000"
                    }

                    Text {
                        id: carTabLabel
                        text: qsTr("Car")
                        anchors.top: musicTabImage.bottom
                        anchors.topMargin: 0
                        font.pointSize: 9
                        font.family: "Roboto"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 4
                    }

                    MouseArea {
                        anchors.fill: parent

                        onClicked: {
                            if (stackView.currentPageValue !== 3) {
                                stackView.pop();

                                navigationIconColor.color = "#000000"
                                navigationTabLabel.color = "#000000"

                                callsIconColor.color = "#000000"
                                callsTabLabel.color = "#000000"

                                musicIconColor.color = "#000000"
                                musicTabLabel.color = "#000000"

                                carIconColor.color = "#007ee5"
                                carTabLabel.color = "#007ee5"

                                stackView.push("qrc:/Car.qml")
                                stackView.currentPageValue = 3;
                            }
                        }
                    }
                }
            }
        }
    }
}



/*##^##
Designer {
    D{i:0;formeditorZoom:0.6600000262260437;height:600;width:1024}D{i:2;anchors_height:40;anchors_width:512}
D{i:5;anchors_height:40;anchors_width:512;anchors_x:512;anchors_y:0}D{i:3;anchors_height:40;anchors_width:512}
D{i:6;anchors_height:40;anchors_width:512;anchors_x:512;anchors_y:0}D{i:1;anchors_width:640}
D{i:22;anchors_height:100;anchors_width:100}D{i:23;anchors_height:16;anchors_x:320;anchors_y:28}
D{i:20;anchors_height:100;anchors_width:100}
}
##^##*/
