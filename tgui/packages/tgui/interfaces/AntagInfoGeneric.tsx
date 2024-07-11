import { useBackend } from '../backend';
import { Section, Stack } from '../components';
import { Window } from '../layouts';
<<<<<<< HEAD
import { Objective, ObjectivePrintout } from './common/Objectives';
=======
import { ObjectivePrintout, Objective } from './common/Objectives';
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9

type Info = {
  antag_name: string;
  objectives: Objective[];
};

export const AntagInfoGeneric = (props) => {
  const { data } = useBackend<Info>();
  const { antag_name, objectives } = data;
  return (
    <Window width={620} height={250}>
      <Window.Content>
        <Section scrollable fill>
          <Stack vertical>
            <Stack.Item textColor="red" fontSize="20px">
              You are the {antag_name}!
            </Stack.Item>
            <Stack.Item>
              <ObjectivePrintout objectives={objectives} />
            </Stack.Item>
          </Stack>
        </Section>
      </Window.Content>
    </Window>
  );
};
