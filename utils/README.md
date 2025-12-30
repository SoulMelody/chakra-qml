# Chakra QML Build Utils

构建工具包，用于处理 Chakra QML 的资源文件和 QML 模块定义。

## 功能

- 自动生成 `qmldir` 模块定义文件
- 自动生成 `.qrc` Qt 资源文件
- 编译 `.qrc` 为 Python 资源文件 (`*_rc.py`)
- 生成 QML 类型信息 (`plugins.qmltypes`)

## 使用方法

### 构建 Chakra QML 资源

```bash
uv run build-chakra
```

这个命令会：
1. 扫描 `src/Chakra` 目录中的所有 `.qml` 文件
2. 生成 `qmldir` 文件注册所有组件
3. 生成 `Chakra.qrc` 资源文件
4. 编译 `Chakra.qrc` 为 `Chakra_rc.py`

### 手动调用单个函数

```python
from utils import gen_qmldir, gen_qrc, update_qrcs

# 生成 qmldir
gen_qmldir("src/Chakra", "Chakra", "1.0")

# 生成 .qrc
gen_qrc("src/Chakra", "/Chakra")

# 编译所有 .qrc
update_qrcs("src")
```

## 开发流程

### 添加新组件后
```bash
# 运行构建工具更新资源
uv run build-chakra
```

### 打包发布前
```bash
# 1. 构建资源
uv run build-chakra

# 2. 打包
uv build

# 3. 发布
uv publish dist/*
```

## 依赖

- `loguru`: 日志输出
- `pyside6-rcc`: Qt 资源编译器（来自 PySide6）
- `pyside6-metaobjectdump`: 元对象导出（可选，用于生成 QML 类型信息）
- `pyside6-qmltyperegistrar`: QML 类型注册（可选）
