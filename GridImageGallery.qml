import QtQuick 2.7
import QtQml.Models 2.2
import QmlGallery 1.0

Rectangle {
    id: root
    anchors.fill: parent
    color: "black"

    property variant model

    GridView {
        id: gridImageGallery
        model: root.model

        property bool selectionMode: false

        onSelectionModeChanged: { console.debug("Clear all selections") }
        anchors.fill: root
        delegate: ImageDelegate { imagePath: source; selectable: true; }
        cellHeight: 160
        cellWidth: 160
    }

    ExpandingPanel {
        id: controlExpandingPanel
        mouseArea: mouseArea
        anchorTopHidden: root.bottom
        anchorBottomHidden: undefined
        anchorTopExpanded: undefined
        anchorBottomExpanded: root.bottom

        Rectangle {
            anchors.fill: controlExpandingPanel
            color: "black"
            opacity: 0.7
        }
    }
}
