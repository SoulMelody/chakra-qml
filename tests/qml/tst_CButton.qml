import QtQuick
import QtTest
import "../../src/components"

TestCase {
    id: testCase
    name: "CButton Tests"
    width: 400
    height: 400
    when: windowShown

    Component {
        id: buttonComponent
        CButton {
            text: "Test Button"
        }
    }

    function test_default_properties() {
        var button = createTemporaryObject(buttonComponent, testCase)
        verify(button !== null, "Button created successfully")
        compare(button.text, "Test Button", "Default text")
        compare(button.variant, "solid", "Default variant")
        compare(button.colorScheme, "blue", "Default colorScheme")
        compare(button.size, "md", "Default size")
    }

    function test_variant_types() {
        var button = createTemporaryObject(buttonComponent, testCase, {
            variant: "outline"
        })
        verify(button !== null)
        compare(button.variant, "outline")
    }

    function test_color_schemes() {
        var schemes = ["blue", "green", "red", "purple", "gray", "teal", "pink", "cyan", "orange", "yellow"]
        
        for (var i = 0; i < schemes.length; i++) {
            var button = createTemporaryObject(buttonComponent, testCase, {
                colorScheme: schemes[i]
            })
            verify(button !== null, "Button with colorScheme " + schemes[i] + " created")
            compare(button.colorScheme, schemes[i])
        }
    }

    function test_size_types() {
        var sizes = ["sm", "md", "lg"]
        
        for (var i = 0; i < sizes.length; i++) {
            var button = createTemporaryObject(buttonComponent, testCase, {
                size: sizes[i]
            })
            verify(button !== null, "Button with size " + sizes[i] + " created")
            compare(button.size, sizes[i])
        }
    }

    function test_disabled_state() {
        var button = createTemporaryObject(buttonComponent, testCase, {
            isDisabled: true
        })
        verify(button !== null)
        compare(button.isDisabled, true)
        verify(!button.enabled)
    }

    function test_loading_state() {
        var button = createTemporaryObject(buttonComponent, testCase, {
            isLoading: true
        })
        verify(button !== null)
        compare(button.isLoading, true)
    }

    function test_click_signal() {
        var button = createTemporaryObject(buttonComponent, testCase)
        verify(button !== null)
        
        var clickSpy = createTemporaryObject(signalSpyComponent, testCase, {
            target: button,
            signalName: "clicked"
        })
        
        verify(clickSpy.valid)
        mouseClick(button)
        compare(clickSpy.count, 1)
    }

    Component {
        id: signalSpyComponent
        SignalSpy {}
    }
}
