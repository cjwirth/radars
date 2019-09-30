# KeyboardSadness

Illustrates a problem where the wrong keyboard is displayed, despite returning an active input mode that is not the one set in the settings.

### Setup

* Xcode Version 10.2.1 (10E1001)
* macOS Version 10.14.6 (18G95)
* iPhone X iOS 13.1.1 (17A854)

### Background

On versions below iOS 13, returning a `UITextInputMode` from the `UITextInputMode.activeInputModes` would from an overridden implementation of `textInputMode` would result in that keyboard being displayed.

This if be useful if, for example, you have an app localized in English, but has the occasional input in German. You don't want to display an English keyboard when the input is asking for German.

### Expected Results

If add one of these text views to the screen:

```swift
class KeyboardSwitchingTextView: UITextView {

    override var textInputMode: UITextInputMode? {
        // Let's force a German keyboard if one exists
        if let german = UITextInputMode.activeInputModes.first(where:  { $0.primaryLanguage?.hasPrefix("de-") ?? false }) {
            return german
        }
        return super.textInputMode
    }

}
```

I would expect the keyboad displayed to use the German keyboard (assuming one is installed and enabled on the device).

This is the way it worked up until iOS 13.

### Observed Results

The only keyboard that is displayed is the default system keyboard.
