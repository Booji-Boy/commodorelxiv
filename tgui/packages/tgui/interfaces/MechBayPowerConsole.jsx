import { useBackend } from '../backend';
import {
<<<<<<< HEAD
=======
  AnimatedNumber,
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
  Button,
  LabeledList,
  NoticeBox,
  ProgressBar,
  Section,
} from '../components';
<<<<<<< HEAD
import { formatEnergy } from '../format';
=======
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
import { Window } from '../layouts';

export const MechBayPowerConsole = (props) => {
  const { act, data } = useBackend();
  const { recharge_port } = data;
  const mech = recharge_port && recharge_port.mech;
  const cell = mech && mech.cell;
  return (
    <Window width={400} height={200}>
      <Window.Content>
        <Section
          title="Mech status"
          textAlign="center"
          buttons={
            <Button
              icon="sync"
              content="Sync"
              onClick={() => act('reconnect')}
            />
          }
        >
          <LabeledList>
            <LabeledList.Item label="Integrity">
              {(!recharge_port && (
                <NoticeBox>No power port detected. Please re-sync.</NoticeBox>
              )) ||
                (!mech && <NoticeBox>No mech detected.</NoticeBox>) || (
                  <ProgressBar
                    value={mech.health / mech.maxhealth}
                    ranges={{
                      good: [0.7, Infinity],
                      average: [0.3, 0.7],
                      bad: [-Infinity, 0.3],
                    }}
                  />
                )}
            </LabeledList.Item>
            <LabeledList.Item label="Power">
              {(!recharge_port && (
                <NoticeBox>No power port detected. Please re-sync.</NoticeBox>
              )) ||
                (!mech && <NoticeBox>No mech detected.</NoticeBox>) ||
                (!cell && <NoticeBox>No cell is installed.</NoticeBox>) || (
                  <ProgressBar
                    value={cell.charge / cell.maxcharge}
                    ranges={{
                      good: [0.7, Infinity],
                      average: [0.3, 0.7],
                      bad: [-Infinity, 0.3],
                    }}
                  >
<<<<<<< HEAD
                    {formatEnergy(cell.charge) +
                      '/' +
                      formatEnergy(cell.maxcharge)}
=======
                    <AnimatedNumber value={cell.charge} />
                    {' / ' + cell.maxcharge}
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
                  </ProgressBar>
                )}
            </LabeledList.Item>
          </LabeledList>
        </Section>
      </Window.Content>
    </Window>
  );
};
