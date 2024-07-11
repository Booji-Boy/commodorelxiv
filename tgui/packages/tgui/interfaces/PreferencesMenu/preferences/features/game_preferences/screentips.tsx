<<<<<<< HEAD
import {
  CheckboxInput,
  Feature,
  FeatureChoiced,
  FeatureColorInput,
  FeatureToggle,
} from '../base';
import { FeatureDropdownInput } from '../dropdowns';
=======
import { multiline } from 'common/string';
import {
  CheckboxInput,
  FeatureColorInput,
  FeatureToggle,
  Feature,
  FeatureChoiced,
  FeatureDropdownInput,
} from '../base';
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9

export const screentip_color: Feature<string> = {
  name: 'Screentips: Screentips color',
  category: 'UI',
  description: `
    The color of screen tips, the text you see when hovering over something.
  `,
  component: FeatureColorInput,
};

export const screentip_images: FeatureToggle = {
  name: 'Screentips: Allow images',
<<<<<<< HEAD
=======
  category: 'UI',
  description: multiline`When enabled, screentip hints use images for
    the mouse button rather than LMB/RMB.`,
  component: CheckboxInput,
};

export const screentip_pref: FeatureChoiced = {
  name: 'Screentips: Enable screentips',
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
  category: 'UI',
  description: `When enabled, screentip hints use images for
    the mouse button rather than LMB/RMB.`,
  component: CheckboxInput,
};

export const screentip_pref: FeatureChoiced = {
  name: 'Screentips: Enable screentips',
  category: 'UI',
  description: `
    Enables screen tips, the text you see when hovering over something.
    When set to "Only with tips", will only show when there is more information
    than just the name, such as what right-clicking it does.
  `,
  component: FeatureDropdownInput,
};
