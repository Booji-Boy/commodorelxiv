import { useState } from 'react';

import { useBackend } from '../backend';
import { Icon, ProgressBar, Tabs } from '../components';
import { Window } from '../layouts';

type Data = {
  telebeacons: Trackable[];
  trackimplants: Trackable[];
  trackingrange: number;
};

type Trackable = {
  name: string;
  distance: string;
  direction: number;
};

const DIRECTION_TO_ICON = {
  north: 0,
  northeast: 45,
  east: 90,
  southeast: 135,
  south: 180,
  southwest: 225,
  west: 270,
  northwest: 315,
} as const;

<<<<<<< HEAD
enum TAB {
  Implant,
  Beacon,
}

export const BluespaceLocator = (props) => {
  const [tab, setTab] = useState(TAB.Implant);
=======
export const BluespaceLocator = (props) => {
  const [tab, setTab] = useLocalState('tab', 'implant');
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9

  return (
    <Window width={300} height={300}>
      <Window.Content scrollable>
        <Tabs>
          <Tabs.Tab
<<<<<<< HEAD
            selected={tab === TAB.Implant}
            onClick={() => setTab(TAB.Implant)}
=======
            selected={tab === 'implant'}
            onClick={() => setTab('implant')}
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
          >
            Implants
          </Tabs.Tab>
          <Tabs.Tab
<<<<<<< HEAD
            selected={tab === TAB.Beacon}
            onClick={() => setTab(TAB.Beacon)}
=======
            selected={tab === 'beacon'}
            onClick={() => setTab('beacon')}
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
          >
            Teleporter Beacons
          </Tabs.Tab>
        </Tabs>
        {(TAB.Beacon && <TeleporterBeacons />) ||
          (TAB.Implant && <TrackingImplants />)}
      </Window.Content>
    </Window>
  );
};

const TeleporterBeacons = (props) => {
  const { data } = useBackend<Data>();
  const { telebeacons } = data;

  return (
    <>
      {telebeacons.map((beacon) => (
        <SignalLocator
          key={beacon.name}
          name={beacon.name}
          distance={beacon.distance}
          direction={DIRECTION_TO_ICON[beacon.direction]}
        />
      ))}
    </>
  );
};

const TrackingImplants = (props) => {
  const { data } = useBackend<Data>();
  const { trackimplants } = data;

  return (
    <>
      {trackimplants.map((implant) => (
        <SignalLocator
          key={implant.name}
          name={implant.name}
          distance={implant.distance}
          direction={DIRECTION_TO_ICON[implant.direction]}
        />
      ))}
    </>
  );
};

const SignalLocator = (props) => {
  const { data } = useBackend<Data>();
  const { trackingrange } = data;
  const { name, direction, distance } = props;

  return (
    <ProgressBar
      mb={1}
      value={trackingrange - distance}
      minValue={0}
      maxValue={trackingrange}
      ranges={{
        red: [0, trackingrange / 3],
        yellow: [trackingrange / 3, 2 * (trackingrange / 3)],
        green: [2 * (trackingrange / 3), trackingrange],
      }}
    >
      {name}
      <Icon ml={2} name="arrow-up" rotation={direction} />
    </ProgressBar>
  );
};
