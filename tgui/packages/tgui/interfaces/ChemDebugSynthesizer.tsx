import { useBackend } from '../backend';
<<<<<<< HEAD
import { Button, NumberInput, Section } from '../components';
=======
import {
  AnimatedNumber,
  Box,
  Button,
  LabeledList,
  NumberInput,
  Section,
} from '../components';
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
import { Window } from '../layouts';
import { Beaker, BeakerDisplay } from './common/BeakerDisplay';

type Data = {
  amount: number;
  purity: number;
  beaker: Beaker;
};

export const ChemDebugSynthesizer = (props) => {
  const { act, data } = useBackend<Data>();
<<<<<<< HEAD
  const { amount, purity, beaker } = data;
=======
  const {
    amount,
    purity,
    beakerCurrentVolume,
    beakerMaxVolume,
    isBeakerLoaded,
    beakerContents = [],
  } = data;
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9

  return (
    <Window width={390} height={330}>
      <Window.Content scrollable>
        <Section
          title="Recipient"
          buttons={
            beaker ? (
              <>
                <NumberInput
                  value={amount}
                  unit="u"
                  minValue={1}
                  maxValue={beaker.maxVolume}
                  step={1}
                  stepPixelSize={2}
                  onChange={(value) =>
                    act('amount', {
                      amount: value,
                    })
                  }
                />
                <NumberInput
                  value={purity}
                  unit="%"
                  minValue={0}
                  maxValue={120}
                  step={1}
                  stepPixelSize={2}
                  onChange={(value) =>
                    act('purity', {
                      amount: value,
                    })
                  }
                />
                <Button
                  icon="plus"
                  content="Input"
                  onClick={() => act('input')}
                />
              </>
            ) : (
              <Button
                icon="plus"
                content="Create Beaker"
                onClick={() => act('makecup')}
              />
            )
          }
        >
<<<<<<< HEAD
          <BeakerDisplay beaker={beaker} showpH />
=======
          {isBeakerLoaded ? (
            <>
              <Box>
                <AnimatedNumber value={beakerCurrentVolume} />
                {' / ' + beakerMaxVolume + ' u'}
              </Box>
              {beakerContents.length > 0 ? (
                <LabeledList>
                  {beakerContents.map((chem) => (
                    <LabeledList.Item key={chem.name} label={chem.name}>
                      {chem.volume} u
                    </LabeledList.Item>
                  ))}
                </LabeledList>
              ) : (
                <Box color="bad">Recipient Empty</Box>
              )}
            </>
          ) : (
            <Box color="average">No Recipient</Box>
          )}
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
        </Section>
      </Window.Content>
    </Window>
  );
};
