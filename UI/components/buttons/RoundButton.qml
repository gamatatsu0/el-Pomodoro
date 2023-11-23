import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.6

Button{
    id:roundButton

    property string displayedText: "0";
    property int buttonHeight: 100;
    property int buttonWidth: 55
    property string buttonColor: "transparent";
    property string borderColor: "transparent";
    text: qsTr(displayedText);
    height: buttonHeight
    width: buttonWidth

    Text{
        text: roundButton.text
        font: roundButton.font
        opacity: enabled ? 1.0 : 0.3
        //    color: roundButton.down ? "#21be2b":borderColor
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
        color: buttonColor
    }

    background:Rectangle{
        width: 100
        height: 40
        color:buttonColor
        Shape {
            width: 100
            height: 40
            anchors.centerIn: parent
            ShapePath {
                strokeColor:"black"
                fillColor: buttonColor
                startX: 0; startY: 0
                PathLine { x: 85; y: 0 }
                PathLine { x: 100; y: 15 }

                PathLine { x: 100; y: 40 }

                PathLine { x: 0; y: 40 }
                PathLine { x: 0; y:0  }
            }
        }
    }

    Rectangle{
        height: 10
        width: 15
        x:80
        anchors.verticalCenter: roundButton.bottom
        color: "#FDED00";
        Text {
            id: idNumber
            text: qsTr("B25")
            font.pixelSize: 8
        }
    }
}
