# This Python file uses the following encoding: utf-8

import sys
from pathlib import Path
import datetime

from PySide6.QtCore import QObject, Slot
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine, QmlElement
from PySide6.QtQuickControls2 import QQuickStyle

# To be used on the @QmlElement decorator
# (QML_IMPORT_MINOR_VERSION is optional)
QML_IMPORT_NAME = "io.qt.textproperties"
QML_IMPORT_MAJOR_VERSION = 1

class Pomodoro():
    """ This class is the logic of the pomodoro timer.
    """
    def __init__(self):
        self.minutes= 1
        self.seconds = self.minutes * 60

    def set_starting_time(self, time):
        """ Sets the starting time of the Pomodoro timer.
        """
        self.minutes = time

    def countdown(self, run):
        """ Decreases the number of seconds by 1.
        """
        while run:
            self.seconds  = self.seconds -1
            print(self.seconds)


    def add_10_minutes(self):
        """ Increases number of minutes by 10
        """
        self.minutes += 10

    def add_15_minutes(self):
        """ Increases number of minutes by 15
        """
        self.minutes += 15

    def add_20_minutes(self):
        """ Increases number of minutes by 20
        """
        self.minutes += 20


@QmlElement
class Bridge(QObject):
    """ Bridge class is used to connect the python logic to the
    front QML front-end
    """
    def __init__(self):
        QObject.__init__(self)
        self.timer = Pomodoro()
        self.running = False

    def set_starting_time(self, time):
        """ Sets the starting time of the countdown clock.
        """
        self.timer.set_starting_time(time)

    @Slot(int, result=int)
    def add_time(self, time):
        """ Based on the value provided by the "time" variable
        a diiferent case will be executed adding the specified time to the
        countdown timer.
        """
        print(time)
        match time:
            case 10:
                self.timer.add_10_minutes()
                print(self.timer.minutes)
            case 15:
                self.timer.add_15_minutes()
                print(self.timer.minutes)


    def clock_coundown(self):
        """ Subtract 1 second from the current time of in the Pomodoro class.
        """
        self.running = not self.running
        self.timer.countdown(self.running)




if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    QQuickStyle.setStyle("Material")
    engine = QQmlApplicationEngine()

    qml_file = Path(__file__).resolve().parent / "main.qml"
    engine.load(qml_file)

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec())
