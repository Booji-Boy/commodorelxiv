import { BooleanLike } from 'common/react';
<<<<<<< HEAD
import { useState } from 'react';

import { useBackend } from '../backend';
import { Button, LabeledList, Section, Stack, Tabs } from '../components';
import { Window } from '../layouts';
import {
  ColorItem,
  ICON_BY_CATEGORY_NAME,
=======
import { useBackend, useLocalState } from '../backend';
import { Button, LabeledList, Section, Stack, Tabs } from '../components';
import { Window } from '../layouts';
import {
  ICON_BY_CATEGORY_NAME,
  ColorItem,
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
  SmartPipeBlockSection,
} from './RapidPipeDispenser';
import { LayerSelect } from './RapidPlumbingDevice';

type Data = {
  // Dynamic
  category: number;
  piping_layer: number;
  categories: Category[];
  selected_color: string;
  init_directions: Directions;
  // Static
  paint_colors: Colors;
};

type Directions = {
  north: BooleanLike;
  south: BooleanLike;
  east: BooleanLike;
  west: BooleanLike;
};

type Colors = {
  green: string;
  blue: string;
  red: string;
  orange: string;
  cyan: string;
  dark: string;
  yellow: string;
  brown: string;
  pink: string;
  purple: string;
  violet: string;
  omni: string;
};

type Category = {
  cat_name: string;
  recipes: Recipe[];
};

type Recipe = {
  pipe_name: string;
  pipe_index: number;
  all_layers: BooleanLike;
  dir: number;
};

const PipeTypeSection = (props) => {
  const { act, data } = useBackend<Data>();
  const { categories = [] } = data;
<<<<<<< HEAD
  const [categoryName, setCategoryName] = useState(categories[0].cat_name);
  const shownCategory =
    categories.find((category) => category.cat_name === categoryName) ||
    categories[0];

=======
  const [categoryName, setCategoryName] = useLocalState(
    'categoryName',
    categories[0].cat_name,
  );
  const shownCategory =
    categories.find((category) => category.cat_name === categoryName) ||
    categories[0];
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
  return (
    <Section fill scrollable>
      <Tabs>
        {categories.map((category, i) => (
          <Tabs.Tab
<<<<<<< HEAD
=======
            fluid
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
            key={category.cat_name}
            icon={ICON_BY_CATEGORY_NAME[category.cat_name]}
            selected={category.cat_name === shownCategory.cat_name}
            onClick={() => setCategoryName(category.cat_name)}
          >
            {category.cat_name}
          </Tabs.Tab>
        ))}
      </Tabs>
      {shownCategory?.recipes.map((recipe) => (
        <Button
          key={recipe.pipe_index}
          fluid
          ellipsis
<<<<<<< HEAD
          tooltip={recipe.pipe_name}
=======
          content={recipe.pipe_name}
          title={recipe.pipe_name}
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
          onClick={() =>
            act('pipe_type', {
              pipe_type: recipe.pipe_index,
              pipe_dir: recipe.dir,
              category: shownCategory.cat_name,
            })
          }
<<<<<<< HEAD
        >
          {recipe.pipe_name}
        </Button>
=======
        />
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
      ))}
    </Section>
  );
};

export const PipeDispenser = (props) => {
  const { act, data } = useBackend<Data>();
  const { category: rootCategoryIndex } = data;
  return (
    <Window width={530} height={530}>
      <Window.Content>
        <Stack fill vertical>
          {rootCategoryIndex === 0 && (
            <Stack.Item>
              <Stack fill>
                <Stack.Item grow>
                  <Section>
                    <LabeledList>
                      <ColorItem />
                      <LayerSelect />
                    </LabeledList>
                  </Section>
                </Stack.Item>
                <Stack.Item width="90px">
                  <SmartPipeBlockSection />
                </Stack.Item>
              </Stack>
            </Stack.Item>
          )}
          <Stack.Item grow>
            <PipeTypeSection />
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};
