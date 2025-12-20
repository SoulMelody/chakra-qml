import sys
from pathlib import Path
from PySide6.QtCore import qInstallMessageHandler, QDir
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine, qmlRegisterType
from PySide6.QtQuickControls2 import QQuickStyle

# 将项目根目录添加到 Python 路径
project_root = Path(__file__).parent.parent
sys.path.insert(0, str(project_root))

# 导入 CFrameless（提供原生窗口功能）
from src.components.CFrameless import CFrameless # noqa

# 设置 Qt Quick Controls 样式为 Basic（支持自定义）
QQuickStyle.setStyle("Basic")


def message_handler(mode, context, message):
    print(message)


qInstallMessageHandler(message_handler)

app = QGuiApplication(sys.argv)

# 设置工作目录，让 qrc 相对路径正常工作
QDir.setCurrent(str(Path(__file__).parent))

# 注册 CFrameless 到 QML（必须！）
qmlRegisterType(CFrameless, "Chakra", 1, 0, "CFrameless")

engine = QQmlApplicationEngine()
engine.addImportPath(str(project_root / "src"))
engine.load(str(Path(__file__).parent / "framless.qml"))

if not engine.rootObjects():
    sys.exit(-1)

sys.exit(app.exec())
