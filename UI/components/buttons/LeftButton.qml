import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.6

Button{
    id:leftButton
    property string displayedText: "0";
    property int buttonHeight: 100;
    property int buttonWidth: 50
    property string buttonColor: "transparent";
    property string borderColor: "transparent";
    text: qsTr(displayedText);
    height: buttonHeight
    width: buttonWidth

    Text{
        text: leftButton.text
        font: leftButton.font
        opacity: enabled ? 1.0 : 0.3
        //    color: leftButton.down ? "#21be2b":borderColor
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

            //kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk
            ShapePath {
                strokeColor:"black"
                fillColor: buttonColor
                startX: 0; startY: 0

                PathLine { x: 100; y: 0 }
                PathLine { x: 100; y: 40 }// top right

                PathLine { x: 15; y: 40 } // Bottom
                PathLine { x: 0; y: 25 }
                PathLine { x: 0; y:0  }
            }
        }
    }
    Rectangle{
        height: 10
        width: 15
        x:80
        anchors.verticalCenter: leftButton.bottom
        color: "#FDED00";
        Text {
            id: idNumber
            text: qsTr("B23")
            font.pixelSize: 8
        }
    }
}
