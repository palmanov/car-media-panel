import QtQuick 2.0
import QtQuick.Window 2.0
import QtLocation 5.15
import QtPositioning 5.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.11
import QtGraphicalEffects 1.0
import QtQuick.Timeline 1.0

Page {
    id: page
    anchors.fill: parent
    visible: true

    Plugin {
        id: googlemaps
        name: "googlemaps"
        locales: "ru_RU"
        PluginParameter {
            name: "osm.mapping.highdpi_tiles"
            value: "true"
        }
    }

    Plugin {
        id: osm
        name: "osm"
        PluginParameter { name: "osm.mapping.custom.host"; value: "https://a.tile.openstreetmap.org/" }
        PluginParameter { name: "osm.mapping.highdpi_tiles"; value: "true" }
        PluginParameter { name: "osm.mapping.cache.disk.size"; value: "0" }
    }

    property variant region: QtPositioning.circle(QtPositioning.coordinate(59.326594, 18.069775), 10000)

    SearchBar {
        id: searchBar
        x: 26
        y: 86
        width: 256
        height: 64
        z: 2

        Connections {
            target: searchBar
            onClicked: print("clicked")
        }
    }

    PlaceSearchModel {
        id: searchModel

        plugin: osm

        searchTerm: "fuel"
        searchArea: region;

        Component.onCompleted: update()
    }

    Rectangle {
        x: 822
        y: 0
        width: 202
        height: 600
        visible: false
        z: 1
        ListView {
            visible: false
            anchors.fill: parent
            model: searchModel
            delegate: Component {
                Row {
                    spacing: 5
                    //Marker { height: parent.height }
                    Column {
                        Text { text: title; font.bold: true }
                        Text { text: place.location.address.text }
                    }
                }
            }
        }
    }

    Map {
        id: map
        anchors.fill: parent
        plugin: googlemaps

        activeMapType: supportedMapTypes[3]

        center: QtPositioning.coordinate(59.326594, 18.069775)
        zoomLevel: 15

        MapCircle {
            center: region.center;
            radius: region.radius;
            color: "#1759ff"
            border.width: 2
            opacity: 0.2
        }

        MapItemView {
            model: searchModel
            delegate: MapQuickItem {
                coordinate: place.location.coordinate

                anchorPoint.x: image.width * 0.5
                anchorPoint.y: image.height

                sourceItem: Column {
                    Image { id: image; source: "qrc:/icons/res/svg/local_gas_station-24px.svg"; }
                    ColorOverlay {
                        anchors.fill: image
                        source: image
                        color: "#1759ff"
                    }
                    Text { text: title; font.bold: true }
                }
            }
        }
    }

    Timeline {
        id: timeline
        animations: [
            TimelineAnimation {
                id: timelineAnimation
                loops: 1
                to: 1000
                running: true
                from: 0
                duration: 1000
            }
        ]
        enabled: true
        endFrame: 1000
        startFrame: 0
    }



}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.6600000262260437;height:600;width:1024}D{i:10;invisible:true}
D{i:9;invisible:true}D{i:17;invisible:true}D{i:18;invisible:true}D{i:16;invisible:true}
D{i:24}
}
##^##*/
