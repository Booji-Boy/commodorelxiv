import { BooleanLike } from 'common/react';

import { useBackend } from '../backend';
import {
  Box,
  Button,
<<<<<<<< HEAD:tgui/packages/tgui/interfaces/DnaVault.tsx
  LabeledList,
  ProgressBar,
  Section,
  Stack,
} from '../components';
import { Window } from '../layouts';

type Data = {
  animals_max: number;
  animals: number;
  choiceA: string;
  choiceB: string;
  completed: BooleanLike;
  dna_max: number;
  dna: number;
  plants_max: number;
  plants: number;
  used: BooleanLike;
};

export function DnaVault(props) {
  const { act, data } = useBackend<Data>();
========
  Grid,
  LabeledList,
  ProgressBar,
  Section,
} from '../components';
import { Window } from '../layouts';

export const DnaVault = (props) => {
  const { act, data } = useBackend();
>>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9:tgui/packages/tgui/interfaces/DnaVault.jsx
  const {
    animals_max,
    animals,
    choiceA,
    choiceB,
    completed,
    dna_max,
    dna,
    plants_max,
    plants,
    used,
  } = data;

  return (
    <Window width={350} height={400}>
      <Window.Content>
        <Section title="DNA Vault Database">
          <LabeledList>
            <LabeledList.Item label="Human DNA">
              <ProgressBar value={dna / dna_max}>
                {dna + ' / ' + dna_max + ' Samples'}
              </ProgressBar>
            </LabeledList.Item>
            <LabeledList.Item label="Plant DNA">
              <ProgressBar value={plants / plants_max}>
                {plants + ' / ' + plants_max + ' Samples'}
              </ProgressBar>
            </LabeledList.Item>
            <LabeledList.Item label="Animal DNA">
              <ProgressBar value={animals / animals_max}>
                {animals + ' / ' + animals_max + ' Samples'}
              </ProgressBar>
            </LabeledList.Item>
          </LabeledList>
        </Section>
        {!!(completed && !used) && (
          <Section title="Personal Gene Therapy">
            <Box bold textAlign="center" mb={1}>
              Applicable Gene Therapy Treatments
            </Box>
            <Stack>
              <Stack.Item grow>
                <Button
                  fluid
                  bold
                  textAlign="center"
                  onClick={() =>
                    act('gene', {
                      choice: choiceA,
                    })
                  }
                >
                  {choiceA}
                </Button>
              </Stack.Item>
              <Stack.Item grow>
                <Button
                  fluid
                  bold
                  textAlign="center"
                  onClick={() =>
                    act('gene', {
                      choice: choiceB,
                    })
                  }
                >
                  {choiceB}
                </Button>
              </Stack.Item>
            </Stack>
          </Section>
        )}
      </Window.Content>
    </Window>
  );
}
