<<<<<<< HEAD
import { BooleanLike } from 'common/react';

import { useBackend, useSharedState } from '../backend';
=======
import { Window } from '../layouts';
import { useBackend } from '../backend';
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
import {
  Button,
  Collapsible,
  Icon,
  NoticeBox,
  ProgressBar,
  Section,
  Stack,
  Table,
<<<<<<< HEAD
  Tabs,
  Tooltip,
} from '../components';
import { TableCell, TableRow } from '../components/Table';
import { Window } from '../layouts';
import { LoadingScreen } from './common/LoadingToolbox';
=======
  Tooltip,
} from '../components';
import { BooleanLike } from 'common/react';
import { LoadingScreen } from './common/LoadingToolbox';
import { TableCell, TableRow } from '../components/Table';
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9

type Data =
  | {
      available_domains: Domain[];
      avatars: Avatar[];
      connected: 1;
      generated_domain: string | null;
      occupants: number;
      points: number;
      randomized: BooleanLike;
      ready: BooleanLike;
      retries_left: number;
      scanner_tier: number;
<<<<<<< HEAD
      broadcasting: BooleanLike;
      broadcasting_on_cd: BooleanLike;
=======
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
    }
  | {
      connected: 0;
    };

type Avatar = {
  health: number;
  name: string;
  pilot: string;
  brute: number;
  burn: number;
  tox: number;
  oxy: number;
};

type Domain = {
  cost: number;
  desc: string;
  difficulty: number;
  id: string;
<<<<<<< HEAD
  is_modular: BooleanLike;
  has_secondary_objectives: BooleanLike;
=======
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
  name: string;
  reward: number | string;
};

type DomainEntryProps = {
  domain: Domain;
};

type DisplayDetailsProps = {
  amount: number | string;
  color: string;
  icon: string;
};

enum Difficulty {
  None,
  Low,
  Medium,
  High,
}

const isConnected = (data: Data): data is Data & { connected: 1 } =>
  data.connected === 1;

const getColor = (difficulty: number) => {
  switch (difficulty) {
    case Difficulty.Low:
      return 'yellow';
    case Difficulty.Medium:
      return 'average';
    case Difficulty.High:
      return 'bad';
    default:
<<<<<<< HEAD
      return 'green';
=======
      return '';
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
  }
};

export const QuantumConsole = (props) => {
  const { data } = useBackend<Data>();

  return (
    <Window title="Quantum Console" width={500} height={500}>
      <Window.Content>
        {!!data.connected && !data.ready && <LoadingScreen />}
        <AccessView />
      </Window.Content>
    </Window>
  );
};

