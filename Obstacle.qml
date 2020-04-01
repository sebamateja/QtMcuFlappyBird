import QtQuick 2.0

Item {
    id: root

    property real firstRandomHeight: 0
    property real secondRandomHeight: 0
    readonly property real minimalGap: 80
    readonly property real maximumGap: 100

    width: 30
    height: Theme.appHeight

    function getRandomFloat(min : real, max : real) : real {
        return Math.random() * (max - min + 1) + min
    }

    Item {
        id: topObstacle
        width: 30; height: 0

        anchors.top: root.top

        Image {
            source: "img/pipe2.png"

            anchors.bottom: topObstacle.bottom
        }
    }

    Item {
        id: bottomObstacle
        width: 30; height: 0

        anchors.bottom: root.bottom

        Image {
            source: "img/pipe.png"

            anchors.top: bottomObstacle.top
        }
    }

    onXChanged: {
        if (x < (0-root.width)) {
            root.firstRandomHeight = getRandomFloat(100,300)
            root.secondRandomHeight = getRandomFloat(Theme.appHeight - root.firstRandomHeight - root.minimalGap - root.maximumGap,
                                                    Theme.appHeight - root.firstRandomHeight - root.minimalGap)

            topObstacle.height = root.firstRandomHeight
            bottomObstacle.height = root.secondRandomHeight
            root.x = Theme.appWidth + root.width
        }
    }

    Component.onCompleted: {
        root.firstRandomHeight = getRandomFloat(100,300)
        root.secondRandomHeight = getRandomFloat(root.maximumGap-root.minimalGap,Theme.appHeight - root.firstRandomHeight - root.minimalGap)

        topObstacle.height = root.firstRandomHeight
        bottomObstacle.height = root.secondRandomHeight
        root.x = Theme.appWidth + root.width
    }
}