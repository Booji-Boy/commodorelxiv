<<<<<<< HEAD
import { useState } from 'react';

import { useBackend } from '../../backend';
=======
import { useBackend, useLocalState } from '../../backend';
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
import { Button, NoticeBox, Section, TextArea } from '../../components';
import { RequestsData } from './types';

export const AnnouncementTab = (props) => {
  const { act, data } = useBackend<RequestsData>();
  const { authentication_data, is_admin_ghost_ai } = data;
<<<<<<< HEAD
  const [messageText, setMessageText] = useState('');
=======
  const [messageText, setMessageText] = useLocalState('messageText', '');
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
  return (
    <Section>
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
        placeholder="Type your announcement..."
      />
      <Section>
        <AuthenticationNoticeBox />
        <Button
          disabled={
            !(
              authentication_data.announcement_authenticated ||
              is_admin_ghost_ai
            ) || !messageText
          }
          icon="bullhorn"
          content="Send announcement"
          onClick={() => {
            if (
              !(
                authentication_data.announcement_authenticated ||
                is_admin_ghost_ai
              ) ||
              !messageText
            ) {
              return;
            }
            act('send_announcement', { message: messageText });
            setMessageText('');
          }}
        />
        <Button
          icon="trash-can"
          content="Discard announcement"
          onClick={() => {
            act('clear_authentication');
            setMessageText('');
          }}
        />
      </Section>
    </Section>
  );
};

const AuthenticationNoticeBox = (props) => {
  const { act, data } = useBackend<RequestsData>();
  const { authentication_data, is_admin_ghost_ai } = data;
  return (
    (!authentication_data.announcement_authenticated && !is_admin_ghost_ai && (
<<<<<<< HEAD
      <NoticeBox>Swipe your card to authenticate yourself</NoticeBox>
    )) || <NoticeBox info>Succesfully authenticated</NoticeBox>
=======
      <NoticeBox warning>
        {'Swipe your card to authenticate yourself'}
      </NoticeBox>
    )) || <NoticeBox info>{'Succesfully authenticated'}</NoticeBox>
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
  );
};
