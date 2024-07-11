<<<<<<< HEAD
import { classes } from 'common/react';
import { ReactNode, useEffect, useRef, useState } from 'react';

import { BoxProps, unit } from './Box';
import { Button } from './Button';
import { Icon } from './Icon';
import { Popper } from './Popper';

export type DropdownEntry = {
  displayText: ReactNode;
  value: string | number;
};

type DropdownOption = string | DropdownEntry;

type Props = {
  /** An array of strings which will be displayed in the
  dropdown when open. See Dropdown.tsx for more advanced usage with DropdownEntry */
  options: DropdownOption[];
  /** Called when a value is picked from the list, `value` is the value that was picked */
  onSelected: (value: any) => void;
  /** Currently selected entry to display. Can be left stateless to permanently display this value. */
  selected: DropdownOption | null | undefined;
} & Partial<{
  /** Whether to scroll automatically on open. Defaults to true */
  autoScroll: boolean;
  /** Whether to display previous / next buttons */
  buttons: boolean;
  /** Whether to clip the selected text */
  clipSelectedText: boolean;
  /** Color of dropdown button */
  color: string;
  /** Disables the dropdown */
  disabled: boolean;
  /** Overwrites selection text with this. Good for objects etc. */
  displayText: ReactNode;
  /** Icon to display in dropdown button */
  icon: string;
  /** Angle of the icon */
  iconRotation: number;
  /** Whether or not the icon should spin */
  iconSpin: boolean;
  /** Width of the dropdown menu. Default: 15rem */
  menuWidth: string;
  /** Whether or not the arrow on the right hand side of the dropdown button is visible */
  noChevron: boolean;
  /** Called when dropdown button is clicked */
  onClick: (event) => void;
  /** Dropdown renders over instead of below */
  over: boolean;
  /** Text to show when nothing has been selected. */
  placeholder: string;
}> &
  BoxProps;

enum DIRECTION {
  Previous = 'previous',
  Next = 'next',
  Current = 'current',
}

const NONE = -1;

function getOptionValue(option: DropdownOption) {
  return typeof option === 'string' ? option : option.value;
}

