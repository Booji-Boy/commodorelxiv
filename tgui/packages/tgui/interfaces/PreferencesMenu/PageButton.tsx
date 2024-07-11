import { ReactNode } from 'react';

import { Button } from '../../components';
import { useBackend } from '../../backend';
import { PreferencesMenuData } from './data';

export const PageButton = <P extends unknown>(props: {
  currentPage: P;
  page: P;
  otherActivePages?: P[];

  setPage: (page: P) => void;
<<<<<<< HEAD

  children?: ReactNode;
=======
  children?: InfernoNode;
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
}) => {
  const { act } = useBackend<PreferencesMenuData>();
  const pageIsActive =
    props.currentPage === props.page ||
    (props.otherActivePages &&
      props.otherActivePages.indexOf(props.currentPage) !== -1);

  return (
    <Button
      align="center"
      fontSize="1.2em"
      fluid
      selected={pageIsActive}
<<<<<<< HEAD
      onClick={() => props.setPage(props.page)}
=======
      onClick={() => {
        props.setPage(props.page);
        act('update_body');
      }}
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
    >
      {props.children}
    </Button>
  );
};
