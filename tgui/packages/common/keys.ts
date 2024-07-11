/**
 * ### Key codes.
 * event.keyCode is deprecated, use this reference instead.
 *
 * Handles modifier keys (Shift, Alt, Control) and arrow keys.
 *
 * For alphabetical keys, use the actual character (e.g. 'a') instead of the key code.
<<<<<<< HEAD
 * Don't access Esc or Escape directly, use isEscape() instead
=======
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
 *
 * Something isn't here that you want? Just add it:
 * @url https://developer.mozilla.org/en-US/docs/Web/API/KeyboardEvent/key/Key_Values
 * @usage
 * ```ts
 * import { KEY } from 'tgui/common/keys';
 *
 * if (event.key === KEY.Enter) {
 *   // do something
 * }
 * ```
<<<<<<< HEAD
 *
 *
=======
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
 */
export enum KEY {
  Alt = 'Alt',
  Backspace = 'Backspace',
  Control = 'Control',
  Delete = 'Delete',
<<<<<<< HEAD
  Down = 'ArrowDown',
  End = 'End',
  Enter = 'Enter',
  Esc = 'Esc',
  Escape = 'Escape',
  Home = 'Home',
  Insert = 'Insert',
  Left = 'ArrowLeft',
  PageDown = 'PageDown',
  PageUp = 'PageUp',
  Right = 'ArrowRight',
  Shift = 'Shift',
  Space = ' ',
  Tab = 'Tab',
  Up = 'ArrowUp',
}

/**
 * ### isEscape
 *
 * Checks if the user has hit the 'ESC' key on their keyboard.
 * There's a weirdness in BYOND where this could be either the string
 * 'Escape' or 'Esc' depending on the browser. This function handles
 * both cases.
 *
 * @param key - the key to check, typically from event.key
 * @returns true if key is Escape or Esc, false otherwise
 */
export function isEscape(key: string): boolean {
  return key === KEY.Esc || key === KEY.Escape;
=======
  Down = 'Down',
  End = 'End',
  Enter = 'Enter',
  Escape = 'Esc',
  Home = 'Home',
  Insert = 'Insert',
  Left = 'Left',
  PageDown = 'PageDown',
  PageUp = 'PageUp',
  Right = 'Right',
  Shift = 'Shift',
  Space = ' ',
  Tab = 'Tab',
  Up = 'Up',
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
}
