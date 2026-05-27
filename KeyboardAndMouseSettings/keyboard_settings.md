## Mapping Caps Lock to Esc
1. Download karabiner-elements App
2. inside "Simple Modifications", map caps_lock -> escape

## Cycling between tabs in firefox with custom keyboard shotcut
1. Download karabiner-elements App
2. inside "Complex Modifications" choose "Add your own rule"
3. Paste the following code and save
{
    "description": "Firefox Ctrl+J/K tab switching",
    "manipulators": [
        {
            "conditions": [
                {
                    "bundle_identifiers": [
                        "^org\\.mozilla\\.firefox$"
                    ],
                    "type": "frontmost_application_if"
                }
            ],
            "from": {
                "key_code": "l",
                "modifiers": { "mandatory": ["control"] }
            },
            "to": [
                {
                    "key_code": "tab",
                    "modifiers": ["left_control"]
                }
            ],
            "type": "basic"
        },
        {
            "conditions": [
                {
                    "bundle_identifiers": [
                        "^org\\.mozilla\\.firefox$"
                    ],
                    "type": "frontmost_application_if"
                }
            ],
            "from": {
                "key_code": "h",
                "modifiers": { "mandatory": ["control"] }
            },
            "to": [
                {
                    "key_code": "tab",
                    "modifiers": ["left_control", "left_shift"]
                }
            ],
            "type": "basic"
        }
    ]
}

## Adjusting the "Key repeat rate" and "Delay until repeat" in macOS
1. Go to Settings -> Keyboard
2. Adjust the "Key repeat rate" to Fast
3. Adjust the "Delay until repeat" to Short
