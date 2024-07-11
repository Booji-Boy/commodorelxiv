/**
 * @file
 * @copyright 2020 Aleksej Komarov
 * @license MIT
 */

import { classes } from 'common/react';

import { useBackend } from '../backend';
import { Box } from '../components';
<<<<<<<< HEAD:tgui/packages/tgui/layouts/Pane.tsx
import { BoxProps } from '../components/Box';
import { useDebug } from '../debug';
import { Layout } from './Layout';

type Props = Partial<{
  theme: string;
}> &
  BoxProps;

export function Pane(props: Props) {
  const { theme, children, className, ...rest } = props;
  const { suspended } = useBackend();
  const { debugLayout = false } = useDebug();
========
import { Layout } from './Layout';

export const Pane = (props) => {
  const { theme, children, className, ...rest } = props;
  const { suspended, debug } = useBackend();
  let debugLayout = false;
  if (debug) {
    debugLayout = debug.debugLayout;
  }
>>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9:tgui/packages/tgui/layouts/Pane.jsx

  return (
    <Layout className={classes(['Window', className])} theme={theme} {...rest}>
      <Box fillPositionedParent className={debugLayout && 'debug-layout'}>
        {!suspended && children}
      </Box>
    </Layout>
  );
}

type ContentProps = Partial<{
  fitted: boolean;
  scrollable: boolean;
}> &
  BoxProps;

function PaneContent(props: ContentProps) {
  const { className, fitted, children, ...rest } = props;

  return (
    <Layout.Content
      className={classes(['Window__content', className])}
      {...rest}
    >
<<<<<<<< HEAD:tgui/packages/tgui/layouts/Pane.tsx
      {fitted ? (
        children
      ) : (
========
      {(fitted && children) || (
>>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9:tgui/packages/tgui/layouts/Pane.jsx
        <div className="Window__contentPadding">{children}</div>
      )}
    </Layout.Content>
  );
}

Pane.Content = PaneContent;
