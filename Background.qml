import QtQuick 2.0

Item {
    id: root
    width: Theme.appWidth
    height: Theme.appHeight

    Image {
        anchors.fill: parent

        source: "img/bg.png"
    }

    Image {
        id: clouds

        y: 200

        width: Theme.appWidth * 2.0

        source: "img/bg-clouds.png"
        fillMode: Image.TileHorizontally
    }

    Rectangle {
        id: cloudFill

        color: Qt.rgba(0.95294,0.98431,0.99607)
        width: Theme.appWidth
        height: Theme.appHeight - 343
        y: 343
    }

    Image {
        id: forest

        anchors.bottom: root.bottom

        source: "img/bg-forest.png"
    }

    ParallelAnimation {
        running: true
        loops: Animation.Infinite

        NumberAnimation { target: clouds; property: "x"; from: 0; to: -clouds.width*0.5; duration: 20000; }
    }
}