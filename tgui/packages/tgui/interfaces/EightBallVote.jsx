import { BooleanLike } from 'common/react';
import { toTitleCase } from 'common/string';

import { useBackend } from '../backend';
import { Box, Button, NoticeBox, Section, Stack } from '../components';
import { Window } from '../layouts';

<<<<<<<< HEAD:tgui/packages/tgui/interfaces/EightBallVote.tsx
type Data = {
  answers: Answer[];
  question: string;
  shaking: BooleanLike;
};

type Answer = {
  amount: number;
  answer: string;
  selected: BooleanLike;
};

export function EightBallVote(props) {
  const { data } = useBackend<Data>();
========
export const EightBallVote = (props) => {
  const { act, data } = useBackend();
>>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9:tgui/packages/tgui/interfaces/EightBallVote.jsx
  const { shaking } = data;

  return (
    <Window width={400} height={600}>
      <Window.Content>
        {(shaking && (
          <NoticeBox>No question is currently being asked.</NoticeBox>
        )) || <EightBallVoteQuestion />}
      </Window.Content>
    </Window>
  );
}

<<<<<<<< HEAD:tgui/packages/tgui/interfaces/EightBallVote.tsx
function EightBallVoteQuestion(props) {
  const { act, data } = useBackend<Data>();
========
const EightBallVoteQuestion = (props) => {
  const { act, data } = useBackend();
>>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9:tgui/packages/tgui/interfaces/EightBallVote.jsx
  const { question, answers = [] } = data;

  return (
    <Section>
      <Box bold textAlign="center" fontSize="16px" m={1}>
        &quot;{question}&quot;
      </Box>
      <Stack>
        {answers.map((answer) => (
          <Stack.Item grow key={answer.answer}>
            <Button
              fluid
              bold
              selected={answer.selected}
              fontSize="16px"
              lineHeight="24px"
              textAlign="center"
              mb={1}
              onClick={() =>
                act('vote', {
                  answer: answer.answer,
                })
              }
            >
              {toTitleCase(answer.answer)}
            </Button>
            <Box bold textAlign="center" fontSize="30px">
              {answer.amount}
            </Box>
          </Stack.Item>
        ))}
      </Stack>
    </Section>
  );
}
