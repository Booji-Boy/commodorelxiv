import { BooleanLike } from 'common/react';
import { classes } from 'common/react';
<<<<<<< HEAD
import { useState } from 'react';
=======
import { useBackend, useLocalState } from '../backend';
import { Window } from '../layouts';
import {
  Box,
  Section,
  NumberInput,
  Table,
  Tabs,
  LabeledList,
  NoticeBox,
  Button,
  ProgressBar,
  Stack,
} from '../components';
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9

import { useBackend } from '../backend';
import {
  Box,
  Button,
  Icon,
  LabeledList,
  NoticeBox,
  NumberInput,
  ProgressBar,
  Section,
  Stack,
  Table,
  Tabs,
} from '../components';
import { Window } from '../layouts';

type Data = {
  beaker: BooleanLike;
  beakerCurrentVolume: number;
  beakerMaxVolume: number;
  biomass: number;
  can_process: BooleanLike;
  categories: Category[];
  efficiency: number;
  max_output: number;
  max_visual_biomass: number;
  processing: BooleanLike;
  reagent_color: string;
};

type Category = {
  items: Design[];
  name: string;
};

type Design = {
  amount: number;
  cost: number;
  disable: BooleanLike;
  id: string;
  is_reagent: BooleanLike;
  name: string;
};

