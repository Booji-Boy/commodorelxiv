import { BooleanLike } from 'common/react';

import { useBackend } from '../backend';
import { Box, Button, Section, Stack } from '../components';
import { Window } from '../layouts';

<<<<<<<< HEAD:tgui/packages/tgui/interfaces/EmergencyShuttleConsole.tsx
type Data = {
  authorizations_remaining: number;
  authorizations: Authorization[];
  emagged: BooleanLike;
  enabled: BooleanLike;
  engines_started: BooleanLike;
  timer_str: string;
};

type Authorization = {
  job: string;
  name: string;
};

export function EmergencyShuttleConsole(props) {
  const { act, data } = useBackend<Data>();
========
export const EmergencyShuttleConsole = (props) => {
  const { act, data } = useBackend();
>>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9:tgui/packages/tgui/interfaces/EmergencyShuttleConsole.jsx
  const {
    authorizations = [],
    authorizations_remaining,
    emagged,
    enabled,
    engines_started,
    timer_str,
  } = data;

  return (
    <Window width={400} height={350}>
      <Window.Content>
        <Section>
          <Box bold fontSize="40px" textAlign="center" fontFamily="monospace">
            {timer_str}
          </Box>
          <Box textAlign="center" fontSize="16px" mb={1}>
            <Box inline bold>
              ENGINES:
            </Box>
            <Box inline color={engines_started ? 'good' : 'average'} ml={1}>
              {engines_started ? 'Online' : 'Idle'}
            </Box>
          </Box>
          <Section
            title="Early Launch Authorization"
            buttons={
              <Button
                color="bad"
                disabled={!enabled}
                icon="times"
                onClick={() => act('abort')}
<<<<<<<< HEAD:tgui/packages/tgui/interfaces/EmergencyShuttleConsole.tsx
              >
                Repeal All
              </Button>
            }
          >
            <Stack>
              <Stack.Item grow>
========
              />
            }
          >
            <Grid>
              <Grid.Column>
>>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9:tgui/packages/tgui/interfaces/EmergencyShuttleConsole.jsx
                <Button
                  color="good"
                  disabled={!enabled}
                  fluid
                  icon="exclamation-triangle"
                  onClick={() => act('authorize')}
                >
                  AUTHORIZE
                </Button>
              </Stack.Item>
              <Stack.Item grow>
                <Button
                  disabled={!enabled}
                  fluid
                  icon="minus"
                  onClick={() => act('repeal')}
                >
                  REPEAL
                </Button>
              </Stack.Item>
            </Stack>
            <Section
              title="Authorizations"
              minHeight="150px"
              buttons={
                <Box inline bold color={emagged ? 'bad' : 'good'}>
                  {emagged ? 'ERROR' : 'Remaining: ' + authorizations_remaining}
                </Box>
              }
            >
<<<<<<<< HEAD:tgui/packages/tgui/interfaces/EmergencyShuttleConsole.tsx
              {authorizations.length === 0 ? (
                <Box bold textAlign="center" fontSize="16px" color="average">
                  No Active Authorizations
                </Box>
              ) : (
========
              {authorizations.length > 0 ? (
>>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9:tgui/packages/tgui/interfaces/EmergencyShuttleConsole.jsx
                authorizations.map((authorization) => (
                  <Box
                    key={authorization.name}
                    bold
                    fontSize="16px"
                    className="candystripe"
                  >
                    {authorization.name} ({authorization.job})
                  </Box>
                ))
              )}
            </Section>
          </Section>
        </Section>
      </Window.Content>
    </Window>
  );
}
