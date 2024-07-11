import { debounce, throttle } from 'common/timer';

<<<<<<< HEAD
import { Channel } from './ChannelIterator';

=======
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
const SECONDS = 1000;

/** Timers: Prevents overloading the server, throttles messages */
export const byondMessages = {
  // Debounce: Prevents spamming the server
  channelIncrementMsg: debounce(
    (visible: boolean) => Byond.sendMessage('thinking', { visible }),
    0.4 * SECONDS,
  ),
  forceSayMsg: debounce(
<<<<<<< HEAD
    (entry: string, channel: Channel) =>
      Byond.sendMessage('force', { entry, channel }),
=======
    (entry: string) => Byond.sendMessage('force', { entry, channel: 'Say' }),
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
    1 * SECONDS,
    true,
  ),
  // Throttle: Prevents spamming the server
  typingMsg: throttle(() => Byond.sendMessage('typing'), 4 * SECONDS),
} as const;