<<<<<<< HEAD
export function Biogenerator(props) {
  const { data } = useBackend<Data>();
  const { beaker, beakerCurrentVolume, beakerMaxVolume, categories } = data;

  const [selectedCategory, setSelectedCategory] = useState(
=======
export const Biogenerator = (props) => {
  const { act, data } = useBackend<BiogeneratorData>();
  const {
    processing,
    beaker,
    reagent_color,
    biomass,
    max_visual_biomass,
    can_process,
    beakerCurrentVolume,
    beakerMaxVolume,
    max_output,
    efficiency,
    categories,
  } = data;
  const [selectedCategory, setSelectedCategory] = useLocalState<string>(
    'category',
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
    data.categories[0]?.name,
  );

  const items =
    categories.find((category) => category.name === selectedCategory)?.items ||
    [];

  const space = beaker ? beakerMaxVolume - beakerCurrentVolume : 1;

  return (
    <Window width={400} height={525}>
      <Window.Content>
        <Stack vertical fill>
          <Stack.Item>
<<<<<<< HEAD
            <Controls />
=======
            <Section fill minHeight="80px">
              <LabeledList>
                <LabeledList.Item
                  label="Biomass"
                  buttons={
                    <Button
                      width={7}
                      lineHeight={2}
                      align="center"
                      icon="cog"
                      iconSpin={processing ? 1 : 0}
                      content="Generate"
                      disabled={!can_process || processing}
                      onClick={() => act('activate')}
                    />
                  }
                >
                  <ProgressBar
                    value={biomass}
                    minValue={0}
                    maxValue={max_visual_biomass}
                    color="good"
                  >
                    <Box
                      lineHeight={1.9}
                      style={{
                        'text-shadow': '1px 1px 0 black',
                      }}
                    >
                      {`${parseFloat(biomass.toFixed(2))} units`}
                    </Box>
                  </ProgressBar>
                </LabeledList.Item>
                {!!beaker && (
                  <LabeledList.Item
                    label="Container"
                    buttons={
                      <Button
                        width={7}
                        lineHeight={2}
                        align="center"
                        icon="eject"
                        content="Eject"
                        onClick={() => act('eject')}
                      />
                    }
                  >
                    <ProgressBar
                      value={beakerCurrentVolume}
                      minValue={0}
                      height={2}
                      maxValue={beakerMaxVolume}
                      color={reagent_color}
                    >
                      <Box
                        lineHeight={1.9}
                        style={{
                          'text-shadow': '1px 1px 0 black',
                        }}
                      >
                        {`${beakerCurrentVolume} of ${beakerMaxVolume} units`}
                      </Box>
                    </ProgressBar>
                  </LabeledList.Item>
                )}
                {!beaker && (
                  <LabeledList.Item label="Container">
                    <NoticeBox m={0} height={2}>
                      No liquid container
                    </NoticeBox>
                  </LabeledList.Item>
                )}
              </LabeledList>
            </Section>
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
          </Stack.Item>
          <Stack.Item>
            <Tabs fluid>
              {categories.map(({ name }) => (
                <Tabs.Tab
                  align="center"
<<<<<<< HEAD
                  key={name}
                  selected={name === selectedCategory}
                  onClick={() => setSelectedCategory(name)}
                >
                  {name}
=======
                  key={category.name}
                  selected={category.name === selectedCategory}
                  onClick={() => setSelectedCategory(category.name)}
                >
                  {category.name}
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
                </Tabs.Tab>
              ))}
            </Tabs>
          </Stack.Item>
          <Stack.Item grow mt="2px">
            <Section fill scrollable>
              <Table>
                {items.map((item) => (
                  <Item key={item.id} item={item} space={space} />
                ))}
              </Table>
            </Section>
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
}

function Controls() {
  const { act, data } = useBackend<Data>();
  const {
    beaker,
    beakerCurrentVolume,
    beakerMaxVolume,
    biomass,
    can_process,
    max_visual_biomass,
    processing,
    reagent_color,
  } = data;

  return (
    <Section fill>
      <LabeledList>
        <LabeledList.Item
          label="Biomass"
          buttons={
            <Button
              width={7}
              lineHeight={2}
              align="center"
              icon="cog"
              iconSpin={processing ? 1 : 0}
              disabled={!can_process || processing}
              onClick={() => act('activate')}
            >
              Generate
            </Button>
          }
        >
          <ProgressBar
            value={biomass}
            minValue={0}
            maxValue={max_visual_biomass}
            color="good"
          >
            <Box
              lineHeight={1.9}
              style={{
                textShadow: '1px 1px 0 black',
              }}
            >
              {`${parseFloat(biomass.toFixed(2))} units`}
            </Box>
          </ProgressBar>
        </LabeledList.Item>
        {!!beaker && (
          <LabeledList.Item
            label="Container"
            buttons={
              <Button
                width={7}
                lineHeight={2}
                align="center"
                icon="eject"
                onClick={() => act('eject')}
              >
                Eject
              </Button>
            }
          >
            <ProgressBar
              value={beakerCurrentVolume}
              minValue={0}
              height={2}
              maxValue={beakerMaxVolume}
              color={reagent_color}
            >
              <Box
                lineHeight={1.9}
                style={{
                  textShadow: '1px 1px 0 black',
                }}
              >
                {`${beakerCurrentVolume} of ${beakerMaxVolume} units`}
              </Box>
            </ProgressBar>
          </LabeledList.Item>
        )}
        {!beaker && (
          <LabeledList.Item label="Container">
            <NoticeBox m={0} height={2}>
              No liquid container
            </NoticeBox>
          </LabeledList.Item>
        )}
      </LabeledList>
    </Section>
  );
}

type Props = {
  item: Design;
  space: number;
};

<<<<<<< HEAD
function Item(props: Props) {
  const { item, space } = props;
  const { cost, id, is_reagent, name } = item;

  const { act, data } = useBackend<Data>();
  const { biomass, beaker, efficiency, max_output, processing } = data;

  const minAmount = is_reagent ? Math.min(Math.max(space, 1), 10) : 1;

  const [amount, setAmount] = useState(minAmount);

  const disabled =
    processing ||
    (is_reagent && !beaker) ||
    (is_reagent && space < amount) ||
    biomass < Math.ceil((cost * amount) / efficiency);

  const maxPossible = Math.floor((efficiency * biomass) / cost);

  const maxCapacity = is_reagent ? space : max_output;
  const maxAmount = Math.max(1, Math.min(maxCapacity, maxPossible));

  return (
    <Table.Row>
=======
const ItemList = (props) => {
  const { act } = useBackend();
  const items = props.items.map((item) => {
    const [amount, setAmount] = useLocalState(
      'amount' + item.name,
      item.is_reagent ? Math.min(Math.max(props.space, 1), 10) : 1,
    );
    const disabled =
      props.processing ||
      (item.is_reagent && !props.beaker) ||
      (item.is_reagent && props.space < amount) ||
      props.biomass < Math.ceil((item.cost * amount) / props.efficiency);
    const max_possible = Math.floor(
      (props.efficiency * props.biomass) / item.cost,
    );
    const max_capacity = item.is_reagent ? props.space : props.max_output;
    const max_amount = Math.max(1, Math.min(max_capacity, max_possible));
    return {
      ...item,
      disabled,
      max_amount,
      amount,
      setAmount,
    };
  });
  return items.map((item) => (
    <Table.Row key={item.id}>
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
      <Table.Cell>
        <span
          className={classes(['design32x32', id])}
          style={{
            verticalAlign: 'middle',
          }}
        />{' '}
        <b>{name}</b>
      </Table.Cell>
      <Table.Cell collapsing>
        <NumberInput
          value={amount}
          step={1}
          width="40px"
          minValue={1}
          maxValue={maxAmount}
          onChange={(value) => setAmount(value)}
        />
      </Table.Cell>
      <Table.Cell collapsing>
        <Button
          align="right"
<<<<<<< HEAD
          width={5}
          pr={0}
          disabled={disabled}
=======
          content={
            parseFloat(
              ((item.cost * item.amount) / props.efficiency).toFixed(2),
            ) + ' BIO'
          }
          disabled={item.disabled}
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
          onClick={() =>
            act('create', {
              id,
              amount,
            })
          }
        >
          {parseFloat((cost * amount).toFixed(2))} <Icon name="leaf" />
        </Button>
      </Table.Cell>
    </Table.Row>
  );
}
