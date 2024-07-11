import { useBackend, useLocalState } from '../backend';
<<<<<<< HEAD
import { Box, Dropdown, Input, Section, TextArea } from '../components';
import { Button } from '../components/Button';
=======
import { Section, Dropdown, Input, Box, TextArea } from '../components';
import { Button, ButtonCheckbox } from '../components/Button';
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
import { Window } from '../layouts';

export const AdminPDA = (props) => {
  return (
<<<<<<< HEAD
    <Window title="Send PDA Message" width={300} height={575} theme="admin">
=======
    <Window title="Send Message on PDA" width={300} height={525} theme="admin">
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
      <Window.Content>
        <ReceiverChoice />
        <SenderInfo />
        <MessageInput />
      </Window.Content>
    </Window>
  );
};

<<<<<<< HEAD
const ReceiverChoice = (props) => {
  const { data } = useBackend();
  const { users } = data;
  const receivers = Array.from(Object.values(users));

  const [user, setUser] = useLocalState('user', '');
  const [spam, setSpam] = useLocalState('spam', false);
  const [showInvisible, setShowInvisible] = useLocalState(
    'showInvisible',
    false,
  );
=======
export const ReceiverChoice = (props) => {
  const { act, data } = useBackend();
  const receivers = Array.from(data.users).sort();

  const [user, setUser] = useLocalState('user', '');
  const [spam, setSpam] = useLocalState('spam', false);
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9

  return (
    <Section title="To Who?" textAlign="center">
      <Box>
        <Dropdown
<<<<<<< HEAD
          disabled={spam}
          selected={user}
          displayText={users[user]?.username}
          placeholder="Pick a user..."
          options={receivers
            .filter((rcvr) => showInvisible || !rcvr.invisible)
            .map((rcvr) => ({
              displayText: rcvr.username,
              value: rcvr.ref,
            }))}
=======
          selected="Pick a target"
          options={receivers}
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
          width="275px"
          mb={1}
          onSelected={(value) => {
            setUser(value);
          }}
        />
      </Box>
      <Box>
<<<<<<< HEAD
        <Button.Checkbox
          checked={showInvisible}
          fluid
          onClick={() => setShowInvisible(!showInvisible)}
          content="Include invisible?"
        />
        <Button.Checkbox
          checked={spam}
          fluid
          onClick={() => setSpam(!spam)}
          content="Should it be sent to everyone?"
        />
=======
        <ButtonCheckbox checked={spam} fluid onClick={() => setSpam(!spam)}>
          Should it be sent to everyone?
        </ButtonCheckbox>
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
      </Box>
    </Section>
  );
};

<<<<<<< HEAD
const SenderInfo = (props) => {
=======
export const SenderInfo = (props) => {
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
  const [name, setName] = useLocalState('name', '');
  const [job, setJob] = useLocalState('job', '');

  return (
    <Section title="From Who?" textAlign="center">
      <Box fontSize="14px">
        <Input
          placeholder="Sender name..."
          fluid
<<<<<<< HEAD
          onChange={(e, value) => {
=======
          onInput={(e, value) => {
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
            setName(value);
          }}
        />
      </Box>
      <Box fontSize="14px" pt="10px">
        <Input
          placeholder="Sender's job..."
          fluid
<<<<<<< HEAD
          onChange={(e, value) => {
=======
          onInput={(e, value) => {
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
            setJob(value);
          }}
        />
      </Box>
    </Section>
  );
};

<<<<<<< HEAD
const MessageInput = (props) => {
=======
export const MessageInput = (props) => {
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
  const { act } = useBackend();

  const [user, setUser] = useLocalState('user', '');
  const [name, setName] = useLocalState('name', '');
  const [job, setJob] = useLocalState('job', '');
  const [messageText, setMessageText] = useLocalState('message', '');
  const [spam, setSpam] = useLocalState('spam', false);
<<<<<<< HEAD
  const [force, setForce] = useLocalState('force', false);
  const [showInvisible, setShowInvisible] = useLocalState(
    'showInvisible',
    false,
  );

  const tooltipText = function (name, job, message, target) {
    let reasonList = [];
    if (!target) reasonList.push('target');
=======

  const tooltipText = function (name, job, message) {
    let reasonList = [];
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
    if (!name) reasonList.push('name');
    if (!job) reasonList.push('job');
    if (!message) reasonList.push('message text');
    return reasonList.join(', ');
  };

  const blocked = !name || !job || !messageText;

  return (
    <Section title="Message" textAlign="center">
      <Box>
        <TextArea
          placeholder="Type the message you want to send..."
          height="200px"
          mb={1}
<<<<<<< HEAD
          onChange={(e, value) => {
=======
          onInput={(e, value) => {
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
            setMessageText(value);
          }}
        />
      </Box>
      <Box>
<<<<<<< HEAD
        <Button.Checkbox
          fluid
          checked={force}
          content="Force send the message?"
          tooltip={
            'This will immediately broadcast the message, bypassing telecomms altogether.'
          }
          onClick={() => setForce(!force)}
        />
=======
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
        <Button
          tooltip={
            blocked
              ? 'Fill in the following lines: ' +
<<<<<<< HEAD
                tooltipText(name, job, messageText, spam || !!user)
=======
                tooltipText(name, job, messageText)
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
              : 'Send message to user(s)'
          }
          fluid
          disabled={blocked}
          icon="envelope-open-text"
          onClick={() =>
            act('sendMessage', {
              name: name,
<<<<<<< HEAD
              job: job,
              ref: user,
              message: messageText,
              spam: spam,
              include_invisible: showInvisible,
              force: force,
=======
              user: user,
              job: job,
              message: messageText,
              spam: spam,
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
            })
          }
        >
          Send Message
        </Button>
      </Box>
    </Section>
  );
};
