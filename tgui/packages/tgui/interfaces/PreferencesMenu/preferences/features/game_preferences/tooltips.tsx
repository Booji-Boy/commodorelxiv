<<<<<<< HEAD
=======
import { multiline } from 'common/string';
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
import {
  CheckboxInput,
  Feature,
  FeatureNumberInput,
  FeatureToggle,
} from '../base';

export const enable_tips: FeatureToggle = {
  name: 'Enable tooltips',
  category: 'TOOLTIPS',
  description: `
    Do you want to see tooltips when hovering over items?
  `,
  component: CheckboxInput,
};

export const tip_delay: Feature<number> = {
  name: 'Tooltip delay (in milliseconds)',
  category: 'TOOLTIPS',
  description: `
    How long should it take to see a tooltip when hovering over items?
  `,
  component: FeatureNumberInput,
};