const AccessView = (props) => {
  const { act, data } = useBackend<Data>();
<<<<<<< HEAD
  const [tab, setTab] = useSharedState('tab', 0);

  if (!isConnected(data)) {
    return <NoticeBox danger>No server connected!</NoticeBox>;
=======

  if (!isConnected(data)) {
    return <NoticeBox error>No server connected!</NoticeBox>;
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
  }

  const {
    available_domains = [],
<<<<<<< HEAD
    broadcasting,
    broadcasting_on_cd,
    generated_domain,
    occupants,
    points,
    randomized,
    ready,
=======
    generated_domain,
    ready,
    occupants,
    points,
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
  } = data;

  const sorted = available_domains.sort((a, b) => a.cost - b.cost);

<<<<<<< HEAD
  const filtered = sorted.filter((domain) => {
    return domain.difficulty === tab;
  });

  let selected;
  if (generated_domain) {
    selected = randomized
      ? '???'
      : sorted.find(({ id }) => id === generated_domain)?.name;
  } else {
    selected = 'Nothing loaded';
  }
=======
  const selected = sorted.find(({ id }) => id === generated_domain);
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9

  return (
    <Stack fill vertical>
      <Stack.Item grow>
        <Section
          buttons={
            <>
<<<<<<< HEAD
              <Button.Checkbox
                checked={broadcasting}
                disabled={broadcasting_on_cd}
                onClick={() => act('broadcast')}
                tooltip="Toggles whether you broadcast your
                  bitrun to station Entertainment Monitors."
              >
                Broadcast
              </Button.Checkbox>
=======
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
              <Button
                disabled={
                  !ready || occupants > 0 || points < 1 || !!generated_domain
                }
                icon="random"
                onClick={() => act('random_domain')}
                mr={1}
<<<<<<< HEAD
                tooltip="Get a random domain for more rewards.
                  Weighted towards your current points. Minimum: 1 point."
=======
                tooltip="Get a random domain for more rewards. Weighted towards your current points. Minimum: 1 point."
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
              >
                Randomize
              </Button>
              <Tooltip content="Accrued points for purchasing domains.">
                <Icon color="pink" name="star" mr={1} />
                {points}
              </Tooltip>
            </>
          }
          fill
          scrollable
          title="Virtual Domains"
        >
<<<<<<< HEAD
          <Tabs fluid>
            <Tabs.Tab
              backgroundColor={getColor(Difficulty.None)}
              textColor="white"
              selected={tab === 0}
              onClick={() => setTab(0)}
              icon="chevron-down"
            >
              Peaceful
            </Tabs.Tab>
            <Tabs.Tab
              backgroundColor={getColor(Difficulty.Low)}
              textColor="black"
              selected={tab === 1}
              onClick={() => setTab(1)}
              icon="chevron-down"
            >
              Easy
            </Tabs.Tab>
            <Tabs.Tab
              backgroundColor={getColor(Difficulty.Medium)}
              textColor="white"
              selected={tab === 2}
              onClick={() => setTab(2)}
              icon="chevron-down"
            >
              Medium
            </Tabs.Tab>
            <Tabs.Tab
              backgroundColor={getColor(Difficulty.High)}
              textColor="white"
              selected={tab === 3}
              onClick={() => setTab(3)}
              icon="chevron-down"
            >
              Hard <Icon name="skull" ml={1} />{' '}
            </Tabs.Tab>
          </Tabs>
          {filtered.map((domain) => (
=======
          {sorted.map((domain) => (
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
            <DomainEntry key={domain.id} domain={domain} />
          ))}
        </Section>
      </Stack.Item>
      <Stack.Item>
        <AvatarDisplay />
      </Stack.Item>
      <Stack.Item>
        <Section>
          <Stack fill>
            <Stack.Item grow>
<<<<<<< HEAD
              <NoticeBox info={!!generated_domain}>{selected}</NoticeBox>
=======
              <NoticeBox info={!!generated_domain}>
                {selected?.name ?? 'Nothing loaded'}
              </NoticeBox>
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
            </Stack.Item>
            <Stack.Item>
              <Button.Confirm
                content="Stop Domain"
                disabled={!ready || !generated_domain}
                onClick={() => act('stop_domain')}
                tooltip="Begins shutdown. Will notify anyone connected."
              />
            </Stack.Item>
          </Stack>
        </Section>
      </Stack.Item>
    </Stack>
  );
};

const DomainEntry = (props: DomainEntryProps) => {
  const {
<<<<<<< HEAD
    domain: {
      cost,
      desc,
      difficulty,
      id,
      is_modular,
      has_secondary_objectives,
      name,
      reward,
    },
=======
    domain: { cost, desc, difficulty, id, name, reward },
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
  } = props;
  const { act, data } = useBackend<Data>();
  if (!isConnected(data)) {
    return null;
  }

  const { generated_domain, ready, occupants, randomized, points } = data;

  const current = generated_domain === id;
  const occupied = occupants > 0;
  let buttonIcon, buttonName;
  if (randomized) {
    buttonIcon = '';
    buttonName = '???';
  } else if (current) {
    buttonIcon = 'download';
    buttonName = 'Deployed';
  } else {
    buttonIcon = 'coins';
    buttonName = 'Deploy';
  }

  return (
    <Collapsible
      buttons={
        <Button
          disabled={!!generated_domain || !ready || occupied || points < cost}
          icon={buttonIcon}
          onClick={() => act('set_domain', { id })}
          tooltip={!!generated_domain && 'Stop current domain first.'}
        >
          {buttonName}
        </Button>
      }
      color={getColor(difficulty)}
      title={
        <>
          {name}
<<<<<<< HEAD
          {!!is_modular && name !== '???' && <Icon name="cubes" ml={1} />}
          {!!has_secondary_objectives && name !== '???' && (
            <Icon name="gem" ml={1} />
          )}
=======
          {difficulty === Difficulty.High && <Icon name="skull" ml={1} />}
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
        </>
      }
    >
      <Stack height={5}>
        <Stack.Item color="label" grow={4}>
          {desc}
<<<<<<< HEAD
          {!!is_modular && ' (Modular)'}
          {!!has_secondary_objectives && ' (Secondary Objective Available)'}
=======
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
        </Stack.Item>
        <Stack.Divider />
        <Stack.Item grow>
          <Table>
            <TableRow>
<<<<<<< HEAD
              <Tooltip content="Points cost for deploying domain.">
                <DisplayDetails amount={cost} color="pink" icon="star" />
              </Tooltip>
            </TableRow>
            <TableRow>
              <Tooltip content="Reward for competing domain.">
                <DisplayDetails amount={reward} color="gold" icon="coins" />
              </Tooltip>
=======
              <DisplayDetails amount={cost} color="pink" icon="star" />
            </TableRow>
            <TableRow>
              <DisplayDetails amount={difficulty} color="white" icon="skull" />
            </TableRow>
            <TableRow>
              <DisplayDetails amount={reward} color="gold" icon="coins" />
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
            </TableRow>
          </Table>
        </Stack.Item>
      </Stack>
    </Collapsible>
  );
};

const AvatarDisplay = (props) => {
  const { act, data } = useBackend<Data>();
  if (!isConnected(data)) {
    return null;
  }

  const { avatars = [], generated_domain, retries_left } = data;

  return (
    <Section
      title="Connected Clients"
      buttons={
        <Stack align="center">
          {!!generated_domain && (
            <Stack.Item>
              <Tooltip content="Available bandwidth for new connections.">
                <DisplayDetails
                  color="green"
                  icon="broadcast-tower"
                  amount={retries_left}
                />
              </Tooltip>
            </Stack.Item>
          )}
          <Stack.Item>
            <Button
              icon="sync"
              onClick={() => act('refresh')}
              tooltip="Refresh avatar data."
            >
              Refresh
            </Button>
          </Stack.Item>
        </Stack>
      }
    >
      <Table>
        {avatars.map(({ health, name, pilot, brute, burn, tox, oxy }) => (
          <TableRow key={name}>
            <TableCell color="label">
              {pilot} as{' '}
              <span style={{ color: 'white' }}>&quot;{name}&quot;</span>
            </TableCell>
            <TableCell collapsing>
              <Stack>
                {brute === 0 && burn === 0 && tox === 0 && oxy === 0 && (
                  <Stack.Item>
                    <Icon color="green" name="check" />
                  </Stack.Item>
                )}
                <Stack.Item>
                  <Icon color={brute > 50 ? 'bad' : 'gray'} name="tint" />
                </Stack.Item>
                <Stack.Item>
                  <Icon color={burn > 50 ? 'average' : 'gray'} name="fire" />
                </Stack.Item>
                <Stack.Item>
                  <Icon
                    color={tox > 50 ? 'green' : 'gray'}
                    name="skull-crossbones"
                  />
                </Stack.Item>
                <Stack.Item>
                  <Icon color={oxy > 50 ? 'blue' : 'gray'} name="lungs" />
                </Stack.Item>
              </Stack>
            </TableCell>
            <TableCell>
              <ProgressBar
                minValue={-100}
                maxValue={100}
                ranges={{
                  good: [90, Infinity],
                  average: [50, 89],
                  bad: [-Infinity, 45],
                }}
                value={health}
              />
            </TableCell>
          </TableRow>
        ))}
      </Table>
    </Section>
  );
};

const DisplayDetails = (props: DisplayDetailsProps) => {
  const { amount = 0, color, icon = 'star' } = props;

  if (amount === 0) {
<<<<<<< HEAD
    return <TableCell color="label">None</TableCell>;
=======
    return <TableCell color="label">No bandwidth</TableCell>;
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
  }

  if (typeof amount === 'string') {
    return <TableCell color="label">{String(amount)}</TableCell>; // don't ask
  }

  if (amount > 4) {
    return (
      <TableCell>
        <Stack>
          <Stack.Item>{amount}</Stack.Item>
          <Stack.Item>
            <Icon color={color} name={icon} />
          </Stack.Item>
        </Stack>
      </TableCell>
    );
  }

  return (
    <TableCell>
      <Stack>
        {Array.from({ length: amount }, (_, index) => (
<<<<<<< HEAD
          <Stack.Item key={index}>
            <Icon color={color} name={icon} />
=======
          <Stack.Item>
            <Icon color={color} key={index} name={icon} />
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
          </Stack.Item>
        ))}
      </Stack>
    </TableCell>
  );
};
