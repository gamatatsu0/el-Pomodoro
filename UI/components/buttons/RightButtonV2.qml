import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.6

Button{
    id:rightButtonV2

    property string displayedText: "0";
    property int buttonWidth: (rightButtonV2.buttonHeight * (1.618 * 2))
    property int  buttonHeight: 40
    property string buttonColor: "#FDED00";
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
        width: buttonWidth
        height: buttonHeight
        color:buttonColor
        Shape {
            width: buttonWidth
            height: buttonHeight
            anchors.centerIn: parent
            ShapePath {
                strokeColor:"black"
                fillColor: buttonColor
                startX: 0; startY: 0
                PathLine { x: buttonWidth; y: 0 }
                PathLine { x: buttonWidth; y: (buttonHeight * .8) }

                PathLine { x: (buttonWidth * .85); y: (buttonHeight) }

                PathLine { x: 0; y: (buttonHeight) }
                PathLine { x: 0; y:0  }
            }
        }
    }

    Rectangle{
        id:buttonId
        height: (buttonWidth * .08)
        width: (buttonId.height * 1.618)
        x: (buttonWidth * .60)
        y:  parent.height - buttonId.height/2
//        anchors.verticalCenter: rightButtonV2.bottom
        color: rightButtonV2.buttonColor
        Text {
            id: idNumber
            text: qsTr("B26")
            font.pixelSize: 8
        }
    }
}
