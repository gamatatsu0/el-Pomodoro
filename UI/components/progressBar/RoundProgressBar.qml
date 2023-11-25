// Make sure to use the QtQuick 2.12
// Otherwise there will be issues with with imports and QtQuick.Shapes
// For shapes we need to make sure we use the version 1.12

import QtQuick.Shapes 1.12
import QtQuick 2.12
//import QtGraphicalEffects 1.12



//import QtGraphicalEffects 1.5

Item {

    id: progress


//   General Gauge Properties
    property int size: 100;
    property bool roundCap: true
    property int startAngle: 90
    property int secondsValue: 5 // Value for the number in the center
    property int maxSecondsValue: 60
    property int samples: 12


//    Big Circle
    property color bgColor: "transparent"
    property color bgStrokeColor: "#7e7e7e"
    property int strokeBgWidth: 8;

//    Progress Circle
    property color progressColor: (progress.secondsValue  < 30)?  "red" : "Blue"
    property color lessColor: "blue"
    property color color1: "blue"
    property color color2: "red"

    property int progressWidth: 8

//    Text Properties
    property string timeText: "%"
    property string textFontFamily: "Segoe UI"
    property int textSize: 35
    property int rpmLabelSize: 30
    property color textColor: "#7c7c7c"

    width: size;
    height: size;



    Shape{
        id:shape
        anchors.fill: parent;
        layer.enabled: true;
        layer.samples: progress.samples;


        ShapePath{
            id: pathBG
            strokeColor: progress.bgStrokeColor
            fillColor: progress.bgColor
            strokeWidth: progress.strokeBgWidth
            capStyle: progress.roundCap ? ShapePath.RoundCap : ShapePath.FlatCap

            PathAngleArc{
                radiusX: (progress.width /2) - (progress.progressWidth  / 2)
                radiusY: (progress.height /2) - (progress.progressWidth  / 2)
                centerX: progress.width / 2
                centerY: progress.height / 2
                startAngle: progress.startAngle
                sweepAngle: 360

            }
        }


        ShapePath{
            id: path
            strokeColor: progress.progressColor
            fillColor: "transparent"
            strokeWidth: progress.progressWidth
            capStyle: progress.roundCap ? ShapePath.RoundCap : ShapePath.FlatCap

            PathAngleArc{
                radiusX: (progress.width /2) - (progress.progressWidth / 2)
                radiusY: (progress.height /2) - (progress.progressWidth / 2)
                centerX: progress.width / 2
                centerY: progress.height / 2
                startAngle: progress.startAngle
                sweepAngle: (360 / progress.maxSecondsValue * progress.secondsValue)

            }

//            Glow {
//                anchors.fill: path
//                radius: 20
//                samples: 17
//                color: "red"
//                source: path
//            }
        }


        // Displays the speed
        Text{
            id: milesPerHourWidget
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.fill: parent
            font.pixelSize: 24
            fontSizeMode: Text.Fit
            minimumPixelSize: 10
            wrapMode: Text.WordWrap

            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            text: qsTr(progress.timeText)


        }




    }

}
