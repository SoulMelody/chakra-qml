import sys
from PyQt6.QtGui import QGuiApplication
from PyQt6.QtQml import QQmlApplicationEngine
from PyQt6.QtQuickControls2 import QQuickStyle
from PyQt6.QtCore import QObject, Slot
from chakra import setup

QQuickStyle.setStyle("Basic")

app = QGuiApplication(sys.argv)


class ClipboardHelper(QObject):
    @Slot(str)
    def copyToClipboard(self, text):
        clipboard = QGuiApplication.clipboard()
        clipboard.setText(text)


clipboard_helper = ClipboardHelper()

engine = QQmlApplicationEngine()
engine.rootContext().setContextProperty("clipboardHelper", clipboard_helper)
setup(engine)
engine.load("icons.qml")

if not engine.rootObjects():
    sys.exit(-1)

sys.exit(app.exec())
