import QtQuick
import QtTest
import "../../src/components"

TestCase {
    id: testCase
    name: "CInput Tests"
    width: 400
    height: 400
    when: windowShown

    Component {
        id: inputComponent
        CInput {
            placeholderText: "Enter text"
        }
    }

    function test_default_properties() {
        var input = createTemporaryObject(inputComponent, testCase)
        verify(input !== null, "Input created successfully")
        compare(input.placeholderText, "Enter text", "Default placeholder")
        compare(input.variant, "outline", "Default variant")
        compare(input.size, "md", "Default size")
        compare(input.type, "text", "Default type")
    }

    function test_variant_types() {
        var variants = ["outline", "filled", "flushed"]
        
        for (var i = 0; i < variants.length; i++) {
            var input = createTemporaryObject(inputComponent, testCase, {
                variant: variants[i]
            })
            verify(input !== null, "Input with variant " + variants[i] + " created")
            compare(input.variant, variants[i])
        }
    }

    function test_size_types() {
        var sizes = ["sm", "md", "lg"]
        
        for (var i = 0; i < sizes.length; i++) {
            var input = createTemporaryObject(inputComponent, testCase, {
                size: sizes[i]
            })
            verify(input !== null, "Input with size " + sizes[i] + " created")
            compare(input.size, sizes[i])
        }
    }

    function test_text_input() {
        var input = createTemporaryObject(inputComponent, testCase)
        verify(input !== null)
        
        input.text = "Hello World"
        compare(input.text, "Hello World")
    }

    function test_disabled_state() {
        var input = createTemporaryObject(inputComponent, testCase, {
            isDisabled: true
        })
        verify(input !== null)
        compare(input.isDisabled, true)
    }

    function test_invalid_state() {
        var input = createTemporaryObject(inputComponent, testCase, {
            isInvalid: true
        })
        verify(input !== null)
        compare(input.isInvalid, true)
    }

    function test_password_type() {
        var input = createTemporaryObject(inputComponent, testCase, {
            type: "password"
        })
        verify(input !== null)
        compare(input.type, "password")
    }
}
