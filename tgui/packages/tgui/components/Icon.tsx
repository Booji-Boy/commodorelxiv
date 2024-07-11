/**
 * @file
 * @copyright 2020 Aleksej Komarov
 * @license MIT
 */

<<<<<<< HEAD
import { BooleanLike, classes } from 'common/react';
import { ReactNode } from 'react';

=======
import { classes, pureComponentHooks } from 'common/react';
import { InfernoNode } from 'inferno';
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
import { BoxProps, computeBoxClassName, computeBoxProps } from './Box';

const FA_OUTLINE_REGEX = /-o$/;

<<<<<<< HEAD
type IconPropsUnique = { name: string } & Partial<{
  size: number;
  spin: BooleanLike;
  className: string;
  rotation: number;
  style: Partial<HTMLDivElement['style']>;
}>;
=======
type IconPropsUnique = {
  name: string;
  size?: number;
  spin?: boolean;
  className?: string;
  rotation?: number;
  style?: string | Record<string, string>;
};

export type IconProps = IconPropsUnique & BoxProps;

export const Icon = (props: IconProps) => {
  let { style, ...restlet } = props;
  const { name, size, spin, className, rotation, ...rest } = restlet;
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9

export type IconProps = IconPropsUnique & BoxProps;

export const Icon = (props: IconProps) => {
  const { name, size, spin, className, rotation, ...rest } = props;

  const customStyle = rest.style || {};
  if (size) {
<<<<<<< HEAD
    customStyle.fontSize = size * 100 + '%';
  }
  if (rotation) {
    customStyle.transform = `rotate(${rotation}deg)`;
  }
  rest.style = customStyle;
=======
    if (!style) {
      style = {};
    }
    style['font-size'] = size * 100 + '%';
  }
  if (rotation) {
    if (!style) {
      style = {};
    }
    style['transform'] = `rotate(${rotation}deg)`;
  }
  rest.style = style;
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9

  const boxProps = computeBoxProps(rest);

  let iconClass = '';
  if (name.startsWith('tg-')) {
    // tgfont icon
    iconClass = name;
  } else {
    // font awesome icon
    const faRegular = FA_OUTLINE_REGEX.test(name);
    const faName = name.replace(FA_OUTLINE_REGEX, '');
    const preprendFa = !faName.startsWith('fa-');

    iconClass = faRegular ? 'far ' : 'fas ';
    if (preprendFa) {
      iconClass += 'fa-';
    }
    iconClass += faName;
    if (spin) {
      iconClass += ' fa-spin';
    }
  }
  return (
    <i
      className={classes([
        'Icon',
        iconClass,
        className,
        computeBoxClassName(rest),
      ])}
      {...boxProps}
    />
  );
};

type IconStackUnique = {
  children: ReactNode;
  className?: string;
};

<<<<<<< HEAD
=======
type IconStackUnique = {
  children: InfernoNode;
  className?: string;
};

>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
export type IconStackProps = IconStackUnique & BoxProps;

export const IconStack = (props: IconStackProps) => {
  const { className, children, ...rest } = props;
  return (
    <span
<<<<<<< HEAD
      className={classes(['IconStack', className, computeBoxClassName(rest)])}
=======
      class={classes(['IconStack', className, computeBoxClassName(rest)])}
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
      {...computeBoxProps(rest)}
    >
      {children}
    </span>
  );
};

Icon.Stack = IconStack;
