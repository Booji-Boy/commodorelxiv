<<<<<<< HEAD
import { Placement } from '@popperjs/core';
import {
  PropsWithChildren,
  ReactNode,
  useEffect,
  useRef,
  useState,
} from 'react';
import { usePopper } from 'react-popper';

type RequiredProps = {
  /** The content to display in the popper */
  content: ReactNode;
  /** Whether the popper is open */
  isOpen: boolean;
=======
import { createPopper } from '@popperjs/core';
import { ArgumentsOf } from 'common/types';
import { Component, findDOMFromVNode, render } from 'inferno';
import type { InfernoNode } from 'inferno';
import type { PropertiesHyphen } from 'csstype';

type PopperProps = {
  popperContent: InfernoNode;
  options?: ArgumentsOf<typeof createPopper>[2];
  additionalStyles?: PropertiesHyphen;
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
};

type OptionalProps = Partial<{
  /** Called when the user clicks outside the popper */
  onClickOutside: () => void;
  /** Where to place the popper relative to the reference element */
  placement: Placement;
  /** Base z-index of the popper div
   * @default 5
   */
  baseZIndex: number;
}>;

type Props = RequiredProps & OptionalProps;

/**
 * ## Popper
 *  Popper lets you position elements so that they don't go out of the bounds of the window.
 * @url https://popper.js.org/react-popper/ for more information.
 */
export function Popper(props: PropsWithChildren<Props>) {
  const { children, content, isOpen, onClickOutside, placement } = props;

  const [referenceElement, setReferenceElement] =
    useState<HTMLDivElement | null>(null);
  const [popperElement, setPopperElement] = useState<HTMLDivElement | null>(
    null,
  );

  // One would imagine we could just use useref here, but it's against react-popper documentation and causes a positioning bug
  // We still need them to call focus and clickoutside events :(
  const popperRef = useRef<HTMLDivElement | null>(null);
  const parentRef = useRef<HTMLDivElement | null>(null);

  const { styles, attributes } = usePopper(referenceElement, popperElement, {
    placement,
  });

  /** Close the popper when the user clicks outside */
  function handleClickOutside(event: MouseEvent) {
    if (
      !popperRef.current?.contains(event.target as Node) &&
      !parentRef.current?.contains(event.target as Node)
    ) {
      onClickOutside?.();
    }
  }

  useEffect(() => {
    if (isOpen) {
      document.addEventListener('mousedown', handleClickOutside);
    } else {
      document.removeEventListener('mousedown', handleClickOutside);
    }

    return () => {
      document.removeEventListener('mousedown', handleClickOutside);
    };
  }, [isOpen]);

<<<<<<< HEAD
  return (
    <>
      <div
        ref={(node) => {
          setReferenceElement(node);
          parentRef.current = node;
        }}
      >
        {children}
      </div>
      {isOpen && (
        <div
          ref={(node) => {
            setPopperElement(node);
            popperRef.current = node;
          }}
          style={{ ...styles.popper, zIndex: props.baseZIndex ?? 5 }}
          {...attributes.popper}
        >
          {content}
        </div>
      )}
    </>
  );
=======
      // HACK: We don't want to create a wrapper, as it could break the layout
      // of consumers, so we do the inferno equivalent of `findDOMNode(this)`.
      // This is usually bad as refs are usually better, but refs did
      // not work in this case, as they weren't propagating correctly.
      // A previous attempt was made as a render prop that passed an ID,
      // but this made consuming use too unweildy.
      // This code is copied from `findDOMNode` in inferno-extras.
      // Because this component is written in TypeScript, we will know
      // immediately if this internal variable is removed.
      const domNode = findDOMFromVNode(this.$LI, true);
      if (!domNode) {
        return;
      }

      this.popperInstance = createPopper(
        domNode,
        this.renderedContent,
        options,
      );
    });
  }

  componentDidUpdate() {
    this.renderPopperContent(() => this.popperInstance?.update());
  }

  componentWillUnmount() {
    this.popperInstance?.destroy();
    this.renderedContent.remove();
  }

  renderPopperContent(callback: () => void) {
    // `render` errors when given false, so we convert it to `null`,
    // which is supported.
    render(this.props.popperContent || null, this.renderedContent, callback);
  }

  render() {
    return this.props.children;
  }
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
}
