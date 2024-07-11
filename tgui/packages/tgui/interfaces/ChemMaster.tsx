import { BooleanLike, classes } from 'common/react';
import { capitalize } from 'common/string';
<<<<<<< HEAD
import { useState } from 'react';

import { useBackend } from '../backend';
=======
import { useBackend, useLocalState } from '../backend';
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
import {
  AnimatedNumber,
  Box,
  Button,
<<<<<<< HEAD
  ColorBox,
  Divider,
  LabeledList,
  NumberInput,
  ProgressBar,
  Section,
  Stack,
  Table,
  Tooltip,
} from '../components';
import { Window } from '../layouts';
import { Beaker, BeakerReagent } from './common/BeakerDisplay';

type Container = {
  icon: string;
  ref: string;
  name: string;
  volume: number;
};

type Category = {
  name: string;
  containers: Container[];
};

type AnalyzableReagent = BeakerReagent & {
  ref: string;
=======
  Section,
  Table,
  NumberInput,
  Tooltip,
  LabeledList,
  ColorBox,
  ProgressBar,
  Stack,
  Divider,
} from '../components';
import { Window } from '../layouts';

type Data = {
  reagentAnalysisMode: BooleanLike;
  analysisData: Analysis;
  isPrinting: BooleanLike;
  printingProgress: number;
  printingTotal: number;
  transferMode: BooleanLike;
  hasBeaker: BooleanLike;
  beakerCurrentVolume: number;
  beakerMaxVolume: number;
  beakerContents: Reagent[];
  bufferContents: Reagent[];
  bufferCurrentVolume: number;
  bufferMaxVolume: number;
  categories: Category[];
  selectedContainerRef: string;
  selectedContainerVolume: number;
  hasContainerSuggestion: BooleanLike;
  doSuggestContainer: BooleanLike;
  suggestedContainer: string;
};

type Analysis = {
  name: string;
  state: string;
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
  pH: number;
  color: string;
  description: string;
  purity: number;
  metaRate: number;
  overdose: number;
  addictionTypes: string[];
};

<<<<<<< HEAD
type AnalyzableBeaker = {
  contents: AnalyzableReagent[];
} & Beaker;

type Data = {
  categories: Category[];
  isPrinting: BooleanLike;
  printingProgress: number;
  printingTotal: number;
  maxPrintable: number;
  beaker: AnalyzableBeaker;
  buffer: AnalyzableBeaker;
  isTransfering: BooleanLike;
  suggestedContainerRef: string;
  selectedContainerRef: string;
  selectedContainerVolume: number;
};

