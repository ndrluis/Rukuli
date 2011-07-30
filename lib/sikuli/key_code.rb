# These constants represent keyboard codes for interacting with the keyboard.
# Keyboard interaction is defined in the Sikuli::Typeable module.
#
module Sikuli

  # Command Key
  KEY_CMD   = java.awt.event.InputEvent::META_MASK

  # Shift Key
  KEY_SHIFT = java.awt.event.InputEvent::SHIFT_MASK

  # Control Key
  KEY_CTRL  = java.awt.event.InputEvent::CTRL_MASK

  # Alt Key
  KEY_ALT   = java.awt.event.InputEvent::ALT_MASK

  # Backspace Key
  KEY_BACKSPACE = "\u0008"

  # Return Key
  KEY_RETURN    = "\n"

  # Left Arrow Key
  LEFT_ARROW    = "\ue003"
end