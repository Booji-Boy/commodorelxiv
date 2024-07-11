import { filter, sortBy } from 'common/collections';
<<<<<<< HEAD
import { toFixed } from 'common/math';
import { BooleanLike } from 'common/react';

=======
import { flow } from 'common/fp';
import { toFixed } from 'common/math';
import { BooleanLike } from 'common/react';
import { multiline } from 'common/string';
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
import { useBackend } from '../backend';
import {
  Button,
  NumberInput,
  ProgressBar,
  Section,
  Stack,
} from '../components';
import { Table, TableCell, TableRow } from '../components/Table';
import { getGasColor } from '../constants';
import { Window } from '../layouts';

type Data = {
  bluespace_network_gases: Gas[];
  credits: number;
  inserted_tank: BooleanLike;
  pumping: BooleanLike;
  selected_gas: string;
  tank_amount: number;
  tank_filling_amount: number;
  tank_full: number;
};

type Gas = {
  name: string;
  amount: number;
  price: number;
  id: string;
};

type GasDisplayProps = {
  gas: Gas;
  gasMax: number;
};

export const BluespaceVendor = (props) => {
  const { act, data } = useBackend<Data>();
  const {
    bluespace_network_gases = [],
    inserted_tank,
    pumping,
    tank_amount,
    tank_filling_amount,
    tank_full,
  } = data;

<<<<<<< HEAD
  const gases: Gas[] = sortBy(
    filter(bluespace_network_gases, (gas) => gas.amount >= 0.01),
    (gas) => -gas.amount,
  );
=======
  const gases: Gas[] = flow([
    filter<Gas>((gas) => gas.amount >= 0.01),
    sortBy<Gas>((gas) => -gas.amount),
  ])(bluespace_network_gases);
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9

  const gasMax = Math.max(1, ...gases.map((gas) => gas.amount));

  return (
    <Window title="Bluespace Vendor" width={500} height={600}>
      <Window.Content>
        <Stack vertical fill>
          <Stack.Item>
            <Section
              title="Controls"
              buttons={
                <>
                  <Button
                    ml={1}
                    icon="plus"
                    content="Prepare Tank"
                    disabled={pumping || inserted_tank || !tank_amount}
                    onClick={() => act('tank_prepare')}
                  />
                  <Button
                    ml={1}
                    icon="minus"
                    content="Remove Tank"
                    disabled={pumping || !inserted_tank}
                    onClick={() => act('tank_expel')}
                  />
                </>
              }
            >
              <Stack>
                <Stack.Item>
                  <NumberInput
                    animated
                    value={tank_filling_amount}
<<<<<<< HEAD
                    step={1}
=======
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
                    width="63px"
                    unit="% tank filling goal"
                    minValue={0}
                    maxValue={100}
<<<<<<< HEAD
                    onDrag={(value) =>
=======
                    onDrag={(e, value) =>
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
                      act('pumping_rate', {
                        rate: value,
                      })
                    }
                  />
                </Stack.Item>
                <Stack.Item grow>
                  {
                    <ProgressBar
                      value={tank_full / 1010}
                      ranges={{
                        good: [0.67, 1],
                        average: [0.34, 0.66],
                        bad: [0, 0.33],
                      }}
                    />
                  }
                </Stack.Item>
              </Stack>
            </Section>
          </Stack.Item>
          <Stack.Item grow>
            <Section
              scrollable
              fill
              title="Bluespace Network Gases"
              buttons={
                <Button
                  color="transparent"
                  icon="info"
                  tooltipPosition="bottom-start"
<<<<<<< HEAD
                  tooltip={`
=======
                  tooltip={multiline`
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
                  Quick guide for machine use: Prepare a tank to create a
                  new one in the machine, pick how much you want it filled,
                  and finally press start on the gas of your choice!
                `}
                />
              }
            >
              <Table>
                <thead>
                  <TableRow>
                    <TableCell collapsing bold>
                      Gas
                    </TableCell>
                    <TableCell bold collapsing>
                      Price
                    </TableCell>
                    <TableCell bold>Total</TableCell>
                    <TableCell bold collapsing textAlign="right">
                      Moles
                    </TableCell>
                    <TableCell bold collapsing />
                  </TableRow>
                </thead>
                <tbody>
                  {gases.map((gas, index) => (
                    <GasDisplay gasMax={gasMax} gas={gas} key={index} />
                  ))}
                </tbody>
              </Table>
            </Section>
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};

const GasDisplay = (props: GasDisplayProps) => {
  const { act, data } = useBackend<Data>();
  const { pumping, selected_gas, inserted_tank } = data;
  const {
    gas: { name, amount, price, id },
    gasMax,
  } = props;

  return (
    <TableRow className="candystripe" height={2}>
      <TableCell collapsing color="label">
        {name}
      </TableCell>
      <TableCell color="yellow" collapsing textAlign="right">
        {price} cr
      </TableCell>
      <TableCell>
        <ProgressBar
          color={getGasColor(id)}
          value={amount}
          minValue={0}
          maxValue={gasMax}
        />
      </TableCell>
      <TableCell collapsing color="label" textAlign="right">
        {toFixed(amount, 2)}
      </TableCell>
      <TableCell collapsing textAlign="center">
        {(!pumping && selected_gas !== id && (
          <Button
            icon="play"
            tooltipPosition="left"
            tooltip={'Start adding ' + name + '.'}
            disabled={!inserted_tank}
            onClick={() =>
              act('start_pumping', {
                gas_id: id,
              })
            }
          />
        )) || (
          <Button
            disabled={selected_gas !== id}
            icon="minus"
            tooltipPosition="left"
            tooltip={'Stop adding ' + name + '.'}
            onClick={() =>
              act('stop_pumping', {
                gas_id: id,
              })
            }
          />
        )}
      </TableCell>
    </TableRow>
  );
};
