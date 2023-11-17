import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls 2.15


Button{
    id:pauseButton
    onClicked: textArea.readOnly = true

    property int size: 15;
    property string displayedText: "pause";
    text: qsTr(displayedText);


    contentItem: Text{
    text: pauseButton.text
    font: pauseButton.font
    opacity: enabled ? 1.0 : 0.3
    color: pauseButton.down ? "#17a81a" : "#21be2b"
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    elide: Text.ElideRight

    }

    background: Rectangle {
        implicitWidth: pauseButton.size;
        implicitHeight: pauseButton.size;
        opacity: enabled ? 1 : 0.3;
        border.color: pauseButton.down ? "#17a81a" : "#21be2b";
        border.width: 1;
        radius: 180;
    }
}
