<<<<<<< HEAD
import { decodeHtmlEntities } from 'common/string';

=======
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
import { useBackend } from '../../backend';
import {
  BlockQuote,
  Button,
  LabeledList,
  NoticeBox,
  Section,
  Stack,
} from '../../components';
<<<<<<< HEAD
=======
import { decodeHtmlEntities } from 'common/string';
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
import {
  RequestMessage,
  RequestPriority,
  RequestsData,
  RequestType,
} from './types';

export const MessageViewTab = (props) => {
  const { act, data } = useBackend<RequestsData>();
  const { messages = [] } = data;
  return (
    <Section fill scrollable>
      <Stack vertical>
        {messages.map((message) => (
          <MessageDisplay key={message.received_time} message={message} />
        ))}
      </Stack>
    </Section>
  );
};

const MessageDisplay = (props: { message: RequestMessage }) => {
  const { act } = useBackend();
  const { message } = props;
  const append_list_keys = message.appended_list
    ? Object.keys(message.appended_list)
    : [];
  return (
    <Stack.Item>
      <Section
        title={
          message.request_type +
          ' from ' +
          message.sender_department +
          ', ' +
          message.received_time
        }
      >
        {message.priority === RequestPriority.HIGH && (
<<<<<<< HEAD
          <NoticeBox>High Priority</NoticeBox>
        )}
        {message.priority === RequestPriority.EXTREME && (
          <NoticeBox danger>!!!Extreme Priority!!!</NoticeBox>
=======
          <NoticeBox warning>High Priority</NoticeBox>
        )}
        {message.priority === RequestPriority.EXTREME && (
          <NoticeBox bad>!!!Extreme Priority!!!</NoticeBox>
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
        )}
        <BlockQuote>
          {decodeHtmlEntities(message.content)}
          {!!message.appended_list && !!append_list_keys.length && (
            <LabeledList>
              {append_list_keys.map((list_key) => (
                <LabeledList.Item key={list_key} label={list_key}>
                  {message.appended_list[list_key]}
                </LabeledList.Item>
              ))}
            </LabeledList>
          )}
        </BlockQuote>
        <LabeledList>
          <LabeledList.Item label="Message Verified By">
            {message.message_verified_by || 'Not Verified'}
          </LabeledList.Item>
          <LabeledList.Item label="Message Stamped By">
            {message.message_stamped_by || 'Not Stamped'}
          </LabeledList.Item>
        </LabeledList>
        {message.request_type !== RequestType.ORE_UPDATE && (
          <Section>
            <Button
              icon="reply"
              content="Quick Reply"
              onClick={() => {
                act('quick_reply', {
                  reply_recipient: message.sender_department,
                });
              }}
            />
          </Section>
        )}
      </Section>
    </Stack.Item>
  );
};
