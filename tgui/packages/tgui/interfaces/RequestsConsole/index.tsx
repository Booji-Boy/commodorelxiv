import { useBackend } from '../../backend';
import { Button, Stack } from '../../components';
import { Window } from '../../layouts';
<<<<<<< HEAD
import { RequestsConsoleHeader } from './RequestsConsoleHeader';
import { RequestMainScreen } from './RequestsConsoleMainScreen';
import { RequestsData } from './types';
=======
import { RequestsData } from './types';
import { RequestsConsoleHeader } from './RequestsConsoleHeader';
import { RequestMainScreen } from './RequestsConsoleMainScreen';
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9

export const RequestsConsole = (props) => {
  const { act, data } = useBackend<RequestsData>();
  const { department } = data;
  return (
    <Window title={department + ' Requests Console'} width={500} height={600}>
      <Window.Content>
        <RequestsConsoleContent />
      </Window.Content>
    </Window>
  );
};

const RequestsConsoleContent = (props) => {
  const { act, data } = useBackend<RequestsData>();
  return (
    <Stack vertical fill>
      <RequestsConsoleHeader />
      <RequestMainScreen />
      <RequestsConsoleFooter />
    </Stack>
  );
};

const RequestsConsoleFooter = (props) => {
  const { act, data } = useBackend<RequestsData>();
  const { silent } = data;
  return (
    <Stack.Item>
      <Button.Checkbox
        fluid
        checked={!silent}
        content={'Speaker'}
        onClick={() => {
          act('toggle_silent');
        }}
      />
    </Stack.Item>
  );
};
