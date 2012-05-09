require 'java'
java_import 'org.sikuli.script.Key'
java_import 'org.sikuli.script.KeyModifier'

# These constants represent keyboard codes for interacting with the keyboard.
# Keyboard interaction is defined in the Sikuli::Typeable module.
#
module Sikuli

  # Command Key
  KEY_CMD   = KeyModifier::META

  # Shift Key
  KEY_SHIFT = KeyModifier::SHIFT

  # Control Key
  KEY_CTRL  = KeyModifier::CTRL

  # Alt Key
  KEY_ALT   = KeyModifier::ALT

  # Backspace Key
  KEY_BACKSPACE = Key::BACKSPACE

  # Return Key
  KEY_RETURN    = Key::ENTER

  # Left Arrow Key
  LEFT_ARROW    = Key::LEFT

  # Right Arrow Key
  RIGHT_ARROW   = Key::RIGHT

  # Up Arrow Key
  UP_ARROW    = Key::UP

  # Down Arrow Key
  DOWN_ARROW   = Key::DOWN
end