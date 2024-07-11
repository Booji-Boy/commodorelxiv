<<<<<<< HEAD
import { exhaustiveCheck } from 'common/exhaustive';
=======
import { Dropdown, Icon } from '../../components';
import { RandomSetting } from './data';
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9

import { Dropdown } from '../../components';
import { RandomSetting } from './data';

const options = [
  {
    displayText: 'Do not randomize',
    value: RandomSetting.Disabled,
  },

  {
    displayText: 'Always randomize',
    value: RandomSetting.Enabled,
  },

  {
    displayText: 'Randomize when antagonist',
    value: RandomSetting.AntagOnly,
  },
];

export const RandomizationButton = (props: {
  dropdownProps?: Record<string, unknown>;
  setValue: (newValue: RandomSetting) => void;
  value?: RandomSetting;
}) => {
  const { dropdownProps = {}, setValue, value } = props;

  let color;

  switch (value) {
    case RandomSetting.AntagOnly:
      color = 'orange';
      break;
    case RandomSetting.Disabled:
      color = 'red';
      break;
    case RandomSetting.Enabled:
      color = 'green';
      break;
  }

  return (
    <Dropdown
      color={color}
      {...dropdownProps}
      clipSelectedText={false}
      icon="dice-d20"
      options={options}
      noChevron
      onSelected={setValue}
      menuWidth="120px"
<<<<<<< HEAD
      width={1.85}
      selected="None"
=======
      width="auto"
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
    />
  );
};
