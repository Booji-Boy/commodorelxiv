import { useBackend } from 'tgui/backend';
import { Box, Button, LabeledList, Section, Stack } from 'tgui/components';

import { ICON_MAP } from './constants';
import { PaiData } from './types';

<<<<<<< HEAD
export function SystemDisplay(props) {
=======
export const SystemDisplay = (props) => {
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
  return (
    <Stack fill vertical>
      <Stack.Item grow={3}>
        <SystemWallpaper />
      </Stack.Item>
      <Stack.Item grow>
        <SystemInfo />
      </Stack.Item>
    </Stack>
  );
}

/** Renders some ASCII art. Changes to red on emag. */
<<<<<<< HEAD
function SystemWallpaper(props) {
=======
const SystemWallpaper = (props) => {
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
  const { data } = useBackend<PaiData>();
  const { emagged } = data;

  const owner = !emagged ? 'NANOTRASEN' : ' SYNDICATE';
  const eyebrows = !emagged ? "/\\ ' /\\" : ' \\\\ // ';

  const paiAscii = [
    ' ________  ________  ___',
    ' |\\   __  \\|\\   __  \\|\\  \\',
    ' \\ \\  \\|\\  \\ \\  \\|\\  \\ \\  \\     Interface',
    '  \\ \\   ____\\ \\   __  \\ \\  \\     Version 2.5',
    '   \\ \\  \\___|\\ \\  \\ \\  \\ \\  \\',
    '    \\ \\__\\    \\ \\__\\ \\__\\ \\__\\     Property of',
    `     \\|__|     \\|__|\\|__|\\|__|      ${owner}`,
    '',
  ].join('\n');

  const floofAscii = [
    '                              .--.       .-.',
    "        ,;;``;;-;,,..___.,,.-/   `;_//,.'   )",
    "      .' ;;  `;  :; `;;  ;;  `.       '/   .'",
    `     ,;  ';   ;   '  ';  ';   ,'    ${eyebrows}';`, // lol
    "    /'     `      \\   `     ;','   ( d\\__b_),",
    "   /   /       .,;;)       ', (    .'     __\\",
    "  ;:.  \\     ,_   /         ', ' .'_      \\/;",
    " ,   ,;'      `;;/       /    ';,\\ `-..__._,'",
    " ;:.  /____  ..-'--.    /-'    ..---. ._._/ ---.",
    " |    ;' ;'|        \\--/;' ,' /      \\   ,      \\",
    " `.fL__;,__/-..__)_)/  `--'--'`-._)_)/ --\\.._)_)/",
  ].join('\n');

  return (
    <Section fill nowrap overflow="hidden">
      <pre>
        <Box color={!emagged ? 'blue' : 'crimson'}>{paiAscii}</Box>
        <Box color={!emagged ? 'gold' : 'limegreen'}>{floofAscii}</Box>
      </pre>
    </Section>
  );
}

/** Displays master info.
 * You can check their DNA and change your image here.
 */
<<<<<<< HEAD
function SystemInfo(props) {
=======
const SystemInfo = (props) => {
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
  const { act, data } = useBackend<PaiData>();
  const { image, master_dna, master_name } = data;

  return (
    <Section
      buttons={
        <>
          <Button
            disabled={!master_dna}
            icon="dna"
            onClick={() => act('check dna')}
            tooltip="Verifies your master's DNA. Must be carried in hand."
          >
            Verify
          </Button>
          <Button
            icon={ICON_MAP[image]}
            onClick={() => act('change image')}
            tooltip="Change your display image."
          >
            Display
          </Button>
        </>
      }
      fill
      title="System Info"
    >
      <LabeledList>
        <LabeledList.Item label="Master">
          {master_name || 'None.'}
        </LabeledList.Item>
        <LabeledList.Item color={master_dna ? 'red' : ''} label="DNA">
          {master_dna || 'None.'}
        </LabeledList.Item>
      </LabeledList>
    </Section>
  );
}
