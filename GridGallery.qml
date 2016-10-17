import QtQuick 2.0
import QtQuick.Controls 1.5
import QtGraphicalEffects 1.0
import QtQml.Models 2.2

Item {
    id: root

    property var contentView: undefined
    property variant viewModel: undefined
    property string currentImage: ""
    property bool selectionMode: false
    property bool dragOn: false

    function singleClick() {
        console.log("Single click in gridView")
        if (!selectionMode) {
            root.contentView.imageSource = currentImage
            root.contentView.show()
        }
    }

    function doubleClick() {
        selectionMode = selectionMode ? false : true
        controlExpandingPanel.show()
        console.log("Selection mode on: " + selectionMode)
    }

    GridView {
        id: gridView
        anchors.fill: root
        model: root.viewModel

        cellWidth: 150
        cellHeight: 150

        delegate: GridGalleryDelegate {
            id: gridGalleryDelegate
            width: 140
            height: 140

            selectionEnabled: root.selectionMode

            onClicked: {
                if (!selectionEnabled) {
                    root.viewModel.currentIndex = index
                    root.currentImage = source
                    console.log("Current index: " + gridView.model.currentIndex)
                }
                else {
                    selected = !selected
                }
            }
        }
    }

    Drag.active: gridMouseArea.drag.active

    MouseArea {
        id: gridMouseArea
        anchors.fill: parent
        propagateComposedEvents: true

        Timer {
            id: mouseTimer
            interval: 200
            onTriggered: { singleClick(); }
        }

        onClicked: {
            if (mouse.button === Qt.LeftButton) {
                if(mouseTimer.running) {
                    doubleClick()
                    mouseTimer.stop()
                }
                else {
                    mouseTimer.restart()
                    mouse.accepted = false
                }
            }
        }

        onPressAndHold: {
            if (root.selectionMode && root.viewModel.selectedCount() > 0) {
                root.dragOn = true
                dragFrame.show()
                dragFrame.count = root.viewModel.selectedCount()
            }
        }

        onReleased: {
            if (root.dragOn === true) {
                root.dragOn = false
                dragFrame.visible = false
                if (!dropFav.visible) {         // TEMPORARY
                    console.debug("Add to Fav")
                }
                if (!dropRemove.visible) {
                    console.debug("Remove")
                }
            }
        }
    }

    OpacityMask {
        height: 100
        width: parent.width
        anchors.bottom: parent.bottom
        maskSource: Image {
            anchors.fill: parent
            source: "/Resources/bottomMask.png"
        }
    }

    ExpandingPanel {
        id: controlExpandingPanel
        anchorTopHidden: root.bottom
        anchorBottomHidden: undefined
        anchorTopExpanded: undefined
        anchorBottomExpanded: root.bottom
        height: 96

        Rectangle {
            anchors.fill: controlExpandingPanel
            color: "transparent"

            Row {
                anchors.fill: parent

                MenuBarButton {
                    id: favsBarButton
                    width: controlExpandingPanel.width / 2
                    height: controlExpandingPanel.height
                    imgSource: "/Resources/photos-favs-ico-large.png"

                    Rectangle {
                        id: dropFav
                        anchors.fill: favsBarButton
                        color: "green"
                        opacity: 0.5

                        visible: !contains(mapFromItem(gridMouseArea, gridMouseArea.mouseX, gridMouseArea.mouseY))
                    }
                }

                MenuBarButton {
                    id: removeBarButton
                    width: controlExpandingPanel.width / 2
                    height: controlExpandingPanel.height
                    imgSource: "/Resources/photos-delete-ico-large.png"

                    Rectangle {
                        id: dropRemove
                        anchors.fill: removeBarButton
                        color: "red"
                        opacity: 0.5

                        visible: !contains(mapFromItem(gridMouseArea, gridMouseArea.mouseX, gridMouseArea.mouseY))
                    }
                }
            }
        }
    }

    Item {
        id: dragFrame
        x: gridMouseArea.mouseX - 60
        y: gridMouseArea.mouseY - 60
        width: 125
        height: 125
        visible: false
        enabled: false

        property var indexes: root.viewModel.selectedIndexes()
        property int count: 0

        function show() {
            visible = true
            indexes = root.viewModel.selectedIndexes()
        }

        Repeater {
            model: (dragFrame.count <= 3) ? dragFrame.count : 3

            Image {
                id: frame
                z: -index
                anchors.left: dragFrame.left
                anchors.bottom: dragFrame.bottom
                anchors.leftMargin: index * 20
                anchors.bottomMargin: index * 20
                width: 125
                height: 125
                source: "/Resources/photos-drag-frame.png"

                Image {
                    anchors.centerIn: frame
                    width: 100
                    height: 100
                    source: root.viewModel.sourceFromIndex(dragFrame.indexes[index])
                    fillMode: Image.PreserveAspectCrop
                }
            }
        }

        Image {
            anchors.right: dragFrame.right
            anchors.bottom: dragFrame.bottom
            width: 47
            height: 47

            Label {
                anchors.centerIn: parent
                text: dragFrame.count
                color: "white"
            }

            source: "/Resources/photos-drag-count.png"
        }
    }
}
