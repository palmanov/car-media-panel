import QtQuick 2.0
import QtQuick.Window 2.0
import QtLocation 5.15
import QtPositioning 5.6
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.11

Page {
    anchors.fill: parent
    visible: true

    Plugin {
        id: mapPlugin
        name: "googlemaps"
        locales: "ru_RU"
        PluginParameter {
            name: "osm.mapping.highdpi_tiles"
            value: "true"
        }
    }

    Map {
        anchors.fill: parent
        plugin: mapPlugin
        zoomLevel: 18

        activeMapType: supportedMapTypes[1]
    }
}
