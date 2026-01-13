# Chakra UI QML

A modern, accessible, and customizable QML component library inspired by [Chakra UI](https://chakra-ui.com/).

English | [简体中文](README.zh-CN.md)

## Preview

### Button Components
![Button Components](img/1.png)

### Input Components
![Input Components](img/2.png)

### Card Components
![Card Components](img/3.png)

### Dark Mode
![Dark Mode](img/4.png)

## Features

- **40+ Components** - Buttons, Inputs, Cards, Menus, Dialogs and more
- **Dark Mode** - Built-in theme system with light/dark modes
- **High Performance** - Optimized rendering with minimal overhead
- **Frameless Window** - Native Windows DWM shadow and custom title bar
- **Type Safe** - Full PySide6 integration with type hints
- **Responsive** - Adaptive layouts and sizing system
- **Accessible** - ARIA-compliant components (where applicable)

## Installation

```bash
pip install chakra-qml
```

## Quick Start

Import Chakra in your QML file and start using components:

```qml
import Chakra

CWindow {
    CButton { text: "Click Me" }
}
```

See `examples/` folder for complete usage examples.

## Available Components

### Layout
- `CBox` - Flexible container with styling props
- `CFlex` - Flexbox layout container
- `CFlow` - Flow layout for wrapping items
- `CCenter` - Center alignment container
- `CContainer` - Responsive container with max-width
- `CSpacer` - Flexible spacer component

### Forms
- `CButton` - Versatile button with variants and sizes
- `CInput` - Text input with validation states
- `CCheckbox` - Checkbox with indeterminate state
- `CSwitch` - Toggle switch with labels
- `CSelect` - Dropdown select with search

### Data Display
- `CCard` - Content card with header/footer
- `CBadge` - Small status indicator
- `CTag` - Removable tag component
- `CProgress` - Progress bar with variants
- `CSpinner` - Loading spinner
- `CIcon` - Icon component with 1000+ Phosphor icons

### Feedback
- `CAlert` - Alert messages with status
- `CTooltip` - Hover tooltip
- `CHoverCard` - Hover card with rich content

### Overlay
- `CDialog` - Modal dialog
- `CDrawer` - Side drawer/panel
- `CMenu` - Dropdown menu
- `CMenuGroup` - Menu group container
- `CMenuItem` - Menu item component
- `CMenuSeparator` - Menu separator

### Navigation
- `CPagination` - Pagination controls
- `CSegmentedControl` - Segmented picker

### Scrolling
- `CScrollBar` - Custom scrollbar
- `CScrollArea` - Scrollable area
- `CListView` - Optimized list view
- `CGridView` - Optimized grid view

### Other
- `CWindow` - Frameless window with native shadow
- `CActionBar` - Floating action bar

## Theme Customization

The library uses a centralized `AppStyle` singleton for theming. Toggle between light and dark mode with `AppStyle.toggleTheme()`.

## Frameless Window

Create modern frameless windows with native Windows shadow using `CWindow` component.

## Performance

This library is optimized for performance:

- No unnecessary `layer.effect` usage
- Efficient property bindings
- Cached color mappings in `AppStyle`
- Native Windows API for frameless window
- Minimal animation overhead

## Requirements

- Python >= 3.8
- PySide6 >= 6.5.0+

## License

MIT License - see [LICENSE](LICENSE) file for details

## Credits

Inspired by [Chakra UI](https://chakra-ui.com/) by Segun Adebayo.
