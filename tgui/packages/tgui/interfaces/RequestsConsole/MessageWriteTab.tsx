<<<<<<< HEAD
import { sort } from 'common/collections';
import { useState } from 'react';

import { useBackend, useLocalState } from '../../backend';
=======
import { useBackend, useLocalState } from '../../backend';
import { sortStrings } from 'common/collections';
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
import {
  Box,
  Button,
  Dropdown,
  Section,
  Stack,
  TextArea,
} from '../../components';
<<<<<<< HEAD
import { RequestPriority, RequestsData, RequestType } from './types';
=======
import { RequestsData, RequestType, RequestPriority } from './types';
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9

export const MessageWriteTab = (props) => {
  const { act, data } = useBackend<RequestsData>();
  const {
    authentication_data,
    hack_state,
    assistance_consoles = [],
    supply_consoles = [],
    information_consoles = [],
  } = data;

<<<<<<< HEAD
  const sorted_assistance = sort(assistance_consoles);
  const sorted_supply = sort(supply_consoles);
  const sorted_information = sort(information_consoles);
=======
  const sorted_assistance = sortStrings(assistance_consoles);
  const sorted_supply = sortStrings(supply_consoles);
  const sorted_information = sortStrings(information_consoles);
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9

  const resetMessage = () => {
    setMessageText('');
    setRecipient('');
    setPriority(RequestPriority.NORMAL);
    setRequestType(RequestType.ASSISTANCE);
  };
  const [messageText, setMessageText] = useLocalState('messageText', '');
<<<<<<< HEAD
  const [requestType, setRequestType] = useState(RequestType.ASSISTANCE);
  const [priority, setPriority] = useState(RequestPriority.NORMAL);
  const [recipient, setRecipient] = useState('');
=======
  const [requestType, setRequestType] = useLocalState(
    'requestType',
    RequestType.ASSISTANCE,
  );
  const [priority, setPriority] = useLocalState(
    'priority',
    RequestPriority.NORMAL,
  );
  const [recipient, setRecipient] = useLocalState('recipient', '');
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
  return (
    <Section>
      <Stack fill mb={2}>
        <Stack.Item grow>
          <Button
            fluid
            icon="handshake-angle"
<<<<<<< HEAD
=======
            content="Request Assistance"
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
            selected={requestType === RequestType.ASSISTANCE}
            onClick={() => {
              setRecipient('');
              setRequestType(RequestType.ASSISTANCE);
            }}
<<<<<<< HEAD
          >
            Request Assistance
          </Button>
=======
          />
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
        </Stack.Item>
        <Stack.Item grow>
          <Button
            fluid
            icon="boxes-stacked"
<<<<<<< HEAD
=======
            content="Request Supplies"
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
            selected={requestType === RequestType.SUPPLIES}
            onClick={() => {
              setRecipient('');
              setRequestType(RequestType.SUPPLIES);
            }}
<<<<<<< HEAD
          >
            Request Supplies
          </Button>
=======
          />
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
        </Stack.Item>
        <Stack.Item grow>
          <Button
            fluid
            icon="upload"
<<<<<<< HEAD
=======
            content="Relay Information"
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
            selected={requestType === RequestType.INFORMATION}
            onClick={() => {
              setRecipient('');
              setRequestType(RequestType.INFORMATION);
            }}
<<<<<<< HEAD
          >
            Relay Information
          </Button>
=======
          />
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
        </Stack.Item>
      </Stack>
      <Box>
        {requestType === RequestType.ASSISTANCE && (
          <Dropdown
            width="100%"
            options={sorted_assistance}
            selected={recipient}
<<<<<<< HEAD
            placeholder="Pick a Recipient"
=======
            displayText={recipient || 'Pick a Recipient'}
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
            onSelected={(value) => setRecipient(value)}
          />
        )}
        {requestType === RequestType.SUPPLIES && (
          <Dropdown
            width="100%"
            options={sorted_supply}
            selected={recipient}
<<<<<<< HEAD
            placeholder="Pick a Recipient"
=======
            displayText={recipient || 'Pick a Recipient'}
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
            onSelected={(value) => setRecipient(value)}
          />
        )}
        {requestType === RequestType.INFORMATION && (
          <Dropdown
            width="100%"
            options={sorted_information}
            selected={recipient}
<<<<<<< HEAD
            placeholder="Pick a Recipient"
=======
            displayText={recipient || 'Pick a Recipient'}
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
            onSelected={(value) => setRecipient(value)}
          />
        )}
      </Box>
      <Stack fill mt={2} mb={2}>
        <Stack.Item grow>
          <Button
            icon="envelope"
            content="Normal Priority"
            key={RequestPriority.NORMAL}
            fluid
            selected={priority === RequestPriority.NORMAL}
            onClick={() => setPriority(RequestPriority.NORMAL)}
          />
        </Stack.Item>
        <Stack.Item grow>
          <Button
            icon="exclamation"
            content="High Priority"
            key={RequestPriority.HIGH}
            fluid
            selected={priority === RequestPriority.HIGH}
            onClick={() => setPriority(RequestPriority.HIGH)}
          />
        </Stack.Item>
        {!!hack_state && (
          <Stack.Item grow>
            <Button
              icon="burst"
              content="EXTREME PRIORITY"
              key={RequestPriority.EXTREME}
              fluid
              selected={priority === RequestPriority.EXTREME}
              onClick={() => setPriority(RequestPriority.EXTREME)}
            />
          </Stack.Item>
        )}
      </Stack>
      <TextArea
        fluid
        height={20}
        maxLength={1025}
<<<<<<< HEAD
=======
        multiline
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
        value={messageText}
        onChange={(_, value) => setMessageText(value)}
        placeholder="Type your message..."
      />
      <Section>
        <Stack fill justify="space-between">
          <Stack.Item>
            <Button
              icon="paper-plane"
<<<<<<< HEAD
=======
              content="Send message"
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
              disabled={!messageText || !recipient || !priority || !requestType}
              onClick={() => {
                if (!messageText || !recipient || !priority || !requestType) {
                  return;
                }

                act('send_message', {
                  message: messageText,
                  recipient: recipient,
                  request_type: requestType,
                  priority: priority,
                });
                resetMessage();
              }}
<<<<<<< HEAD
            >
              Send message
            </Button>
          </Stack.Item>
          <Stack.Item>
            <Button icon="id-card" onClick={() => act('verify_id')}>
              {authentication_data.message_verified_by || 'Not verified'}
            </Button>
            <Button icon="stamp" onClick={() => act('stamp')}>
              {authentication_data.message_stamped_by || 'Not stamped'}
            </Button>
=======
            />
          </Stack.Item>
          <Stack.Item>
            <Button
              warning
              icon="id-card"
              content={
                authentication_data.message_verified_by || 'Not verified'
              }
              onClick={() => act('verify_id')}
            />
            <Button
              warning
              icon="stamp"
              content={authentication_data.message_stamped_by || 'Not stamped'}
              onClick={() => act('stamp')}
            />
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
          </Stack.Item>
        </Stack>
        <Button
          icon="trash-can"
<<<<<<< HEAD
=======
          content="Discard message"
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
          onClick={() => {
            act('clear_authentication');
            resetMessage();
          }}
<<<<<<< HEAD
        >
          Discard message
        </Button>
=======
        />
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
      </Section>
    </Section>
  );
};
