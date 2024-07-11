import { Button } from 'tgui/components';
import { createRenderer } from 'tgui/renderer';
import type { InfernoNode } from 'inferno';

const render = createRenderer();

export const SingleButton = () => {
  const node = <Button>Hello world!</Button>;
  render(node);
};

export const SingleButtonWithCallback = () => {
  const node = <Button onClick={() => undefined}>Hello world!</Button>;
  render(node);
};

export const ListOfButtons = () => {
  const nodes: InfernoNode[] = [];
  for (let i = 0; i < 100; i++) {
    const node = <Button key={i}>Hello world! {i}</Button>;
    nodes.push(node);
  }
  render(<div>{nodes}</div>);
};

export const ListOfButtonsWithCallback = () => {
  const nodes: InfernoNode[] = [];
  for (let i = 0; i < 100; i++) {
    const node = (
      <Button key={i} onClick={() => undefined}>
        Hello world! {i}
      </Button>
    );
    nodes.push(node);
  }
  render(<div>{nodes}</div>);
};

<<<<<<< HEAD
=======
export const ListOfButtonsWithLinkEvent = () => {
  const nodes: InfernoNode[] = [];
  for (let i = 0; i < 100; i++) {
    const node = (
      <Button key={i} onClick={linkEvent(null, handleClick)}>
        Hello world! {i}
      </Button>
    );
    nodes.push(node);
  }
  render(<div>{nodes}</div>);
};

>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
export const ListOfButtonsWithIcons = () => {
  const nodes: InfernoNode[] = [];
  for (let i = 0; i < 100; i++) {
    const node = (
      <Button key={i} icon={'arrow-left'}>
        Hello world! {i}
      </Button>
    );
    nodes.push(node);
  }
  render(<div>{nodes}</div>);
};

export const ListOfButtonsWithTooltips = () => {
  const nodes: InfernoNode[] = [];
  for (let i = 0; i < 100; i++) {
    const node = (
      <Button key={i} tooltip={'Hello world!'}>
        Hello world! {i}
      </Button>
    );
    nodes.push(node);
  }
  render(<div>{nodes}</div>);
};