export function Dropdown(props: Props) {
  const {
    autoScroll = true,
    buttons,
    className,
    clipSelectedText = true,
    color = 'default',
    disabled,
    displayText,
    icon,
    iconRotation,
    iconSpin,
    menuWidth = '15rem',
    noChevron,
    onClick,
    onSelected,
    options = [],
    over,
    placeholder = 'Select...',
    selected,
    width = '15rem',
  } = props;

  const [open, setOpen] = useState(false);
  const adjustedOpen = over ? !open : open;
  const innerRef = useRef<HTMLDivElement>(null);

  const selectedIndex =
    options.findIndex((option) => getOptionValue(option) === selected) || 0;

  function scrollTo(position: number) {
    let scrollPos = position;
    if (position < selectedIndex) {
      scrollPos = position < 2 ? 0 : position - 2;
    } else {
      scrollPos =
        position > options.length - 3 ? options.length - 1 : position - 2;
    }

    const element = innerRef.current?.children[scrollPos];
    element?.scrollIntoView({ block: 'nearest' });
  }

  /** Update the selected value when clicking the left/right buttons */
  function updateSelected(direction: DIRECTION) {
    if (options.length < 1 || disabled) {
      return;
    }

    const startIndex = 0;
    const endIndex = options.length - 1;

    let newIndex: number;
    if (selectedIndex < 0) {
      newIndex = direction === 'next' ? endIndex : startIndex; // No selection yet
    } else if (direction === 'next') {
      newIndex = selectedIndex === endIndex ? startIndex : selectedIndex + 1; // Move to next option
    } else {
      newIndex = selectedIndex === startIndex ? endIndex : selectedIndex - 1; // Move to previous option
    }

    if (open && autoScroll) {
      scrollTo(newIndex);
    }
    onSelected?.(getOptionValue(options[newIndex]));
  }

  /** Allows the menu to be scrollable on open */
  useEffect(() => {
    if (!open) {
      return;
    }

    if (autoScroll && selectedIndex !== NONE) {
      scrollTo(selectedIndex);
    }

    innerRef.current?.focus();
  }, [open]);

  return (
    <Popper
      isOpen={open}
      onClickOutside={() => setOpen(false)}
      placement={over ? 'top-start' : 'bottom-start'}
      content={
        <div
          className="Layout Dropdown__menu"
          style={{ minWidth: menuWidth }}
          ref={innerRef}
        >
          {options.length === 0 && (
            <div className="Dropdown__menuentry">No options</div>
          )}

          {options.map((option, index) => {
            const value = getOptionValue(option);

            return (
              <div
                className={classes([
                  'Dropdown__menuentry',
                  selected === value && 'selected',
                ])}
                key={index}
                onClick={() => {
                  setOpen(false);
                  onSelected?.(value);
                }}
              >
                {typeof option === 'string' ? option : option.displayText}
              </div>
            );
          })}
        </div>
      }
    >
      <div className="Dropdown" style={{ width: unit(width) }}>
        <div
          className={classes([
            'Dropdown__control',
            'Button',
            'Button--dropdown',
            'Button--color--' + color,
            disabled && 'Button--disabled',
            className,
          ])}
          onClick={(event) => {
            if (disabled && !open) {
              return;
            }
            setOpen(!open);
            onClick?.(event);
          }}
        >
          {icon && (
            <Icon mr={1} name={icon} rotation={iconRotation} spin={iconSpin} />
          )}
          <span
            className="Dropdown__selected-text"
            style={{
              overflow: clipSelectedText ? 'hidden' : 'visible',
            }}
          >
            {displayText ||
              (selected && getOptionValue(selected)) ||
              placeholder}
          </span>
          {!noChevron && (
            <span className="Dropdown__arrow-button">
              <Icon name={adjustedOpen ? 'chevron-up' : 'chevron-down'} />
            </span>
          )}
        </div>
        {buttons && (
          <>
            <Button
              disabled={disabled}
              height={1.8}
              icon="chevron-left"
              onClick={() => {
                updateSelected(DIRECTION.Previous);
              }}
            />

            <Button
              disabled={disabled}
              height={1.8}
              icon="chevron-right"
              onClick={() => {
                updateSelected(DIRECTION.Next);
              }}
            />
          </>
        )}
      </div>
    </Popper>
  );
=======
import { createPopper, VirtualElement } from '@popperjs/core';
import { classes } from 'common/react';
import { Component, findDOMFromVNode, InfernoNode, render } from 'inferno';
import { Box, BoxProps } from './Box';
import { Button } from './Button';
import { Icon } from './Icon';
import { Stack } from './Stack';

export interface DropdownEntry {
  displayText: string | number | InfernoNode;
  value: string | number | Enumerator;
}

export type DropdownRequiredProps = {
  options: string[] | DropdownEntry[];
};

export type DropdownOptionalProps = {
  icon?: string;
  iconRotation?: number;
  clipSelectedText?: boolean;
  width?: string;
  menuWidth?: string;
  over?: boolean;
  color?: string;
  nochevron?: boolean;
  displayText?: string | number | InfernoNode;
  onClick?: (event) => void;
  // you freaks really are just doing anything with this shit
  selected?: any;
  onSelected?: (selected: any) => void;
  buttons?: boolean;
  displayHeight?: string;
};

export type DropdownUniqueProps = DropdownRequiredProps & DropdownOptionalProps;

export type DropdownProps = BoxProps & DropdownUniqueProps;

const DEFAULT_OPTIONS = {
  placement: 'left-start',
  modifiers: [
    {
      name: 'eventListeners',
      enabled: false,
    },
  ],
};
const NULL_RECT: DOMRect = {
  width: 0,
  height: 0,
  top: 0,
  right: 0,
  bottom: 0,
  left: 0,
  x: 0,
  y: 0,
  toJSON: () => null,
} as const;

type DropdownState = {
  selected?: string;
  open: boolean;
};

const DROPDOWN_DEFAULT_CLASSNAMES = 'Layout Dropdown__menu';
const DROPDOWN_SCROLL_CLASSNAMES = 'Layout Dropdown__menu-scroll';

export class Dropdown extends Component<DropdownProps, DropdownState> {
  static renderedMenu: HTMLDivElement | undefined;
  static singletonPopper: ReturnType<typeof createPopper> | undefined;
  static currentOpenMenu: Element | undefined;
  static virtualElement: VirtualElement = {
    getBoundingClientRect: () =>
      Dropdown.currentOpenMenu?.getBoundingClientRect() ?? NULL_RECT,
  };
  menuContents: any;
  handleClick: any;
  state: DropdownState = {
    open: false,
  };

  constructor(props) {
    super(props);

    this.state = {
      selected: props.selected,
      open: props.open,
    };

    this.handleClick = () => {
      if (this.state.open) {
        this.setOpen(false);
      }
    };
  }

  getDOMNode() {
    return findDOMFromVNode(this.$LI, true);
  }

  componentDidMount() {
    const domNode = this.getDOMNode();

    if (!domNode) {
      return;
    }
  }

  openMenu() {
    let renderedMenu = Dropdown.renderedMenu;
    if (renderedMenu === undefined) {
      renderedMenu = document.createElement('div');
      renderedMenu.className = DROPDOWN_DEFAULT_CLASSNAMES;
      document.body.appendChild(renderedMenu);
      Dropdown.renderedMenu = renderedMenu;
    }

    const domNode = this.getDOMNode()!;
    Dropdown.currentOpenMenu = domNode;

    renderedMenu.scrollTop = 0;
    renderedMenu.style.width =
      this.props.menuWidth ||
      // Hack, but domNode should *always* be the parent control meaning it will have width
      // @ts-ignore
      `${domNode.offsetWidth}px`;
    renderedMenu.style.opacity = '1';
    renderedMenu.style.pointerEvents = 'auto';

    // ie hack
    // ie has this bizarre behavior where focus just silently fails if the
    // element being targeted "isn't ready"
    // 400 is probably way too high, but the lack of hotloading is testing my
    // patience on tuning it
    // I'm beyond giving a shit at this point it fucking works whatever
    setTimeout(() => {
      Dropdown.renderedMenu?.focus();
    }, 400);
    this.renderMenuContent();
  }

  closeMenu() {
    if (Dropdown.currentOpenMenu !== this.getDOMNode()) {
      return;
    }

    Dropdown.currentOpenMenu = undefined;
    Dropdown.renderedMenu!.style.opacity = '0';
    Dropdown.renderedMenu!.style.pointerEvents = 'none';
  }

  componentWillUnmount() {
    this.closeMenu();
    this.setOpen(false);
  }

  renderMenuContent() {
    const renderedMenu = Dropdown.renderedMenu;
    if (!renderedMenu) {
      return;
    }
    if (renderedMenu.offsetHeight > 200) {
      renderedMenu.className = DROPDOWN_SCROLL_CLASSNAMES;
    } else {
      renderedMenu.className = DROPDOWN_DEFAULT_CLASSNAMES;
    }

    const { options = [] } = this.props;
    const ops = options.map((option) => {
      let value, displayText;

      if (typeof option === 'string') {
        displayText = option;
        value = option;
      } else if (option !== null) {
        displayText = option.displayText;
        value = option.value;
      }

      return (
        <div
          key={value}
          className="Dropdown__menuentry"
          onClick={() => {
            this.setSelected(value);
          }}
        >
          {displayText}
        </div>
      );
    });

    const to_render = ops.length ? ops : 'No Options Found';

    render(<div>{to_render}</div>, renderedMenu, () => {
      let singletonPopper = Dropdown.singletonPopper;
      if (singletonPopper === undefined) {
        singletonPopper = createPopper(Dropdown.virtualElement, renderedMenu!, {
          ...DEFAULT_OPTIONS,
          placement: 'bottom-start',
        });

        Dropdown.singletonPopper = singletonPopper;
      } else {
        singletonPopper.setOptions({
          ...DEFAULT_OPTIONS,
          placement: 'bottom-start',
        });

        singletonPopper.update();
      }
    });
  }

  setOpen(open: boolean) {
    this.setState((state) => ({
      ...state,
      open,
    }));
    if (open) {
      setTimeout(() => {
        this.openMenu();
        window.addEventListener('click', this.handleClick);
      });
    } else {
      this.closeMenu();
      window.removeEventListener('click', this.handleClick);
    }
  }

  setSelected(selected: string) {
    this.setState((state) => ({
      ...state,
      selected,
    }));
    this.setOpen(false);
    if (this.props.onSelected) {
      this.props.onSelected(selected);
    }
  }

  getOptionValue(option): string {
    return typeof option === 'string' ? option : option.value;
  }

  getSelectedIndex(): number {
    const selected = this.state.selected || this.props.selected;
    const { options = [] } = this.props;

    return options.findIndex((option) => {
      return this.getOptionValue(option) === selected;
    });
  }

  toPrevious(): void {
    const selectedIndex = this.getSelectedIndex();

    if (selectedIndex < 0) {
      return;
    }

    const endIndex = this.props.options.length - 1;
    const previousIndex = selectedIndex === 0 ? endIndex : selectedIndex - 1;

    this.setSelected(this.getOptionValue(this.props.options[previousIndex]));
  }

  toNext(): void {
    const selectedIndex = this.getSelectedIndex();

    if (selectedIndex < 0) {
      return;
    }

    const endIndex = this.props.options.length - 1;
    const nextIndex = selectedIndex === endIndex ? 0 : selectedIndex + 1;

    this.setSelected(this.getOptionValue(this.props.options[nextIndex]));
  }

  render() {
    const { props } = this;
    const {
      icon,
      iconRotation,
      iconSpin,
      clipSelectedText = true,
      color = 'default',
      dropdownStyle,
      over,
      nochevron,
      width,
      onClick,
      onSelected,
      selected,
      disabled,
      displayText,
      displayHeight,
      buttons,
      ...boxProps
    } = props;
    const { className, ...rest } = boxProps;

    const adjustedOpen = over ? !this.state.open : this.state.open;

    return (
      <Stack fill height={displayHeight}>
        <Stack.Item width={width}>
          <Box
            width={'100%'}
            className={classes([
              'Dropdown__control',
              'Button',
              'Button--color--' + color,
              disabled && 'Button--disabled',
              className,
            ])}
            onClick={(event) => {
              if (disabled && !this.state.open) {
                return;
              }
              this.setOpen(!this.state.open);
              if (onClick) {
                onClick(event);
              }
            }}
            {...rest}
          >
            {icon && (
              <Icon
                name={icon}
                rotation={iconRotation}
                spin={iconSpin}
                mr={1}
              />
            )}
            <span
              className="Dropdown__selected-text"
              style={{
                overflow: clipSelectedText ? 'hidden' : 'visible',
              }}
            >
              {displayText || this.state.selected}
            </span>
            {nochevron || (
              <span
                className="Dropdown__arrow-button"
                style={{ 'line-height': displayHeight }}
              >
                <Icon name={adjustedOpen ? 'chevron-up' : 'chevron-down'} />
              </span>
            )}
          </Box>
        </Stack.Item>
        {buttons && (
          <>
            <Stack.Item height={'100%'}>
              <Button
                height={'100%'}
                content={
                  <Icon
                    ml="0.25em"
                    style={{
                      display: 'inline-block',
                      'line-height': displayHeight || 'unset',
                    }}
                    name="chevron-left"
                  />
                }
                p={0}
                disabled={disabled}
                onClick={() => {
                  if (disabled) {
                    return;
                  }

                  this.toPrevious();
                }}
              />
            </Stack.Item>
            <Stack.Item height={'100%'}>
              <Button
                height={'100%'}
                content={
                  <Icon
                    ml="0.25em"
                    style={{
                      display: 'inline-block',
                      'line-height': displayHeight || 'unset',
                    }}
                    name="chevron-right"
                  />
                }
                p={0}
                disabled={disabled}
                onClick={() => {
                  if (disabled) {
                    return;
                  }

                  this.toNext();
                }}
              />
            </Stack.Item>
          </>
        )}
      </Stack>
    );
  }
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
}
