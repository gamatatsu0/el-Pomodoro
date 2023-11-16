import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls 2.15


Button{
    id:roundButton
    onClicked: textArea.readOnly = true

    property string displayedText: "0";
    text: qsTr(displayedText);


    contentItem: Text{
    text: roundButton.text
    font: roundButton.font
    opacity: enabled ? 1.0 : 0.3
    color: roundButton.down ? "#17a81a" : "#21be2b"
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    elide: Text.ElideRight

    }

    background: Rectangle {
        implicitWidth: 100
        implicitHeight: 100
        opacity: enabled ? 1 : 0.3
        border.color: roundButton.down ? "#17a81a" : "#21be2b"
        border.width: 1
        radius: 180
    }
}
