import QtQuick
import Chakra

CCard {
    id: root
    width: parent.width - AppStyle.spacing6 * 2
    variant: "outline"

    Column {
        width: parent.width
        spacing: AppStyle.spacing4
        padding: AppStyle.spacing6

        Text {
            text: "输入框 (CInput)"
            font.pixelSize: AppStyle.fontSize2xl
            font.weight: Font.Bold
            color: AppStyle.textColor
        }

        CFlow {
            width: parent.width
            spacing: AppStyle.spacing4

            Column {
                width: 240
                spacing: AppStyle.spacing2
                Text {
                    text: "Outline"
                    font.pixelSize: AppStyle.fontSizeSm
                    color: AppStyle.textSecondary
                }
                CInput {
                    width: parent.width
                    placeholderText: "输入内容..."
                    variant: "outline"
                }
            }

            Column {
                width: 240
                spacing: AppStyle.spacing2
                Text {
                    text: "Filled"
                    font.pixelSize: AppStyle.fontSizeSm
                    color: AppStyle.textSecondary
                }
                CInput {
                    width: parent.width
                    placeholderText: "输入内容..."
                    variant: "filled"
                }
            }

            Column {
                width: 240
                spacing: AppStyle.spacing2
                Text {
                    text: "Flushed"
                    font.pixelSize: AppStyle.fontSizeSm
                    color: AppStyle.textSecondary
                }
                CInput {
                    width: parent.width
                    placeholderText: "输入内容..."
                    variant: "flushed"
                }
            }
        }

        CFlow {
            width: parent.width
            spacing: AppStyle.spacing4

            Column {
                width: 240
                spacing: AppStyle.spacing2
                Text {
                    text: "Clearable"
                    font.pixelSize: AppStyle.fontSizeSm
                    color: AppStyle.textSecondary
                }
                CInput {
                    width: parent.width
                    placeholderText: "可清除..."
                    isClearable: true
                }
            }

            Column {
                width: 240
                spacing: AppStyle.spacing2
                Text {
                    text: "Max Length (10)"
                    font.pixelSize: AppStyle.fontSizeSm
                    color: AppStyle.textSecondary
                }
                CInput {
                    width: parent.width
                    placeholderText: "最多10字符"
                    maxLength: 10
                    isClearable: true
                }
            }

            Column {
                width: 240
                spacing: AppStyle.spacing2
                Text {
                    text: "Password"
                    font.pixelSize: AppStyle.fontSizeSm
                    color: AppStyle.textSecondary
                }
                CInput {
                    width: parent.width
                    placeholderText: "Enter password..."
                    type: "password"
                }
            }
        }

        CFlow {
            width: parent.width
            spacing: AppStyle.spacing4

            Column {
                width: 240
                spacing: AppStyle.spacing2
                Text {
                    text: "Invalid"
                    font.pixelSize: AppStyle.fontSizeSm
                    color: AppStyle.textSecondary
                }
                CInput {
                    width: parent.width
                    placeholderText: "错误状态"
                    isInvalid: true
                }
            }

            Column {
                width: 240
                spacing: AppStyle.spacing2
                Text {
                    text: "Disabled"
                    font.pixelSize: AppStyle.fontSizeSm
                    color: AppStyle.textSecondary
                }
                CInput {
                    width: parent.width
                    placeholderText: "禁用状态"
                    isDisabled: true
                }
            }
        }

        Text {
            text: "下拉选择 (CSelect)"
            font.pixelSize: AppStyle.fontSize2xl
            font.weight: Font.Bold
            color: AppStyle.textColor
            topPadding: AppStyle.spacing4
        }

        CFlow {
            width: parent.width
            spacing: AppStyle.spacing4

            Column {
                width: 240
                spacing: AppStyle.spacing2
                Text {
                    text: "Basic"
                    font.pixelSize: AppStyle.fontSizeSm
                    color: AppStyle.textSecondary
                }
                CSelect {
                    width: parent.width
                    model: ["Apple", "Banana", "Cherry", "Date", "Elderberry"]
                    placeholder: "Select fruit"
                }
            }

            Column {
                width: 240
                spacing: AppStyle.spacing2
                Text {
                    text: "Searchable"
                    font.pixelSize: AppStyle.fontSizeSm
                    color: AppStyle.textSecondary
                }
                CSelect {
                    width: parent.width
                    model: ["Beijing", "Shanghai", "Guangzhou", "Shenzhen", "Hangzhou", "Nanjing", "Chengdu", "Wuhan"]
                    placeholder: "Search city..."
                    isSearchable: true
                }
            }

            Column {
                width: 240
                spacing: AppStyle.spacing2
                Text {
                    text: "Filled"
                    font.pixelSize: AppStyle.fontSizeSm
                    color: AppStyle.textSecondary
                }
                CSelect {
                    width: parent.width
                    model: ["Small", "Medium", "Large"]
                    placeholder: "Select size"
                    variant: "filled"
                }
            }

            Column {
                width: 240
                spacing: AppStyle.spacing2
                Text {
                    text: "Disabled"
                    font.pixelSize: AppStyle.fontSizeSm
                    color: AppStyle.textSecondary
                }
                CSelect {
                    width: parent.width
                    model: ["Option A", "Option B"]
                    placeholder: "Disabled"
                    isDisabled: true
                }
            }
        }
    }
}