export const ChemMaster = (props) => {
  const [analyzedReagent, setAnalyzedReagent] = useState<AnalyzableReagent>();

  return (
    <Window width={450} height={620}>
      <Window.Content scrollable>
        {analyzedReagent ? (
          <AnalysisResults
            analysisData={analyzedReagent}
            onExit={() => setAnalyzedReagent(undefined)}
          />
        ) : (
          <ChemMasterContent
            analyze={(chemical: AnalyzableReagent) =>
              setAnalyzedReagent(chemical)
            }
          />
        )}
=======
type Category = {
  name: string;
  containers: Container[];
};

type Reagent = {
  ref: string;
  name: string;
  volume: number;
};

type Container = {
  icon: string;
  ref: string;
  name: string;
  volume: number;
};

export const ChemMaster = (props) => {
  const { data } = useBackend<Data>();
  const { reagentAnalysisMode } = data;
  return (
    <Window width={400} height={620}>
      <Window.Content scrollable>
        {reagentAnalysisMode ? <AnalysisResults /> : <ChemMasterContent />}
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
      </Window.Content>
    </Window>
  );
};

<<<<<<< HEAD
const ChemMasterContent = (props: {
  analyze: (chemical: AnalyzableReagent) => void;
}) => {
=======
const ChemMasterContent = (props) => {
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
  const { act, data } = useBackend<Data>();
  const {
    isPrinting,
    printingProgress,
    printingTotal,
<<<<<<< HEAD
    maxPrintable,
    isTransfering,
    beaker,
    buffer,
    categories,
    selectedContainerVolume,
  } = data;

  const [itemCount, setItemCount] = useState<number>(1);
  const [showPreferredContainer, setShowPreferredContainer] =
    useState<BooleanLike>(false);
  const buffer_contents = buffer.contents;
=======
    transferMode,
    hasBeaker,
    beakerCurrentVolume,
    beakerMaxVolume,
    beakerContents,
    bufferContents,
    bufferCurrentVolume,
    bufferMaxVolume,
    categories,
    selectedContainerVolume,
    hasContainerSuggestion,
    doSuggestContainer,
    suggestedContainer,
  } = data;

  const [itemCount, setItemCount] = useLocalState('itemCount', 1);
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9

  return (
    <Box>
      <Section
        title="Beaker"
        buttons={
<<<<<<< HEAD
          beaker && (
            <Box>
              <Box inline color="label" mr={2}>
                <AnimatedNumber value={beaker.currentVolume} initial={0} />
                {` / ${beaker.maxVolume} units`}
              </Box>
              <Button icon="eject" onClick={() => act('eject')}>
                Eject
              </Button>
=======
          !!hasBeaker && (
            <Box>
              <Box inline color="label" mr={2}>
                <AnimatedNumber value={beakerCurrentVolume} initial={0} />
                {` / ${beakerMaxVolume} units`}
              </Box>
              <Button
                icon="eject"
                content="Eject"
                onClick={() => act('eject')}
              />
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
            </Box>
          )
        }
      >
<<<<<<< HEAD
        {!beaker ? (
          <Box color="label" my={'4px'}>
            No beaker loaded.
          </Box>
        ) : beaker.currentVolume === 0 ? (
          <Box color="label" my={'4px'}>
            Beaker is empty.
          </Box>
        ) : (
          <Table>
            {beaker.contents.map((chemical) => (
              <ReagentEntry
                key={chemical.ref}
                chemical={chemical}
                transferTo="buffer"
                analyze={props.analyze}
              />
            ))}
          </Table>
        )}
=======
        {!hasBeaker && (
          <Box color="label" my={'4px'}>
            No beaker loaded.
          </Box>
        )}
        {!!hasBeaker && beakerCurrentVolume === 0 && (
          <Box color="label" my={'4px'}>
            Beaker is empty.
          </Box>
        )}
        <Table>
          {beakerContents.map((chemical) => (
            <ReagentEntry
              key={chemical.ref}
              chemical={chemical}
              transferTo="buffer"
            />
          ))}
        </Table>
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
      </Section>
      <Section
        title="Buffer"
        buttons={
          <>
            <Box inline color="label" mr={1}>
<<<<<<< HEAD
              <AnimatedNumber value={buffer.currentVolume} initial={0} />
              {` / ${buffer.maxVolume} units`}
            </Box>
            <Button
              color={isTransfering ? 'good' : 'bad'}
              icon={isTransfering ? 'exchange-alt' : 'trash'}
              onClick={() => act('toggleTransferMode')}
            >
              {isTransfering ? 'Moving reagents' : 'Destroying reagents'}
            </Button>
          </>
        }
      >
        {buffer_contents.length === 0 ? (
          <Box color="label" my={'4px'}>
            Buffer is empty.
          </Box>
        ) : (
          <Table>
            {buffer_contents.map((chemical) => (
              <ReagentEntry
                key={chemical.ref}
                chemical={chemical}
                transferTo="beaker"
                analyze={props.analyze}
              />
            ))}
          </Table>
        )}
=======
              <AnimatedNumber value={bufferCurrentVolume} initial={0} />
              {` / ${bufferMaxVolume} units`}
            </Box>
            <Button
              color={transferMode ? 'good' : 'bad'}
              icon={transferMode ? 'exchange-alt' : 'trash'}
              content={transferMode ? 'Moving reagents' : 'Destroying reagents'}
              onClick={() => act('toggleTransferMode')}
            />
          </>
        }
      >
        {bufferContents.length === 0 && (
          <Box color="label" my={'4px'}>
            Buffer is empty.
          </Box>
        )}
        <Table>
          {bufferContents.map((chemical) => (
            <ReagentEntry
              key={chemical.ref}
              chemical={chemical}
              transferTo="beaker"
            />
          ))}
        </Table>
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
      </Section>
      {!isPrinting && (
        <Section
          title="Packaging"
          buttons={
<<<<<<< HEAD
            buffer_contents.length !== 0 && (
              <Box>
                <Button.Checkbox
                  checked={showPreferredContainer}
                  onClick={() =>
                    setShowPreferredContainer((currentValue) => !currentValue)
                  }
                >
                  Suggest
                </Button.Checkbox>
=======
            bufferContents.length !== 0 &&
            (!isPrinting ? (
              <Box>
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
                <NumberInput
                  unit={'items'}
                  step={1}
                  value={itemCount}
                  minValue={1}
<<<<<<< HEAD
                  maxValue={maxPrintable}
                  onChange={(value) => {
=======
                  maxValue={50}
                  onChange={(e, value) => {
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
                    setItemCount(value);
                  }}
                />
                <Box inline mx={1}>
                  {`${
                    Math.round(
                      Math.min(
                        selectedContainerVolume,
<<<<<<< HEAD
                        buffer.currentVolume / itemCount,
=======
                        bufferCurrentVolume / itemCount,
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
                      ) * 100,
                    ) / 100
                  } u. each`}
                </Box>
                <Button
<<<<<<< HEAD
=======
                  content="Print"
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
                  icon="flask"
                  onClick={() =>
                    act('create', {
                      itemCount: itemCount,
                    })
                  }
<<<<<<< HEAD
                >
                  Print
                </Button>
              </Box>
            )
          }
        >
          {categories.map((category) => (
            <Box key={category.name}>
              <GroupTitle title={category.name} />
              {category.containers.map((container) => (
                <ContainerButton
                  key={container.ref}
                  category={category}
                  container={container}
                  showPreferredContainer={showPreferredContainer}
                />
              ))}
=======
                />
              </Box>
            ) : (
              <Button content="Printing..." icon="gear" iconSpin disabled />
            ))
          }
        >
          {!!hasContainerSuggestion && (
            <Button.Checkbox
              onClick={() => act('toggleContainerSuggestion')}
              checked={doSuggestContainer}
              mb={1}
            >
              Guess container by main reagent in the buffer
            </Button.Checkbox>
          )}
          {categories.map((category) => (
            <Box key={category.name}>
              <GroupTitle title={category.name} />
              {category.containers.map(
                (container) =>
                  (!hasContainerSuggestion || // Doesn't have suggestion
                    (!!hasContainerSuggestion && !doSuggestContainer) || // Has sugestion and it's disabled
                    (!!doSuggestContainer &&
                      container.ref === suggestedContainer)) && ( // Suggestion enabled and container matches
                    <ContainerButton
                      key={container.ref}
                      category={category}
                      container={container}
                    />
                  ),
              )}
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
            </Box>
          ))}
        </Section>
      )}
      {!!isPrinting && (
        <Section
          title="Printing"
          buttons={
            <Button
              color="bad"
              icon="times"
<<<<<<< HEAD
              onClick={() => act('stopPrinting')}
            >
              Stop
            </Button>
=======
              content="Stop"
              onClick={() => act('stopPrinting')}
            />
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
          }
        >
          <ProgressBar
            value={printingProgress}
            minValue={0}
            maxValue={printingTotal}
            color="good"
          >
            <Box
              lineHeight={1.9}
              style={{
<<<<<<< HEAD
                textShadow: '1px 1px 0 black',
=======
                'text-shadow': '1px 1px 0 black',
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
              }}
            >
              {`Printing ${printingProgress} out of ${printingTotal}`}
            </Box>
          </ProgressBar>
        </Section>
      )}
    </Box>
  );
};

<<<<<<< HEAD
type ReagentProps = {
  chemical: AnalyzableReagent;
  transferTo: string;
  analyze: (chemical: AnalyzableReagent) => void;
};

const ReagentEntry = (props: ReagentProps) => {
  const { data, act } = useBackend<Data>();
  const { chemical, transferTo, analyze } = props;
=======
const ReagentEntry = (props) => {
  const { data, act } = useBackend<Data>();
  const { chemical, transferTo } = props;
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
  const { isPrinting } = data;
  return (
    <Table.Row key={chemical.ref}>
      <Table.Cell color="label">
        {`${chemical.name} `}
        <AnimatedNumber value={chemical.volume} initial={0} />
        {`u`}
      </Table.Cell>
      <Table.Cell collapsing>
        <Button
<<<<<<< HEAD
=======
          content="1"
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
          disabled={isPrinting}
          onClick={() => {
            act('transfer', {
              reagentRef: chemical.ref,
              amount: 1,
              target: transferTo,
            });
          }}
<<<<<<< HEAD
        >
          1
        </Button>
        <Button
=======
        />
        <Button
          content="5"
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
          disabled={isPrinting}
          onClick={() =>
            act('transfer', {
              reagentRef: chemical.ref,
              amount: 5,
              target: transferTo,
            })
          }
<<<<<<< HEAD
        >
          5
        </Button>
        <Button
=======
        />
        <Button
          content="10"
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
          disabled={isPrinting}
          onClick={() =>
            act('transfer', {
              reagentRef: chemical.ref,
              amount: 10,
              target: transferTo,
            })
          }
<<<<<<< HEAD
        >
          10
        </Button>
        <Button
=======
        />
        <Button
          content="All"
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
          disabled={isPrinting}
          onClick={() =>
            act('transfer', {
              reagentRef: chemical.ref,
              amount: 1000,
              target: transferTo,
            })
          }
<<<<<<< HEAD
        >
          All
        </Button>
        <Button
          icon="ellipsis-h"
          tooltip="Custom amount"
=======
        />
        <Button
          icon="ellipsis-h"
          title="Custom amount"
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
          disabled={isPrinting}
          onClick={() =>
            act('transfer', {
              reagentRef: chemical.ref,
              amount: -1,
              target: transferTo,
            })
          }
        />
        <Button
          icon="question"
<<<<<<< HEAD
          tooltip="Analyze"
          onClick={() => analyze(chemical)}
=======
          title="Analyze"
          onClick={() =>
            act('analyze', {
              reagentRef: chemical.ref,
            })
          }
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
        />
      </Table.Cell>
    </Table.Row>
  );
};

<<<<<<< HEAD
type CategoryButtonProps = {
  category: Category;
  container: Container;
  showPreferredContainer: BooleanLike;
};

const ContainerButton = (props: CategoryButtonProps) => {
  const { act, data } = useBackend<Data>();
  const { isPrinting, selectedContainerRef, suggestedContainerRef } = data;
  const { category, container, showPreferredContainer } = props;
  const isPillPatch = ['pills', 'patches'].includes(category.name);

=======
const ContainerButton = ({ container, category }) => {
  const { act, data } = useBackend<Data>();
  const { isPrinting, selectedContainerRef } = data;
  const isPillPatch = ['pills', 'patches'].includes(category.name);
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
  return (
    <Tooltip
      key={container.ref}
      content={`${capitalize(container.name)}\xa0(${container.volume}u)`}
    >
      <Button
        overflow="hidden"
<<<<<<< HEAD
        color={'transparent'}
        backgroundColor={
          showPreferredContainer &&
          selectedContainerRef !== suggestedContainerRef && // if we selected the same container as the suggested then don't override color
          container.ref === suggestedContainerRef
            ? 'blue'
            : 'transparent'
        }
=======
        color="transparent"
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
        width={isPillPatch ? '32px' : '48px'}
        height={isPillPatch ? '32px' : '48px'}
        selected={container.ref === selectedContainerRef}
        disabled={isPrinting}
        p={0}
        onClick={() => {
          act('selectContainer', {
            ref: container.ref,
          });
        }}
      >
        <Box
          m={isPillPatch ? '0' : '8px'}
          style={{
            transform: 'scale(2)',
          }}
          className={classes(['chemmaster32x32', container.icon])}
        />
      </Button>
    </Tooltip>
  ) as any;
};

<<<<<<< HEAD
const AnalysisResults = (props: {
  analysisData: AnalyzableReagent;
  onExit: () => void;
}) => {
  const {
    name,
=======
const AnalysisResults = (props) => {
  const { act, data } = useBackend<Data>();
  const {
    name,
    state,
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
    pH,
    color,
    description,
    purity,
    metaRate,
    overdose,
    addictionTypes,
<<<<<<< HEAD
  } = props.analysisData;

  const purityLevel =
    purity <= 0.5 ? 'bad' : purity <= 0.75 ? 'average' : 'good'; // Color names

=======
  } = data.analysisData;
  const purityLevel =
    purity <= 0.5 ? 'bad' : purity <= 0.75 ? 'average' : 'good'; // Color names
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
  return (
    <Section
      title="Analysis Results"
      buttons={
<<<<<<< HEAD
        <Button icon="arrow-left" onClick={() => props.onExit()}>
          Back
        </Button>
=======
        <Button
          icon="arrow-left"
          content="Back"
          onClick={() => act('stopAnalysis')}
        />
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
      }
    >
      <LabeledList>
        <LabeledList.Item label="Name">{name}</LabeledList.Item>
        <LabeledList.Item label="Purity">
          <Box
            style={{
<<<<<<< HEAD
              textTransform: 'capitalize',
=======
              'text-transform': 'capitalize',
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
            }}
            color={purityLevel}
          >
            {purityLevel}
          </Box>
        </LabeledList.Item>
        <LabeledList.Item label="pH">{pH}</LabeledList.Item>
<<<<<<< HEAD
=======
        <LabeledList.Item label="State">{state}</LabeledList.Item>
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
        <LabeledList.Item label="Color">
          <ColorBox color={color} mr={1} />
          {color}
        </LabeledList.Item>
        <LabeledList.Item label="Description">{description}</LabeledList.Item>
        <LabeledList.Item label="Metabolization Rate">
          {metaRate} units/second
        </LabeledList.Item>
        <LabeledList.Item label="Overdose Threshold">
          {overdose > 0 ? `${overdose} units` : 'N/A'}
        </LabeledList.Item>
        <LabeledList.Item label="Addiction Types">
          {addictionTypes.length ? addictionTypes.toString() : 'N/A'}
        </LabeledList.Item>
      </LabeledList>
    </Section>
  );
};

const GroupTitle = ({ title }) => {
  return (
    <Stack my={1}>
      <Stack.Item grow>
        <Divider />
      </Stack.Item>
      <Stack.Item
        style={{
<<<<<<< HEAD
          textTransform: 'capitalize',
=======
          'text-transform': 'capitalize',
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
        }}
        color={'gray'}
      >
        {title}
      </Stack.Item>
      <Stack.Item grow>
        <Divider />
      </Stack.Item>
    </Stack>
  ) as any;
};
