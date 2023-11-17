import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls 2.15


Button{
    id:roundButton
    onClicked: textArea.readOnly = true

    property string displayedText: "0";
    property int size: 15;
    property string buttonColor: "";
    property string borderColor: "";


    text: qsTr(displayedText);


    contentItem: Text{
    text: roundButton.text
    font: roundButton.font
    opacity: enabled ? 1.0 : 0.3
    color: roundButton.down ? "#21be2b":borderColor
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    elide: Text.ElideRight

    }

    background: Rectangle {
        implicitWidth: roundButton.size;
        implicitHeight: roundButton.size;
        opacity: enabled ? 1 : 0.3
        border.color: roundButton.down ? borderColor : borderColor
        border.width: 2
        radius: 180
        color: buttonColor
    }
}
