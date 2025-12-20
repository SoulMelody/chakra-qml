import QtQuick
import QtTest
import "../../src/components"

TestCase {
    id: testCase
    name: "CCheckbox Tests"
    width: 400
    height: 400
    when: windowShown

    Component {
        id: checkboxComponent
        CCheckbox {
            text: "Test Checkbox"
        }
    }

    function test_default_properties() {
        var checkbox = createTemporaryObject(checkboxComponent, testCase)
        verify(checkbox !== null, "Checkbox created successfully")
        compare(checkbox.text, "Test Checkbox", "Default text")
        compare(checkbox.checked, false, "Default unchecked")
        compare(checkbox.size, "md", "Default size")
    }

    function test_checked_state() {
        var checkbox = createTemporaryObject(checkboxComponent, testCase, {
            checked: true
        })
        verify(checkbox !== null)
        compare(checkbox.checked, true)
    }

    function test_indeterminate_state() {
        var checkbox = createTemporaryObject(checkboxComponent, testCase, {
            isIndeterminate: true
        })
        verify(checkbox !== null)
        compare(checkbox.isIndeterminate, true)
    }

    function test_toggle_functionality() {
        var checkbox = createTemporaryObject(checkboxComponent, testCase)
        verify(checkbox !== null)
        compare(checkbox.checked, false)
        
        mouseClick(checkbox)
        compare(checkbox.checked, true)
        
        mouseClick(checkbox)
        compare(checkbox.checked, false)
    }

    function test_disabled_state() {
        var checkbox = createTemporaryObject(checkboxComponent, testCase, {
            isDisabled: true
        })
        verify(checkbox !== null)
        compare(checkbox.isDisabled, true)
        
        var initialState = checkbox.checked
        mouseClick(checkbox)
        compare(checkbox.checked, initialState, "Disabled checkbox should not toggle")
    }

    function test_size_types() {
        var sizes = ["sm", "md", "lg"]
        
        for (var i = 0; i < sizes.length; i++) {
            var checkbox = createTemporaryObject(checkboxComponent, testCase, {
                size: sizes[i]
            })
            verify(checkbox !== null, "Checkbox with size " + sizes[i] + " created")
            compare(checkbox.size, sizes[i])
        }
    }
}
