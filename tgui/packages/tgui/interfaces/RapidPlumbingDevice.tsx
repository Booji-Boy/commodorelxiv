<<<<<<< HEAD
import { BooleanLike, classes } from 'common/react';
import { capitalizeAll } from 'common/string';
import { useState } from 'react';

import { useBackend } from '../backend';
import { Box, Button, LabeledList, Section, Stack, Tabs } from '../components';
import { Window } from '../layouts';
import { MatterItem, SiloItem } from './RapidConstructionDevice';
import { ColorItem } from './RapidPipeDispenser';
=======
import { useBackend, useLocalState } from '../backend';
import { capitalizeAll } from 'common/string';
import { BooleanLike, classes } from 'common/react';
import { Window } from '../layouts';
import { Section, Tabs, Button, LabeledList, Stack, Box } from '../components';
import { ColorItem } from './RapidPipeDispenser';
import { SiloItem, MatterItem } from './RapidConstructionDevice';
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9

type Data = {
  silo_upgraded: BooleanLike;
  layer_icon: string;
  categories: Category[];
  selected_category: string;
  selected_recipe: string;
  piping_layer: number;
};

type Category = {
  cat_name: string;
  recipes: Recipe[];
  active: BooleanLike;
};

type Recipe = {
<<<<<<< HEAD
=======
  index: number;
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
  icon: string;
  selected: BooleanLike;
  name: string;
};

const PlumbingTypeSection = (props) => {
  const { act, data } = useBackend<Data>();
  const { categories = [], selected_category, selected_recipe } = data;
<<<<<<< HEAD
  const [categoryName, setCategoryName] = useState(selected_category);
  const shownCategory =
    categories.find((category) => category.cat_name === categoryName) ||
    categories[0];

=======
  const [categoryName, setCategoryName] = useLocalState(
    'categoryName',
    selected_category,
  );
  const shownCategory =
    categories.find((category) => category.cat_name === categoryName) ||
    categories[0];
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
  return (
    <Section fill scrollable>
      <Tabs>
        {categories.map((category) => (
          <Tabs.Tab
<<<<<<< HEAD
=======
            fluid
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
            key={category.cat_name}
            selected={category.cat_name === shownCategory.cat_name}
            onClick={() => setCategoryName(category.cat_name)}
          >
            {category.cat_name}
          </Tabs.Tab>
        ))}
      </Tabs>
<<<<<<< HEAD
      {shownCategory?.recipes.map((recipe, index) => (
        <Button
          key={index}
          fluid
=======
      {shownCategory?.recipes.map((recipe) => (
        <Button
          key={recipe.index}
          fluid
          ellipsis
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
          color="transparent"
          selected={recipe.name === selected_recipe}
          onClick={() =>
            act('recipe', {
<<<<<<< HEAD
              category: shownCategory.cat_name,
              id: index,
=======
              id: recipe.index,
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
            })
          }
        >
          <Box
            inline
            verticalAlign="middle"
            mr="20px"
<<<<<<< HEAD
            mb="10px"
            className={classes(['plumbing-tgui32x32', recipe.icon])}
            style={{
              transform: 'scale(1.3) translate(9.5%, 11.2%)',
=======
            className={classes(['plumbing-tgui32x32', recipe.icon])}
            style={{
              transform: 'scale(1.5) translate(9.5%, 9.5%)',
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
            }}
          />
          <span>{capitalizeAll(recipe.name)}</span>
        </Button>
      ))}
    </Section>
  );
};

<<<<<<< HEAD
=======
// MONKESTATION ADDITION -- added context to layer select and useBackend<Data>()
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
export const LayerSelect = (props) => {
  const { act, data } = useBackend<Data>();
  const { piping_layer } = data;
  return (
    <LabeledList.Item label="Layer">
      {[1, 2, 3, 4, 5].map((layer) => (
        <Button.Checkbox
          key={layer}
          checked={layer === piping_layer}
          content={layer}
          onClick={() =>
            act('piping_layer', {
              piping_layer: layer,
            })
          }
        />
      ))}
    </LabeledList.Item>
  );
};

const LayerIconSection = (props) => {
  const { data } = useBackend<Data>();
  const { layer_icon } = data;
  return (
    <Box
      m={1}
      className={classes(['plumbing-tgui32x32', layer_icon])}
      style={{
        transform: 'scale(2)',
      }}
    />
  );
};

export const RapidPlumbingDevice = (props) => {
  const { data } = useBackend<Data>();
  const { silo_upgraded } = data;
  return (
    <Window width={480} height={575}>
      <Window.Content>
        <Stack vertical fill>
          <Stack.Item>
            <Section>
              <Stack>
                <Stack.Item>
                  <ColorItem />
                  <LayerSelect />
                  <MatterItem />
                  {!!silo_upgraded && <SiloItem />}
                </Stack.Item>
                <Stack.Item>
                  <LayerIconSection />
                </Stack.Item>
              </Stack>
            </Section>
          </Stack.Item>
          <Stack.Item grow>
            <PlumbingTypeSection />
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};
